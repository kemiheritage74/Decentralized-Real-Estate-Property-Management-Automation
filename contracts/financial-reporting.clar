;; Financial Reporting Contract
;; Generates and manages property financial reports

(define-constant ERR_UNAUTHORIZED (err u500))
(define-constant ERR_REPORT_NOT_FOUND (err u501))

;; Data structures
(define-map financial-reports uint {
    property-id: uint,
    manager: principal,
    period-start: uint,
    period-end: uint,
    total-rent-collected: uint,
    total-expenses: uint,
    maintenance-costs: uint,
    net-income: uint,
    occupancy-rate: uint,
    generated-at: uint
})

(define-map expense-records uint {
    property-id: uint,
    category: (string-ascii 50),
    amount: uint,
    description: (string-ascii 200),
    recorded-at: uint
})

(define-data-var next-report-id uint u1)
(define-data-var next-expense-id uint u1)

;; Read-only functions
(define-read-only (get-financial-report (report-id uint))
    (map-get? financial-reports report-id)
)

(define-read-only (get-expense-record (expense-id uint))
    (map-get? expense-records expense-id)
)

;; Public functions
(define-public (record-expense
    (property-id uint)
    (category (string-ascii 50))
    (amount uint)
    (description (string-ascii 200)))
    (let ((expense-id (var-get next-expense-id)))
        (map-set expense-records expense-id {
            property-id: property-id,
            category: category,
            amount: amount,
            description: description,
            recorded-at: block-height
        })
        (var-set next-expense-id (+ expense-id u1))
        (ok expense-id)
    )
)

(define-public (generate-financial-report
    (property-id uint)
    (period-start uint)
    (period-end uint)
    (total-rent-collected uint)
    (total-expenses uint)
    (maintenance-costs uint)
    (occupancy-rate uint))
    (let ((report-id (var-get next-report-id))
          (net-income (- total-rent-collected total-expenses)))

        (map-set financial-reports report-id {
            property-id: property-id,
            manager: tx-sender,
            period-start: period-start,
            period-end: period-end,
            total-rent-collected: total-rent-collected,
            total-expenses: total-expenses,
            maintenance-costs: maintenance-costs,
            net-income: net-income,
            occupancy-rate: occupancy-rate,
            generated-at: block-height
        })

        (var-set next-report-id (+ report-id u1))
        (ok report-id)
    )
)

(define-public (update-expense-record
    (expense-id uint)
    (category (string-ascii 50))
    (amount uint)
    (description (string-ascii 200)))
    (let ((expense-data (unwrap! (map-get? expense-records expense-id) ERR_REPORT_NOT_FOUND)))
        (map-set expense-records expense-id {
            property-id: (get property-id expense-data),
            category: category,
            amount: amount,
            description: description,
            recorded-at: (get recorded-at expense-data)
        })
        (ok true)
    )
)

;; Calculate total expenses for a property in a given period
(define-read-only (calculate-period-expenses (property-id uint) (start-block uint) (end-block uint))
    ;; This is a simplified calculation - in a real implementation,
    ;; you would iterate through expense records for the period
    u0
)

;; Calculate occupancy rate for a property
(define-read-only (calculate-occupancy-rate (property-id uint) (total-units uint) (occupied-units uint))
    (if (> total-units u0)
        (/ (* occupied-units u100) total-units)
        u0
    )
)

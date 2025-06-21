# Decentralized Real Estate Property Management Automation

A comprehensive blockchain-based property management system built with Clarity smart contracts for the Stacks blockchain.

## Overview

This system provides a decentralized solution for managing real estate properties, including tenant management, rent collection, maintenance coordination, and financial reporting. All operations are handled through smart contracts, ensuring transparency and automation.

## Features

### 🏢 Property Manager Verification
- Validates property manager credentials
- License verification system
- Manager approval workflow
- Active status management

### 👥 Tenant Management
- Property registration
- Tenant onboarding
- Lease agreement management
- Occupancy tracking

### 🔧 Maintenance Coordination
- Maintenance request submission
- Contractor registration and assignment
- Work order tracking
- Cost management

### 💰 Rent Collection
- Automated payment processing
- Late fee calculation
- Escrow account management
- Payment history tracking

### 📊 Financial Reporting
- Income and expense tracking
- Property performance metrics
- Occupancy rate calculations
- Automated report generation

## Smart Contracts

### 1. Property Manager Verification (\`property-manager-verification.clar\`)
Handles the verification and management of property managers.

**Key Functions:**
- \`submit-verification\`: Submit credentials for verification
- \`approve-manager\`: Approve a property manager (owner only)
- \`is-verified-manager\`: Check if a manager is verified

### 2. Tenant Management (\`tenant-management.clar\`)
Manages tenant information and lease agreements.

**Key Functions:**
- \`register-property\`: Register a new property
- \`add-tenant\`: Add a tenant to a property
- \`terminate-lease\`: End a lease agreement

### 3. Maintenance Coordination (\`maintenance-coordination.clar\`)
Coordinates maintenance requests and contractor assignments.

**Key Functions:**
- \`submit-maintenance-request\`: Submit a maintenance request
- \`register-contractor\`: Register as a contractor
- \`assign-contractor\`: Assign work to a contractor
- \`complete-maintenance\`: Mark maintenance as completed

### 4. Rent Collection (\`rent-collection.clar\`)
Automates rent collection and payment processing.

**Key Functions:**
- \`set-payment-schedule\`: Set up payment terms
- \`pay-rent\`: Process rent payment
- \`deposit-to-escrow\`: Add funds to escrow
- \`process-late-payment\`: Handle late payments

### 5. Financial Reporting (\`financial-reporting.clar\`)
Generates financial reports and tracks expenses.

**Key Functions:**
- \`record-expense\`: Record property expenses
- \`generate-financial-report\`: Create financial reports
- \`calculate-occupancy-rate\`: Calculate property occupancy

## Getting Started

### Prerequisites
- Stacks blockchain node
- Clarity CLI tools
- Node.js and npm (for testing)

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd real-estate-management
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

### Deployment

Deploy contracts to the Stacks blockchain:

\`\`\`bash
# Deploy property manager verification
clarinet deploy property-manager-verification.clar

# Deploy tenant management
clarinet deploy tenant-management.clar

# Deploy maintenance coordination
clarinet deploy maintenance-coordination.clar

# Deploy rent collection
clarinet deploy rent-collection.clar

# Deploy financial reporting
clarinet deploy financial-reporting.clar
\`\`\`

## Usage Examples

### Register as a Property Manager
\`\`\`clarity
(contract-call? .property-manager-verification submit-verification "John Doe" "PM123456")
\`\`\`

### Add a New Property
\`\`\`clarity
(contract-call? .tenant-management register-property "123 Main St, City, State" u1500)
\`\`\`

### Submit Maintenance Request
\`\`\`clarity
(contract-call? .maintenance-coordination submit-maintenance-request u1 "Leaky faucet in kitchen" "medium")
\`\`\`

### Pay Rent
\`\`\`clarity
(contract-call? .rent-collection pay-rent u12 u2024)
\`\`\`

## Architecture

The system follows a modular architecture with separate contracts for each major function:

\`\`\`
┌─────────────────────────────────────┐
│         Property Manager            │
│        Verification Layer           │
└─────────────────────────────────────┘
│
┌─────────────────────────────────────┐
│          Core Management            │
│     ┌─────────┬─────────────────┐   │
│     │ Tenant  │   Maintenance   │   │
│     │   Mgmt  │  Coordination   │   │
│     └─────────┴─────────────────┘   │
└─────────────────────────────────────┘
│
┌─────────────────────────────────────┐
│        Financial Layer              │
│     ┌─────────┬─────────────────┐   │
│     │  Rent   │   Financial     │   │
│     │Collection│   Reporting     │   │
│     └─────────┴─────────────────┘   │
└─────────────────────────────────────┘
\`\`\`

## Security Considerations

- All contracts include proper authorization checks
- Input validation on all public functions
- Error handling with descriptive error codes
- Separation of concerns between contracts

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions and support, please open an issue in the GitHub repository.

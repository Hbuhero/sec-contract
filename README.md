# CertChain Smart Contract

## Overview
CertChain is a Solidity smart contract designed for issuing and verifying academic certificates on the blockchain. The contract provides a decentralized solution for certificate management, ensuring immutability and transparency in academic credential verification.

## Features
- 🎓 **Certificate Issuance**: Authorized admins can issue certificates with IPFS storage
- ✅ **Certificate Verification**: Public verification of certificate authenticity
- 🏛️ **Admin Management**: Role-based access control for educational institutions
- 📋 **Multiple Certificate Types**: Support for degrees, transcripts, diplomas, and other credentials
- 🔒 **Revocation System**: Ability to revoke certificates when necessary
- 📊 **IPFS Integration**: Off-chain storage of certificate documents

## Contract Structure

### Data Structures
- **Admin**: Contains admin name and university information
- **Certificate**: Stores certificate hash, IPFS CID, type, issuer, timestamp, and revocation status
- **CertificateType**: Enum for DEGREE, TRANSCRIPT, DIPLOMA, OTHER

### Key Functions
- `issueCertificate()`: Issue a new certificate (admin only)
- `verifyCertificate()`: Verify certificate validity
- `getCertificate()`: Retrieve certificate details
- `getAdmin()`: Get admin information
- `isAdmin()`: Check admin status

## Prerequisites
- [Foundry](https://getfoundry.sh/) - Ethereum development toolchain
- [Git](https://git-scm.com/) - Version control


## Installation

### 1. Install Foundry
```bash
# Install Foundry
curl -L https://foundry.paradigm.xyz | bash

# Restart your terminal or run:
source ~/.bashrc

# Install the latest version
foundryup
```

### 2. Verify Foundry Installation
```bash
forge --version
cast --version
anvil --version
```

### 3. Clone and Setup Project
```bash
# Clone your project repository
git clone <your-repo-url>
cd certchain-contract

# Initialize Foundry project (if not already done)
forge init

# Install dependencies
forge install
```

## Environment Setup
Create a `.env` file in your project root:

```bash
# Private key for deployment (without 0x prefix)
PRIVATE_KEY=your_private_key_here

# RPC URLs
SEPOLIA_RPC_URL=https://sepolia.infura.io/v3/your_infura_key
MAINNET_RPC_URL=https://mainnet.infura.io/v3/your_infura_key

# Etherscan API key for verification
ETHERSCAN_API_KEY=your_etherscan_api_key

```

## Deployment
Use the Makefile in the src directory to make deployments. Change the .env file as seen fit to enable smooth deployment using Make. Else you can use Foundry commands [see here](https://getfoundry.sh/)


## Security Considerations
- Only authorized admins can issue certificates
- Certificate hashes should be unique and unpredictable
- IPFS CIDs should point to authentic certificate documents
- Consider implementing multi-signature for critical operations
- Regular security audits are recommended

## Gas Optimization
- Use `bytes32` for certificate hashes (efficient storage)
- Pack structs efficiently to minimize storage slots
- Consider batch operations for multiple certificates

## Contributing
1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact
For questions or support, please contact:
- 📧 Email: support@certchain.tz
- 🐦 Twitter: @CertChain
- 💬 Discord: [Join our community](https://discord.gg/certchain)

---
*Built with ❤️ using Foundry*

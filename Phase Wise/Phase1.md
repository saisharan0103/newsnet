# 🪙 Tokenomics Parameters (For Task 1.1)

## Reward Model:
- 10 $NEWS tokens per upvote received on a story
- Bonus: Top 3 voted stories per day receive 50 extra $NEWS
- Only reward stories that pass AI moderation AND reach ≥3 votes to keep garbage off-chain

## Reward Limits:
- Max 200 $NEWS per story
- Max 500 $NEWS per user per day
- Total supply cap: 1,000,000 $NEWS

## Voting Weight Logic:
- 1 wallet = 1 vote per story
- Votes cannot be changed once cast
- Cooldown: 1 vote per minute to prevent spamming

---

# 🪙 NewsToken.sol Parameters (For Task 1.2)

- **Name**: NewsToken
- **Symbol**: NEWS
- **Decimals**: 18

## Roles:
- `NewsDAO.sol` will have the minter role
- Deployer wallet is owner, can renounce ownership later
- No transfer restrictions

---

# 📜 Governance & Story Submission Rules (For Task 1.3)

## Story Fields:
- `title` (string, 100 char max)
- `ipfsHash` (CID only)
- `location` (string, optional)
- `submittedBy` (address)

## Who Can Submit:
- Any wallet-connected user (no KYC)

## Who Can Vote:
- Any wallet-connected user
- Must wait 60 seconds between votes

---

# 🌐 Preferred Test Network (For Task 1.5)

- **Network**: Polygon Mumbai (faster, cheaper, more stable for hackathons)
- **RPC Provider**: Alchemy
- **Network ID**: 80001
- **Test Wallet**: Provided via `.env` (replaceable)

---

# 🧾 Verification & Deployment Resources (For Task 1.6)

- **Polygonscan API Key**: To be added via `.env`
- **Deployer Address**: Will use `.env`-secured private key
- **Contract Owner Address**: Same as deployer for MVP

## 📄 ReadMe Format:
- Standard Markdown with:
  - Deployed contract addresses
  - ABI location (e.g., `/artifacts/`)
  - Tokenomics summary

---

# 🗂️ Repository & Environment Setup

## Branching Model:
- `main`: stable release branch
- `dev`: active feature development
- `contracts/feature-name`: for each smart contract module

## CI/CD:
- Skip for hackathon, optional post-event

## Tooling:
- Hardhat
- Mocha/Chai
- dotenv
- OpenZeppelin
- Ethers.js

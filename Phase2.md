# 🛠️ Backend API & Database Development (Phase 2)

---

## 🧱 Project Architecture & Tech Stack (For Task 2.1)

### Tech Stack:
- **Runtime**: Node.js (v18+)
- **Framework**: Express.js
- **DB**: MongoDB (via MongoDB Atlas)
- **ORM**: Mongoose
- **Web3**: Ethers.js
- **AI Integration**: Gemini API (Moderation & Sentiment Analysis)

### Folder Structure:
- ** Generate a complete and optimized folder structure for my decentralized news platform. Feel free to add any extra folders or files (like constants, utils, middleware, ABI, tests, etc.) that improve organization and scalability.Structure it clearly for both frontend and backend, including smart contracts.


### Environment Variables (.env):
- **List all essential .env environment variables required for my decentralized news platform MVP backend, covering MongoDB, OpenAI or Gemini API, smart contract deployment/interactions, and Web3 provider config (Infura or Alchemy). Add any additional keys or configs you think are necessary for a smooth hackathon build.**

---

## 🗃️ MongoDB Schema Design (For Task 2.2)

### Collections:

#### 🧾 `Story`
- `title: String`
- `ipfsHash: String`
- `location: String`
- `submittedBy: String` (wallet address)
- `votes: Number`
- `status: Enum [pending, approved, rejected]`
- `createdAt: Date`

#### 🔐 `User`
- `walletAddress: String` (PK)
- `dailyRewardCount: Number`
- `lastVoteTimestamp: Date`

#### 📋 `VoteLog`
- `storyId: ObjectId`
- `voterAddress: String`
- `timestamp: Date`

#### 🚨 `ModerationLog`
- `storyId: ObjectId`
- `sentimentScore: Number`
- `contentFlagged: Boolean`
- `timestamp: Date`

---

## 🧩 REST API Endpoints (For Task 2.3)

### Core Routes:
- `POST /api/story` – Submit a new story (AI moderation)
- `GET /api/stories` – List approved stories
- `GET /api/story/:id` – View story detail
- `POST /api/vote` – Vote on a story
- `GET /api/user/:walletAddress/tokens` – Fetch token reward info

### Notes:
- Use `Ethers.js` to call smart contract functions
- IPFS hash stored off-chain
- AI moderation must approve before DB insert

---

## 🧠 AI Moderation Integration (For Task 2.4)

### Gemini APIs:
- **Moderation**: Detects spam, hate, violence, etc.
- **Sentiment**: Score range [-1, 1], used to filter extreme bias

### Flow:
1. On story submission → send to Gemini
2. If clean → save to DB with status `approved`
3. If flagged → store as `rejected`, log reason

---

## 🔐 Auth Logic (For Task 2.5 – Optional)

- **Design the authentication logic for my decentralized news platform MVP backend. Choose the most suitable method considering Web3 wallets, simplicity, and hackathon constraints. Provide a clean, secure flow that aligns well with the existing tech stack (Node.js, Express, MongoDB, Ethers.js).**

---

## 🧪 Unit Testing Strategy (For Task 2.6)

### Tools:
- **Mocha + Chai** for logic and endpoints
- **Supertest** for REST endpoint tests

### Focus Areas:
- Story submission & moderation
- Vote timing & duplicate prevention
- Contract mocks for testing
- Token limit logic

---

## 🧱 Preferred Backend Libraries
Suggest the most appropriate and efficient libraries for each category in my decentralized news platform MVP backend (Node.js/Express), including Web3 integration, MongoDB, AI API calls, auth, testing, and logging. You may replace or add tools if they better align with performance, scalability, or simplicity for a hackathon environment.

---

## 🗂️ Repository Structure & Branching

### Branching:
- `main`: production-ready
- `dev-backend`: development
- Feature branches: `backend/story-api`, `backend/vote-api`, etc.

---

## ⚠️ Pitfalls & Mitigations

| Pitfall | Mitigation |
|--------|-------------|
| Gemini Rate Limits | Retry queue or fallback moderation model |
| Story Spam | Check IPFS hash + wallet to avoid duplicates |
| Vote Spamming | Rate-limit with DB timestamps & contract cooldown |
| Contract Failures | Use fallback/mocked service in dev |
| MongoDB Failure | MongoDB Atlas + automated backups |

---

## ✅ Critical Path Dependencies

- Backend APIs must be ready before frontend integration
- Gemini moderation logic must gate the reward logic
- Web3 contract calls must be tested before voting flow goes live

---


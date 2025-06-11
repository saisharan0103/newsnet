# 🛠️ Backend API & Database Development (Phase 2)

---

## 🧱 Project Architecture & Tech Stack (For Task 2.1)

### Tech Stack:
- **Runtime**: Node.js (v18+)
- **Framework**: Express.js
- **DB**: MongoDB (via MongoDB Atlas)
- **ORM**: Mongoose
- **Web3**: Ethers.js
- **AI Integration**: OpenAI API (Moderation & Sentiment Analysis)

### Folder Structure:
- **/backend**
- **/controllers**
- **/routes**
- **/models**
- **/services**
- **/middlewares**
- **/utils**
- **app.js**
- **.env**


### Environment Variables (.env):
- `MONGO_URI`
- `OPENAI_API_KEY`
- `CONTRACT_ADDRESS_NEWSDAO`
- `CONTRACT_ADDRESS_NEWSTOKEN`
- `PRIVATE_KEY`
- `INFURA_RPC_URL` or `ALCHEMY_RPC_URL`

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

### OpenAI APIs:
- **Moderation**: Detects spam, hate, violence, etc.
- **Sentiment**: Score range [-1, 1], used to filter extreme bias

### Flow:
1. On story submission → send to OpenAI
2. If clean → save to DB with status `approved`
3. If flagged → store as `rejected`, log reason

---

## 🔐 Auth Logic (For Task 2.5 – Optional)

### Option A: Wallet Signature Auth
- MetaMask signs nonce
- Server verifies signature with `ethers.utils.verifyMessage`

### Option B: JWT (Hackathon Simple)
- Use `passport-jwt` or `express-jwt`
- Map wallet address → token identity

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

| Purpose | Library |
|--------|--------|
| API Framework | `express` |
| Web3 Integration | `ethers` |
| MongoDB ORM | `mongoose` |
| AI Requests | `axios` |
| Auth | `passport-jwt` |
| Testing | `mocha`, `chai`, `supertest` |
| Env Config | `dotenv` |
| Logger | `morgan`, `winston` |

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
| OpenAI Rate Limits | Retry queue or fallback moderation model |
| Story Spam | Check IPFS hash + wallet to avoid duplicates |
| Vote Spamming | Rate-limit with DB timestamps & contract cooldown |
| Contract Failures | Use fallback/mocked service in dev |
| MongoDB Failure | MongoDB Atlas + automated backups |

---

## ✅ Critical Path Dependencies

- Backend APIs must be ready before frontend integration
- OpenAI moderation logic must gate the reward logic
- Web3 contract calls must be tested before voting flow goes live

---


# 🔗 Phase 4 – Integration & End-to-End Testing

---

## 🧩 Objective

Ensure smooth interoperability between frontend, backend, smart contracts, and moderation system. Validate entire story lifecycle: submission → moderation → on-chain vote → token reward.

---

## 🧪 Task 4.1 – Connect Frontend with Backend & Contracts

### Actions:
- Use `.env` to load:
  - Backend API URL
  - Contract addresses
  - Chain ID
- Use `Ethers.js` for contract interaction
- Axios or Fetch for REST API calls
- Finalize contract ABIs for frontend

### Checklist:
- [ ] Story submit page calls `/api/story`
- [ ] Voting button triggers `vote()` contract method
- [ ] Wallet displays token balance (via `NewsToken`)
- [ ] Contract address mismatch protection

---

## 🧪 Task 4.2 – End-to-End Happy Path Testing

### Tools:
- **Cypress** (recommended for Next.js apps)
- **Playwright** (alternative)

### Test Flow:
1. Connect wallet
2. Submit valid story
3. Story gets approved by AI
4. Story appears in feed
5. Vote on story
6. Confirm token balance increase

### Additional Checks:
- Vote cooldown respected (60s)
- Double voting blocked
- Token cap limits enforced

---

## 🛡️ Task 4.3 – Security & Performance Audit

### Backend:
- [ ] Input validation on all API routes
- [ ] Rate limiting with `express-rate-limit`
- [ ] Sanitize user input (avoid injection)
- [ ] Environment secrets protected (`dotenv`)

### Frontend:
- [ ] Disable buttons until tx confirmed
- [ ] Retry logic for failed contract calls
- [ ] Protect against wallet spoofing

### Blockchain:
- [ ] Ensure `NewsDAO` functions respect modifiers (e.g., cooldown, vote limits)
- [ ] Hardhat script to simulate voting attacks (e.g., spam, duplicate votes)

---

## 🧰 Task 4.4 – Bug Fixes & Iteration

- Run multiple user flows in testnet
- Log errors in console & server
- Handle frontend UX breaks (blank states, loading spinners)
- Buffer 6–10 hours to address:
  - Contract-call failures
  - IPFS fetch issues
  - Voting race conditions
  - Story not appearing after moderation

---

## 🧬 Environment Config

| Key | Example Value |
|-----|---------------|
| `NEXT_PUBLIC_BACKEND_URL` | `https://api.newsnet.xyz` |
| `NEXT_PUBLIC_CHAIN_ID` | `80001` |
| `NEXT_PUBLIC_CONTRACT_NEWSDAO` | `0x123...abc` |
| `NEXT_PUBLIC_CONTRACT_NEWSTOKEN` | `0x456...def` |

> 🔐 Keep API keys, private keys, and OpenAI secrets in `.env`, never hardcoded.

---

## ⚠️ Critical Path Dependencies

| Task | Depends On |
|------|------------|
| Frontend-contract integration | Smart contracts deployed + ABI available |
| Submit → Moderate → On-chain | Backend + AI moderation working |
| Token reward system | Contract voting logic + API validation |

> **CRITICAL**: If contract voting logic or backend API is broken, platform halts.

---

## 🔍 Pitfalls & Fixes

| Problem | Fix |
|--------|-----|
| Wrong contract addresses | Use shared `.env` file across frontend/backend |
| Vote fails silently | Use `try-catch`, show toast with tx error |
| AI moderation delay | Fallback timeout (e.g., 5s) with “retry” button |
| IPFS not loading | Use multiple gateways or pin critical content |

---

## 📂 Branching & CI (optional)

- `integration-testing`: for this phase
- Skip full CI/CD; manual deploy to Vercel/Render for testing

---

## ✅ Phase Completion Criteria

- User can go from story submission → moderation → voting → earn tokens
- At least 1 successful E2E flow tested with 2+ wallets
- All major integration bugs resolved
- Ready for public testnet demo

# 🌐 Phase 3 – Frontend Development (Next.js + Tailwind + Web3)

---

## ⚙️ Frontend Tech Stack (For Task 3.1)

- **Framework**: Next.js 14 (App Router)
- **Styling**: Tailwind CSS (JIT mode)
- **Web3**: Ethers.js
- **State Management**: React Context or Zustand (for wallet & user data)
- **Testing**: Jest + React Testing Library

### Folder Structure:
- **Generate the ideal folder structure for the frontend (Next.js + Tailwind CSS) of my decentralized news platform MVP. Include folders for components, pages/app, services (API and Web3), custom hooks, styles, and tests. Suggest any additional files or structure improvements that enhance scalability and developer clarity.**

---

## 📝 UI Pages and Views

- Design the complete set of UI pages and routes for my decentralized news platform MVP using Next.js. Include core user flows like story listing, submission, detail view, and optional dashboard. Suggest any additional views or routes that would improve UX for voting, moderation feedback, or wallet interactions.

---

## 🧱 Task 3.1 – Project Setup

### Steps:
- Create Next.js app: `npx create-next-app@latest frontend`
- Install Tailwind CSS: follow official docs
- Setup config: `tailwind.config.js`, `postcss.config.js`
- Add base layout and page templates

---

## ✍️ Task 3.2 – Story Submission UI

### Form Fields:
- Title (100 chars max)
- Location (optional)
- Story content (will convert to IPFS hash later)

### Logic:
- On submit: call `/api/story` backend route
- Display moderation status (approved/rejected)
- Disable button until submission completes

---

## 📚 Task 3.3 – Story Listing & Details Page

### `/` Home Page:
- Fetch all approved stories via backend
- Paginate or infinite scroll (optional)
- Show upvote count + submittedBy

### `/story/[id]` Page:
- Fetch single story data
- Add vote button with current vote count
- Show moderation flag if rejected

---

## 🗳️ Task 3.4 – Voting Integration via Ethers.js

### Steps:
- Connect MetaMask
- Use `ethers.Contract` to interact with `NewsDAO`
- Call `vote(storyId)` method
- Handle cooldown & voting state feedback (e.g., "Already Voted", "Wait 1 Minute")

### Wallet Handling:
- Use `window.ethereum` for provider
- Show connect button with current wallet address

---

## 🪙 Task 3.5 – Token Balance Display

### Fetch and display:
- Use `NewsToken` contract
- Call `balanceOf(walletAddress)`
- Display $NEWS balance on navbar or `/dashboard`

---

## 🧭 Task 3.6 – Navigation & User Flow

### Navigation Bar:
- Logo + Links: Home | Submit | Dashboard
- Wallet Connect Button
- Responsive design (Tailwind `flex`, `gap`, `md:hidden`)

---

## ✅ Task 3.7 – Frontend Testing

### Testing Stack:
- **Jest** for logic tests
- **React Testing Library** for components
- **MSW** (Mock Service Worker) for mocking backend API

### What to Test:
- Submit form validation
- Vote button disabled after use
- Wallet connect state
- Story list rendering

---

## 📁 Env Vars & Config

| Variable | Purpose |
|----------|---------|
| `NEXT_PUBLIC_BACKEND_URL` | Express API endpoint |
| `NEXT_PUBLIC_CONTRACT_NEWSDAO` | NewsDAO contract address |
| `NEXT_PUBLIC_CONTRACT_NEWSTOKEN` | NewsToken contract address |
| `NEXT_PUBLIC_CHAIN_ID` | 80001 (Polygon Mumbai) |

---

## 🚨 Pitfalls & Mitigation

| Pitfall | Mitigation |
|--------|------------|
| Wallet not connected | Prompt user early; disable actions |
| Vote tx fails | Add error toast; retry logic |
| IPFS display errors | Fallback loader; avoid gateway overload |
| Slow RPC | Use Alchemy RPC, retry failed reads |

---

## ✅ Critical Path Dependencies

- Backend `/api/story` and `/api/vote` must be ready before integration
- Contracts must be deployed and verified before frontend can interact
- Gemini moderation logic must be finalized for submit page

---

## 🧰 Recommended Libraries

- Suggest the most effective frontend libraries for building the decentralized news platform MVP using React/Next.js. Cover blockchain interaction, UI design, state management, testing, form handling, and user notifications. Choose tools that balance simplicity, performance, and hackathon speed.

---

## 🗂️ Branching Model

- `main`: production-ready
- `dev-frontend`: active development
- Feature branches: `frontend/story-submit`, `frontend/story-list`, etc.

---

## 🔚 Goal by End of Phase

- Complete UI to submit stories, vote, and view balances
- Integrated Web3 interactions
- Fully tested frontend connected to live backend & testnet contracts

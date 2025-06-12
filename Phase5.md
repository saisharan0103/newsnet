# 🚀 Phase 5 – Deployment & Documentation

---

## 🎯 Objective

Make the platform publicly accessible for demo, judging, and team testing. Finalize documentation for future contributors and post-hackathon improvements.

---

## ☁️ Task 5.1 – Backend Deployment

### Steps:

1. Push to `main` branch or `backend-release`
2. Create `.env` with:
   - `MONGO_URI`
   - `Gemini_API_KEY`
   - `PRIVATE_KEY` (for contract tx)
   - `CONTRACT_ADDRESSES`
3. Configure:
   - Node.js runtime
   - Auto-redeploy on push
4. Enable HTTPS

✅ Verify:

- `/api/story` and `/api/vote` work from frontend
- AI moderation triggers correctly

---

## 🖥️ Task 5.2 – Frontend Deployment

### Steps:

1. Link GitHub repo
2. Add environment variables:
   - `NEXT_PUBLIC_BACKEND_URL`
   - `NEXT_PUBLIC_CONTRACT_NEWSDAO`
   - `NEXT_PUBLIC_CONTRACT_NEWSTOKEN`
   - `NEXT_PUBLIC_CHAIN_ID`
3. Set build command: `next build`
4. Set output directory: `.next`

✅ Verify:

- App loads on all devices
- Wallet connects on Mumbai testnet
- Votes and rewards flow properly

---

## 📜 Task 5.3 – Smart Contract Publishing

### Checklist:

- [ ] Verify `NewsDAO.sol` and `NewsToken.sol` on **Polygonscan**
- [ ] Add verified source code
- [ ] Store final ABI in:
  - `/frontend/constants/abi/`
  - `/backend/constants/contracts/`

### Documentation:

- Contract addresses
- ABI download link
- Functions: vote(), submit(), reward()

---

## 🧾 Task 5.4 – Documentation & README

### README Structure:

- Act as a GitHub documentation expert. Generate a clean, well-structured README.md for a decentralized news platform called NewsNet. It should include sections for: live demo link, key features, tech stack, smart contracts used, sample test wallet addresses, required environment variables (frontend/backend), and local development setup instructions. Use markdown formatting with proper headings, bullet points, and code blocks.

---

## 📌 Task 5.5 – Post-Hackathon Roadmap (Optional)

| Feature                           | Description                    |
| --------------------------------- | ------------------------------ |
| 🗳️ Voting Power by Token Holdings | Let tokens weight votes in v2  |
| 🧠 Better AI Model                | Use custom moderation filters  |
| 🔐 Wallet-Based Auth              | Add Sign-In with Ethereum      |
| 📊 Analytics Dashboard            | Track daily votes, submissions |
| 🌍 Geo-Tagging                    | Map-based news filtering       |

---

## 🟢 Final Launch Checklist

| Item                  | Status |
| --------------------- | ------ |
| Backend live          | ✅     |
| Frontend live         | ✅     |
| Contracts verified    | ✅     |
| ReadMe complete       | ✅     |
| Sample wallets tested | ✅     |

> 🏁 You are now ready for **demo day**.

---

## 🧠 Deployment Tips

- Always recheck `.env` variables
- Clear browser cache if frontend doesn’t reflect updates
- Use MetaMask’s Mumbai network config:
  - Chain ID: `80001`
  - RPC: `https://polygon-mumbai.g.alchemy.com/v2/YOUR_KEY`

---

## 🧷 Optional CI/CD (Post-Hackathon)

- GitHub Actions:
  - Deploy backend on `main` push
  - Trigger Vercel build after contract changes
- Future: Add test pipeline with `Jest` + `Hardhat test`

---

# Phase 2 - Backend API & Database

This document outlines the configuration and folder structure for the backend portion of the NewsNet MVP.

## Environment Variables
Create a `.env` file in the backend root with at least the following variables:

```bash
MONGODB_URI=mongodb://localhost:27017/newsnet
JWT_SECRET=supersecret
GEMINI_API_KEY=your_gemini_key
WEB3_PROVIDER_URL=https://sepolia.infura.io/v3/your-project-id
PRIVATE_KEY=0xyourprivatekey
NEWS_TOKEN_ADDRESS=0x...
NEWS_DAO_ADDRESS=0x...
PORT=3000
```

These values provide database access, blockchain credentials, and the Gemini API key for content moderation.

## Suggested Folder Layout
```
backend/
  src/
    controllers/
    models/
    routes/
    services/
  test/
  .env.example
contracts/
frontend/
```

- **controllers/** – Express route handlers
- **models/** – Mongoose schemas
- **services/** – Web3 and Gemini integration logic
- **test/** – unit tests using your preferred framework

Keep smart contracts under `contracts/` and the future React code under `frontend/`.

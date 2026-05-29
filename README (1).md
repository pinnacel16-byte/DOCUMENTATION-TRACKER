# Maharashtra Property Document Tracker
### Shareable · Bilingual · Free Forever

A client document tracking system for Maharashtra real estate transactions.
Each client gets a unique link. You see all clients on your admin dashboard.

---

## What's included

```
mh-property-tracker/
├── tracker/index.html       ← Client-facing tracker (share this link)
├── dashboard/index.html     ← Your admin view (all clients + progress)
├── supabase-setup.sql       ← Run once in Supabase to create the database
└── README.md
```

---

## Deploy in 4 steps (free, ~45 minutes total)

### Step 1 — Create Supabase database (10 min)

1. Go to https://supabase.com and sign up free
2. Click **New project** → give it a name like "mh-tracker" → set a password → Create
3. Wait ~2 minutes for project to start
4. Go to **SQL Editor** (left sidebar)
5. Paste the entire contents of `supabase-setup.sql` and click **Run**
6. Go to **Settings → API** and copy:
   - **Project URL** (looks like: https://xxxxx.supabase.co)
   - **anon public** key (long string starting with eyJ...)

### Step 2 — Add your Supabase credentials (5 min)

Open both HTML files and replace these two lines near the top of each `<script>` block:

```javascript
const SUPABASE_URL = 'YOUR_SUPABASE_URL';       // ← paste your Project URL
const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';  // ← paste your anon key
```

Do this in BOTH files:
- `tracker/index.html`
- `dashboard/index.html`

### Step 3 — Upload to GitHub Pages (15 min)

1. Go to https://github.com and sign up / log in
2. Click **New repository** → name it `mh-property-tracker` → Public → Create
3. Upload all files maintaining the folder structure:
   - `tracker/index.html`
   - `dashboard/index.html`
   - `supabase-setup.sql` (optional)
   - `README.md`
4. Go to **Settings → Pages**
5. Under Source: select **Deploy from a branch** → branch: `main` → folder: `/ (root)`
6. Click Save → wait 2 minutes
7. Your site is live at: `https://YOUR-USERNAME.github.io/mh-property-tracker/`

### Step 4 — Start using it (2 min)

**Your admin dashboard:**
```
https://YOUR-USERNAME.github.io/mh-property-tracker/dashboard/
```

**To add a new client:**
1. Open the dashboard
2. Click "+ New client"
3. Enter their name and transaction type
4. Copy the generated link → send to client via WhatsApp/email

**Client tracker URL format:**
```
https://YOUR-USERNAME.github.io/mh-property-tracker/tracker/?id=ABC12345
```

---

## Features

| Feature | Details |
|---|---|
| Bilingual | English + Hindi toggle |
| 6 transaction types | Builder, Resale, Sell, Rental, Gift, Inheritance |
| Per-document status | Pending / Obtained / Not needed |
| Notes field | Add dates, officer names, remarks |
| Auto-save | Saves to Supabase every 0.8s after change |
| Offline fallback | Uses localStorage if Supabase is unreachable |
| Admin dashboard | See all clients, progress %, last active date |
| One-click link copy | Copy client link from dashboard |
| Real-time refresh | Dashboard auto-refreshes every 30 seconds |
| Mobile friendly | Works on phone without installing anything |

---

## Customisation

**Add your name/logo:** Edit the `.logo` section in both HTML files.

**Change accent color:** Edit `--accent: #2d5a3d;` in the `:root` CSS block.

**Add more documents:** Edit the `docs` object in `tracker/index.html` — both `en` and `hi` sections.

**Restrict admin access:** Add a simple password check at the top of `dashboard/index.html`:
```javascript
const ADMIN_PASS = 'yourpassword';
if (prompt('Admin password:') !== ADMIN_PASS) window.location.href = '../tracker/';
```

---

## Cost

| Service | Free tier | Enough for |
|---|---|---|
| GitHub Pages | Unlimited | Hosting forever |
| Supabase | 500MB DB, 2GB bandwidth | ~10,000 clients |

Both are completely free for this use case. No credit card needed.

---

## Open source

This project is MIT licensed. Fork it, modify it, share it.
Built for Maharashtra real estate documentation tracking.

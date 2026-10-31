# Quest Island: setup guide

About 30 minutes, once. After that, the kids just tap the icon.

You'll create two free accounts:
- **Supabase**, which holds the kids' progress so every device sees the same thing.
- **GitHub**, which hosts the app and keeps every version of the code.

---

## Step 1: Set up the database (Supabase)

1. Go to **supabase.com**, sign up, and click **New project**.
   - Name: `quest-island`
   - Database password: anything strong. You won't need it day to day.
   - Region: the closest one to you, for example Frankfurt or Mumbai.
2. When the project is ready, open **SQL Editor** → **New query**. Paste in the whole of `supabase-setup.sql` and press **Run**. It should say "Success".
3. Create the family login: **Authentication** → **Users** → **Add user** → **Create new user**.
   - Enter a family email and password. These are what you'll type once on each device.
   - Tick **Auto Confirm User**.
4. Stop strangers from signing up: **Authentication** → **Sign In / Providers** (may be under **Settings**). Turn **off** "Allow new users to sign up".
5. Get your two connection values: **Project Settings** → **API** (sometimes called **Data API**).
   - Copy the **Project URL**.
   - Copy the **anon public** key.
6. Open `config.js` in a text editor (TextEdit or Notepad is fine). Paste both values between the quotes, then save.

> The anon key is meant to be public. The database rules from step 2 only let your signed-in family account read or write its data.

## Step 2: Put the app online (GitHub Pages)

1. Go to **github.com**, sign up, then click **+** → **New repository**.
   - Name: `quest-island`
   - Visibility: **Public**. Free GitHub Pages needs this. Only the app's code is public; the kids' data lives in Supabase, not here.
2. On the new repository, click **uploading an existing file**. Drag in **all the files from this folder**, including your edited `config.js`, then click **Commit changes**.
3. Go to **Settings** → **Pages**.
   - Under "Build and deployment", choose **Deploy from a branch**.
   - Pick **main** and **/(root)**, then click **Save**.
4. After a minute or two the page shows your address, something like `https://YOUR-NAME.github.io/quest-island/`.

## Step 3: Install it on each device

- **iPad:** open the address in **Safari**, tap **Share** → **Add to Home Screen**.
- **Android tablet:** open it in **Chrome**, tap **⋮** → **Install app** (or **Add to Home screen**).
- **Laptop:** open it in **Chrome** or **Edge** and click the install icon in the address bar.
- **Your phone:** same as the tablets, if you want to check progress on the go.

Then on each device, once:

1. Open the app and go to **Grown-ups** (answer the times-table question).
2. Under **Cloud sync**, enter the family email and password, then tap **Sign in**.

Sign in **before** the kids play on a new device. The family's cloud copy is then used straight away.

## Day to day

- Progress syncs automatically whenever a device is online. Kids can also play offline; it catches up later.
- Choose which rewards are on offer under **Grown-ups → Reward menu**. Each child picks their own goal from those.
- When you've handed over a reward, tap **Reward given** so they can choose the next one.

## Updating the app later

1. Ask Claude for the change. You'll get new files.
2. In your GitHub repository: **Add file** → **Upload files**. Drag in the new files, but **keep your own `config.js`**, then **Commit changes**.
3. Devices pick up the new version the next time they open the app online. The kids' progress isn't touched.

Every upload is kept in GitHub's history, so any version can be restored.

## Good to know

- **Supabase free projects pause after about a week with no activity.** Daily use keeps it awake. If it does pause, the app keeps working on each device and you can press **Restore** in the Supabase dashboard; everything then syncs again.
- **If a device shows "Sync problem",** check it's online and signed in. **Sync now** in Grown-ups retries.
- **Costs:** both services are free at this scale.

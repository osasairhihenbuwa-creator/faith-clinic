FAITH CLINIC REBUILD — OCTOBER 2026

WHAT IS INCLUDED
All original HTML, logos, images, the Balaam teaching page and the PDF resource are preserved.
Added register.html, member-login.html, admin.html, account.html, auth.js, Cloudflare Pages Functions, schema.sql.

IMPORTANT
Opening index.html or register.html by double-clicking only previews static pages. Registration and login WILL NOT work locally using file://.
This is a Cloudflare PAGES project with Pages Functions, not a standalone Workers static-assets upload. Uploading just the static files will not activate the /api endpoints.
The D1 database binding must be named DB (binding variable), and schema.sql must be executed on that D1 database.
Deploy through a Git-connected Cloudflare Pages project or compatible Wrangler Pages deployment that includes the functions directory.
Example CLI (requires Node.js and Wrangler configured):
  npx wrangler d1 execute YOUR_D1_DATABASE_NAME --remote --file=./schema.sql
  npx wrangler pages deploy . --project-name=YOUR_PAGES_PROJECT
Configure the Pages project D1 binding DB before deployment. Confirm the actual Pages project name and D1 database identifier in your Cloudflare account.

SUPER ADMIN
For safety, public registration ALWAYS creates role=member. No default admin account or password is embedded in files.
After registering YOUR account and verifying ownership, set your role in D1 via a parameterized/quoted SQL statement in Cloudflare's authenticated D1 console, e.g.:
  UPDATE members SET role='admin' WHERE email='YOUR-VERIFIED-EMAIL@example.com';
Only run this for your own verified account. The account page will display the admin role. A full member-management admin panel is NOT implemented yet.

SUBSCRIPTIONS / ACCESS CONTROL
Existing Stripe payment links are preserved. Stripe payments are NOT yet connected to D1 member entitlements; payment does not automatically grant member access.
Existing resource pages and the PDF are PUBLIC in this package. Do not claim they are private or subscriber-only; server-side gating, verified Stripe webhooks and admin tools are future work.
Before a public launch: add email verification, rate limits, password reset, anti-abuse controls, webhook verification, and secure paid-resource authorization. Test registration/login on the actual Cloudflare deployment.

Keep your original website.zip as a backup. Never place Stripe secret keys, API secrets or passwords in HTML or the ZIP.

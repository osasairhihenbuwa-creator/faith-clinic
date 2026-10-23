CREATE TABLE IF NOT EXISTS members (id TEXT PRIMARY KEY, name TEXT NOT NULL, email TEXT NOT NULL UNIQUE, password_hash TEXT NOT NULL, salt TEXT NOT NULL, role TEXT NOT NULL DEFAULT 'member' CHECK(role IN ('member','admin')), created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE IF NOT EXISTS sessions (token_hash TEXT PRIMARY KEY, member_id TEXT NOT NULL REFERENCES members(id) ON DELETE CASCADE, expires_at INTEGER NOT NULL);
CREATE INDEX IF NOT EXISTS idx_sessions_member ON sessions(member_id);

-- Community tables (apply to the same D1 database as members)
CREATE TABLE IF NOT EXISTS community_posts (id TEXT PRIMARY KEY, member_id TEXT NOT NULL REFERENCES members(id), category TEXT NOT NULL CHECK(category IN ('prayer','testimony','bible','fellowship')), title TEXT NOT NULL, body TEXT NOT NULL, status TEXT NOT NULL DEFAULT 'visible' CHECK(status IN ('visible','hidden')), created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP);
CREATE INDEX IF NOT EXISTS idx_community_posts ON community_posts(status,created_at);
CREATE TABLE IF NOT EXISTS community_comments (id TEXT PRIMARY KEY, post_id TEXT NOT NULL REFERENCES community_posts(id) ON DELETE CASCADE, member_id TEXT NOT NULL REFERENCES members(id), body TEXT NOT NULL, status TEXT NOT NULL DEFAULT 'visible' CHECK(status IN ('visible','hidden')), created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP);
CREATE INDEX IF NOT EXISTS idx_community_comments ON community_comments(post_id,status,created_at);

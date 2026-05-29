-- Run this in your Supabase SQL Editor
-- Dashboard: https://supabase.com → Your project → SQL Editor

-- 1. Create the trackers table
CREATE TABLE IF NOT EXISTS trackers (
  id           BIGSERIAL PRIMARY KEY,
  client_id    TEXT UNIQUE NOT NULL,
  name         TEXT NOT NULL,
  cat          TEXT NOT NULL DEFAULT 'builder',
  doc_state    JSONB DEFAULT '{}',
  created_at   TIMESTAMPTZ DEFAULT NOW(),
  updated_at   TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Auto-update updated_at on every save
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_updated_at
  BEFORE UPDATE ON trackers
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- 3. Row Level Security — allow public read/write by client_id
ALTER TABLE trackers ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read by client_id"
  ON trackers FOR SELECT
  USING (true);

CREATE POLICY "Public insert"
  ON trackers FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Update own tracker"
  ON trackers FOR UPDATE
  USING (true);

-- 4. Index for fast lookup
CREATE INDEX IF NOT EXISTS idx_trackers_client_id ON trackers(client_id);

-- Done! Your table is ready.
-- Now copy your Supabase URL and anon key into both HTML files.

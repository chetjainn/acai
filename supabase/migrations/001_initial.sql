-- PostgreSQL Migration SQL File for ACAI Platform

BEGIN;

-- Create Users Table
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id TEXT NOT NULL DEFAULT 'ACAI',
  email TEXT UNIQUE NOT NULL,
  username TEXT UNIQUE,
  full_name TEXT,
  avatar_url TEXT,
  role TEXT NOT NULL DEFAULT 'user', -- 'user', 'developer', 'admin'
  stripe_customer_id TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  last_login_at TIMESTAMPTZ
);

-- Create Agents Table
CREATE TABLE agents (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id TEXT NOT NULL DEFAULT 'ACAI',
  developer_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  description TEXT,
  short_description TEXT,
  category TEXT NOT NULL, -- 'productivity', 'creative', 'analytics', etc.
  tags TEXT[] DEFAULT '{}',
  icon_url TEXT,
  cover_image_url TEXT,
  price_type TEXT NOT NULL DEFAULT 'free', -- 'free', 'one_time', 'subscription'
  price_amount DECIMAL(10,2), -- NULL for free
  price_currency TEXT DEFAULT 'USD',
  stripe_price_id TEXT,
  is_public BOOLEAN NOT NULL DEFAULT TRUE,
  is_verified BOOLEAN NOT NULL DEFAULT FALSE,
  configuration JSONB NOT NULL DEFAULT '{}', -- Agent system prompt, capabilities, etc.
  usage_count INTEGER NOT NULL DEFAULT 0,
  average_rating DECIMAL(3,2),
  review_count INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  published_at TIMESTAMPTZ
);

-- Create Transactions Table
CREATE TABLE transactions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id TEXT NOT NULL DEFAULT 'ACAI',
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  agent_id UUID NOT NULL REFERENCES agents(id) ON DELETE CASCADE,
  type TEXT NOT NULL, -- 'purchase', 'subscription', 'refund'
  status TEXT NOT NULL DEFAULT 'pending', -- 'pending', 'completed', 'failed', 'refunded'
  amount DECIMAL(10,2) NOT NULL,
  currency TEXT NOT NULL DEFAULT 'USD',
  stripe_payment_intent_id TEXT UNIQUE,
  stripe_subscription_id TEXT,
  metadata JSONB DEFAULT '{}',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  completed_at TIMESTAMPTZ
);

-- Create User Agent Relationships Table
CREATE TABLE user_agent_relationships (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id TEXT NOT NULL DEFAULT 'ACAI',
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  agent_id UUID NOT NULL REFERENCES agents(id) ON DELETE CASCADE,
  relationship_type TEXT NOT NULL, -- 'purchased', 'favorited', 'subscribed'
  status TEXT NOT NULL DEFAULT 'active',
  expires_at TIMESTAMPTZ,
  metadata JSONB DEFAULT '{}',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE(user_id, agent_id, relationship_type)
);

-- Create Agent Reviews Table
CREATE TABLE agent_reviews (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id TEXT NOT NULL DEFAULT 'ACAI',
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  agent_id UUID NOT NULL REFERENCES agents(id) ON DELETE CASCADE,
  rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
  title TEXT,
  content TEXT,
  is_verified_purchase BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE(user_id, agent_id)
);

-- Sample Data Insertion
INSERT INTO users (email, username, full_name, role) VALUES
  ('jane.doe@example.com', 'janedoe', 'Jane Doe', 'developer'),
  ('john.smith@example.com', 'johnsmith', 'John Smith', 'user');

INSERT INTO agents (developer_id, name, slug, category) VALUES
  ((SELECT id FROM users WHERE username = 'janedoe'), 'Productivity Agent', 'productivity-agent', 'productivity'),
  ((SELECT id FROM users WHERE username = 'janedoe'), 'Creative Agent', 'creative-agent', 'creative');

INSERT INTO transactions (user_id, agent_id, type, amount) VALUES
  ((SELECT id FROM users WHERE username = 'johnsmith'), (SELECT id FROM agents WHERE slug = 'creative-agent'), 'purchase', 49.99);

-- Create Indexes
CREATE INDEX idx_agents_category ON agents (category);
CREATE INDEX idx_transactions_user_id ON transactions (user_id);
CREATE INDEX idx_relationships_user_id_agent_id ON user_agent_relationships (user_id, agent_id);

-- Enable Row-Level Security
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE agents ENABLE ROW LEVEL SECURITY;
ALTER TABLE transactions ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_agent_relationships ENABLE ROW LEVEL SECURITY;
ALTER TABLE agent_reviews ENABLE ROW LEVEL SECURITY;

-- Row-Level Security Policies
CREATE POLICY users_tenant_access ON users USING (tenant_id = 'ACAI');
CREATE POLICY agents_tenant_access ON agents USING (tenant_id = 'ACAI');
CREATE POLICY transactions_tenant_access ON transactions USING (tenant_id = 'ACAI');
CREATE POLICY relationships_tenant_access ON user_agent_relationships USING (tenant_id = 'ACAI');
CREATE POLICY reviews_tenant_access ON agent_reviews USING (tenant_id = 'ACAI');

-- Grant Select to Supabase Service Role
GRANT SELECT ON ALL TABLES IN SCHEMA public TO anon;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO authenticated;

COMMIT;
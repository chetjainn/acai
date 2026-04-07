-- SQL migration script for ACAI platform MVP

-- User Table
CREATE TABLE users (
  id UUID PRIMARY KEY,
  tenant_id VARCHAR(255) NOT NULL DEFAULT 'ACAI',
  email VARCHAR(255) UNIQUE NOT NULL,
  username VARCHAR(100) UNIQUE NOT NULL,
  hashed_password VARCHAR(255) NOT NULL,
  role ENUM('consumer', 'creator', 'admin') NOT NULL DEFAULT 'consumer',
  avatar_url VARCHAR(500),
  bio TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  is_active BOOLEAN NOT NULL DEFAULT TRUE
);

-- Agent Table
CREATE TABLE agents (
  id UUID PRIMARY KEY,
  tenant_id VARCHAR(255) NOT NULL DEFAULT 'ACAI',
  creator_id UUID NOT NULL REFERENCES users(id),
  name VARCHAR(200) NOT NULL,
  slug VARCHAR(200) UNIQUE NOT NULL,
  tagline VARCHAR(300) NOT NULL,
  description TEXT NOT NULL,
  price_usd DECIMAL(10, 2) NOT NULL CHECK (price_usd >= 0),
  category_id UUID NOT NULL REFERENCES categories(id),
  icon_url VARCHAR(500),
  demo_video_url VARCHAR(500),
  documentation_url VARCHAR(500),
  api_endpoint VARCHAR(500),
  is_published BOOLEAN NOT NULL DEFAULT FALSE,
  is_featured BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Category Table
CREATE TABLE categories (
  id UUID PRIMARY KEY,
  tenant_id VARCHAR(255) NOT NULL DEFAULT 'ACAI',
  name VARCHAR(100) UNIQUE NOT NULL,
  slug VARCHAR(100) UNIQUE NOT NULL,
  description TEXT,
  parent_category_id UUID REFERENCES categories(id),
  icon VARCHAR(50),
  display_order INTEGER NOT NULL DEFAULT 0
);

-- Transaction Table
CREATE TABLE transactions (
  id UUID PRIMARY KEY,
  tenant_id VARCHAR(255) NOT NULL DEFAULT 'ACAI',
  buyer_id UUID NOT NULL REFERENCES users(id),
  agent_id UUID NOT NULL REFERENCES agents(id),
  amount_usd DECIMAL(10, 2) NOT NULL,
  status ENUM('pending', 'completed', 'failed', 'refunded') NOT NULL DEFAULT 'pending',
  stripe_payment_intent_id VARCHAR(255) UNIQUE,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  completed_at TIMESTAMP
);

-- Event Table
CREATE TABLE events (
  id UUID PRIMARY KEY,
  tenant_id VARCHAR(255) NOT NULL DEFAULT 'ACAI',
  user_id UUID REFERENCES users(id),
  event_type VARCHAR(100) NOT NULL,
  entity_type VARCHAR(50),
  entity_id UUID,
  session_id VARCHAR(255) NOT NULL,
  page_url VARCHAR(500) NOT NULL,
  referrer_url VARCHAR(500),
  user_agent TEXT,
  ip_address VARCHAR(45),
  event_properties JSON NOT NULL DEFAULT '{}',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Sample Data
INSERT INTO users (id, email, username, hashed_password, role) VALUES 
('1c4d56b1-45ae-4ec4-8a2d-4a52b0a1aa58', 'john.doe@example.com', 'john_doe', 'hashed-password-123', 'consumer');

INSERT INTO categories (id, name, slug, display_order) VALUES 
('2a6249c5-8ecf-4b64-afc7-797decfe7067', 'Content Creation', 'content-creation', 1);

INSERT INTO agents (id, creator_id, name, slug, tagline, description, price_usd, category_id) VALUES 
('3f36571f-e31b-4e5c-bd87-3d4d5566b3a4', '1c4d56b1-45ae-4ec4-8a2d-4a52b0a1aa58', 'Text Analyzer', 'text-analyzer', 'Analyze text efficiently', 'An AI tool for detailed text analysis', 49.99, '2a6249c5-8ecf-4b64-afc7-797decfe7067');

-- RLS policies
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation_policy ON users 
  FOR SELECT USING (tenant_id = 'ACAI');

ALTER TABLE agents ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation_policy ON agents 
  FOR SELECT USING (tenant_id = 'ACAI');

ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation_policy ON categories 
  FOR SELECT USING (tenant_id = 'ACAI');

ALTER TABLE transactions ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation_policy ON transactions 
  FOR SELECT USING (tenant_id = 'ACAI');

ALTER TABLE events ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation_policy ON events 
  FOR SELECT USING (tenant_id = 'ACAI');

-- Indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_agents_slug ON agents(slug);
CREATE INDEX idx_categories_slug ON categories(slug);
CREATE INDEX idx_transactions_buyer_id ON transactions(buyer_id);
CREATE INDEX idx_events_user_id ON events(user_id);
-- Migration for ACAI Platform Database

-- Enable necessary extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- User Management
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(100),
    role VARCHAR(20) CHECK (role IN ('user', 'provider', 'admin')),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ,
    profile JSONB
);

-- Agent Marketplace
CREATE TABLE agents (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(50) CHECK (category IN ('productivity', 'creative', 'analytics', 'customer_service', 'development')),
    provider_id UUID REFERENCES users(id) ON DELETE CASCADE,
    pricing_model VARCHAR(20) CHECK (pricing_model IN ('free', 'one_time', 'subscription', 'usage_based')),
    price DECIMAL,
    deployment_type VARCHAR(30) CHECK (deployment_type IN ('api', 'webhook', 'chat_interface', 'embedded')),
    capabilities JSONB,
    technical_requirements JSONB,
    rating DECIMAL CHECK (rating BETWEEN 0 AND 5),
    review_count INTEGER DEFAULT 0,
    is_verified BOOLEAN DEFAULT FALSE,
    is_featured BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ,
    metadata JSONB
);

CREATE INDEX idx_agents_category ON agents(category);
CREATE INDEX idx_agents_pricing_model ON agents(pricing_model);

-- Agent Versions
CREATE TABLE agent_versions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    agent_id UUID REFERENCES agents(id) ON DELETE CASCADE,
    version VARCHAR(50),
    changelog TEXT,
    deployment_config JSONB,
    is_active BOOLEAN DEFAULT FALSE,
    released_at TIMESTAMPTZ
);

-- Deployments
CREATE TABLE deployments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    agent_id UUID REFERENCES agents(id) ON DELETE CASCADE,
    agent_version_id UUID REFERENCES agent_versions(id),
    status VARCHAR(20) CHECK (status IN ('active', 'paused', 'terminated')),
    config JSONB,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    last_used_at TIMESTAMPTZ
);

-- Reviews
CREATE TABLE reviews (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    agent_id UUID REFERENCES agents(id) ON DELETE CASCADE,
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ
);

-- Comparison Sessions
CREATE TABLE comparison_sessions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id),
    session_token VARCHAR(255),
    agent_ids UUID[] NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    last_accessed_at TIMESTAMPTZ
);

-- Row Level Security Policies
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
CREATE POLICY user_is_self ON users USING (email = current_setting('jwt.claims.email'));

ALTER TABLE agents ENABLE ROW LEVEL SECURITY;

-- Sample Data
INSERT INTO users (email, name, role) VALUES
('user1@example.com', 'User One', 'user'),
('provider1@example.com', 'Provider One', 'provider'),
('admin@example.com', 'Administrator', 'admin');

INSERT INTO agents (name, description, category, provider_id, pricing_model, price, deployment_type, capabilities, rating, review_count, is_verified, is_featured) VALUES
('Agent A', 'Productivity enhancing agent', 'productivity', (SELECT id FROM users WHERE email='provider1@example.com'), 'subscription', 19.99, 'api', '["task automation", "email integration"]', 4.5, 10, TRUE, TRUE),
('Agent B', 'Creative agent for graphic design', 'creative', (SELECT id FROM users WHERE email='provider1@example.com'), 'free', NULL, 'webhook', '["design suggestions", "color palettes"]', 4.0, 25, TRUE, FALSE);
-- PostgreSQL migration script for the ACAI platform

-- Create Users table
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    username VARCHAR(50) UNIQUE,
    full_name VARCHAR(100),
    avatar_url TEXT,
    bio TEXT,
    role VARCHAR(20) DEFAULT 'user' CHECK (role IN ('user', 'developer', 'admin')),
    email_verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create Categories table
CREATE TABLE categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(50) UNIQUE NOT NULL,
    slug VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create Agents table
CREATE TABLE agents (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    description TEXT NOT NULL,
    short_description VARCHAR(255),
    creator_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    price_model VARCHAR(20) DEFAULT 'one_time' CHECK (price_model IN ('one_time', 'subscription', 'usage_based')),
    is_public BOOLEAN DEFAULT TRUE,
    is_featured BOOLEAN DEFAULT FALSE,
    configuration_schema JSONB,
    api_endpoint TEXT,
    icon_url TEXT,
    cover_image_url TEXT,
    total_purchases INTEGER DEFAULT 0,
    average_rating DECIMAL(3, 2) DEFAULT 0 CHECK (average_rating >= 0 AND average_rating <= 5),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create Junction table for Agent-Category relationship
CREATE TABLE agent_categories (
    agent_id UUID NOT NULL REFERENCES agents(id) ON DELETE CASCADE,
    category_id UUID NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
    PRIMARY KEY (agent_id, category_id)
);

-- Create Transactions table
CREATE TABLE transactions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    agent_id UUID NOT NULL REFERENCES agents(id) ON DELETE CASCADE,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount >= 0),
    currency VARCHAR(3) DEFAULT 'USD',
    status VARCHAR(20) DEFAULT 'pending' CHECK (status IN ('pending', 'completed', 'failed', 'refunded')),
    payment_provider VARCHAR(50),
    payment_intent_id TEXT,
    metadata JSONB,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    completed_at TIMESTAMPTZ
);

-- Create Reviews table
CREATE TABLE reviews (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    agent_id UUID NOT NULL REFERENCES agents(id) ON DELETE CASCADE,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(user_id, agent_id)
);

-- Create indexes for performance
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_created_at ON users(created_at);

CREATE INDEX idx_agents_creator_id ON agents(creator_id);
CREATE INDEX idx_agents_is_public ON agents(is_public) WHERE is_public = TRUE;
CREATE INDEX idx_agents_is_featured ON agents(is_featured) WHERE is_featured = TRUE;
CREATE INDEX idx_agents_price ON agents(price);
CREATE INDEX idx_agents_average_rating ON agents(average_rating DESC);
CREATE INDEX idx_agents_total_purchases ON agents(total_purchases DESC);
CREATE INDEX idx_agents_created_at ON agents(created_at DESC);

CREATE INDEX idx_categories_slug ON categories(slug);

CREATE INDEX idx_agent_categories_category_id ON agent_categories(category_id);

CREATE INDEX idx_transactions_user_id ON transactions(user_id);
CREATE INDEX idx_transactions_agent_id ON transactions(agent_id);
CREATE INDEX idx_transactions_status_created ON transactions(status, created_at DESC);

CREATE INDEX idx_reviews_agent_id ON reviews(agent_id);
CREATE INDEX idx_reviews_user_id ON reviews(user_id);

-- Sample data insertion
INSERT INTO users (email, password_hash, username, full_name, role, email_verified) VALUES
('john.doe@example.com', 'hashedPassword1', 'johndoe', 'John Doe', 'developer', TRUE),
('jane.smith@example.com', 'hashedPassword2', 'janesmith', 'Jane Smith', 'user', TRUE);

INSERT INTO categories (name, slug, description) VALUES
('Machine Learning', 'machine-learning', 'AI agents related to machine learning'),
('Data Science', 'data-science', 'AI agents related to data science');

INSERT INTO agents (name, slug, description, creator_id, price, price_model, is_public, is_featured, total_purchases, average_rating) VALUES
('Smart AI Assistant', 'smart-ai-assistant', 'An AI assistant to help with daily tasks.', (SELECT id FROM users WHERE username = 'johndoe'), 49.99, 'one_time', TRUE, FALSE, 100, 4.5),
('Data Analyzer', 'data-analyzer', 'An AI agent for analyzing data and statistics.', (SELECT id FROM users WHERE username = 'janesmith'), 29.99, 'subscription', TRUE, TRUE, 150, 4.7);

INSERT INTO agent_categories (agent_id, category_id) VALUES
((SELECT id FROM agents WHERE slug = 'smart-ai-assistant'), (SELECT id FROM categories WHERE slug = 'machine-learning')),
((SELECT id FROM agents WHERE slug = 'data-analyzer'), (SELECT id FROM categories WHERE slug = 'data-science'));

INSERT INTO transactions (user_id, agent_id, amount, currency, status, payment_provider, payment_intent_id) VALUES
((SELECT id FROM users WHERE username = 'johndoe'), (SELECT id FROM agents WHERE slug = 'data-analyzer'), 29.99, 'USD', 'completed', 'stripe', 'pi_1'),
((SELECT id FROM users WHERE username = 'janesmith'), (SELECT id FROM agents WHERE slug = 'smart-ai-assistant'), 49.99, 'USD', 'completed', 'paypal', 'pi_2');

INSERT INTO reviews (user_id, agent_id, rating, comment) VALUES
((SELECT id FROM users WHERE username = 'johndoe'), (SELECT id FROM agents WHERE slug = 'data-analyzer'), 5, 'Amazing agent, very helpful!'),
((SELECT id FROM users WHERE username = 'janesmith'), (SELECT id FROM agents WHERE slug = 'smart-ai-assistant'), 4, 'Great features and easy to use.');
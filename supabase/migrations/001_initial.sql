-- Create the User table
CREATE TABLE "User" (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR UNIQUE NOT NULL,
    hashed_password VARCHAR NOT NULL,
    display_name VARCHAR,
    avatar_url VARCHAR,
    bio TEXT,
    role VARCHAR DEFAULT 'user' CHECK (role IN ('user', 'admin')),
    stripe_customer_id VARCHAR UNIQUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Create the Agent table
CREATE TABLE "Agent" (
    agent_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    creator_id UUID NOT NULL REFERENCES "User"(user_id),
    name VARCHAR NOT NULL,
    slug VARCHAR UNIQUE NOT NULL,
    short_description VARCHAR NOT NULL,
    long_description TEXT,
    logo_url VARCHAR,
    website_url VARCHAR,
    documentation_url VARCHAR,
    repository_url VARCHAR,
    pricing_model VARCHAR DEFAULT 'free' CHECK (pricing_model IN ('free', 'one_time', 'subscription', 'usage_based')),
    price_amount_cents INTEGER,
    price_currency CHAR(3) DEFAULT 'USD',
    is_verified BOOLEAN DEFAULT FALSE,
    is_featured BOOLEAN DEFAULT FALSE,
    is_public BOOLEAN DEFAULT TRUE,
    total_deployments INTEGER DEFAULT 0,
    average_rating DECIMAL(3,2) DEFAULT 0.00,
    total_reviews INTEGER DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Create the Category table
CREATE TABLE "Category" (
    category_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR UNIQUE NOT NULL,
    slug VARCHAR UNIQUE NOT NULL,
    description TEXT,
    icon VARCHAR,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Create the AgentCategory junction table
CREATE TABLE "AgentCategory" (
    agent_id UUID NOT NULL REFERENCES "Agent"(agent_id),
    category_id UUID NOT NULL REFERENCES "Category"(category_id),
    assigned_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    PRIMARY KEY (agent_id, category_id)
);

-- Create the Review table
CREATE TABLE "Review" (
    review_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    agent_id UUID NOT NULL REFERENCES "Agent"(agent_id),
    author_id UUID NOT NULL REFERENCES "User"(user_id),
    rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
    title VARCHAR NOT NULL,
    content TEXT,
    is_verified_deployment BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (agent_id, author_id)
);

-- Create the Deployment table
CREATE TABLE "Deployment" (
    deployment_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    agent_id UUID NOT NULL REFERENCES "Agent"(agent_id),
    user_id UUID NOT NULL REFERENCES "User"(user_id),
    status VARCHAR DEFAULT 'active' CHECK (status IN ('active', 'paused', 'cancelled')),
    deployed_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    last_used_at TIMESTAMPTZ,
    metadata JSONB
);

-- Create sample data
INSERT INTO "User" (email, hashed_password, display_name, created_at, updated_at) VALUES 
('john.doe@example.com', 'hashed_password_123', 'John Doe', now(), now()),
('jane.smith@example.com', 'hashed_password_456', 'Jane Smith', now(), now());

INSERT INTO "Category" (name, slug, created_at) VALUES 
('Customer Support', 'customer-support', now()),
('Content Creation', 'content-creation', now());

-- Example RLS policy (for demonstration, usually involves more specific rules)
CREATE POLICY user_isolation_policy ON "User"
    USING (true);  -- Example, replace with actual policy requirements

CREATE POLICY agent_view_policy ON "Agent"
    USING (is_public = TRUE OR EXISTS (
        SELECT 1 FROM "Deployment" WHERE user_id = current_setting('request.jwt.claims.user_id')::uuid AND agent_id = "Agent".agent_id
    ));  -- Allow viewing public agents or those the user has deployed

ALTER TABLE "User" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "Agent" ENABLE ROW LEVEL SECURITY;
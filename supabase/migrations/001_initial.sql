BEGIN;

-- Create table for User
CREATE TABLE "User" (
    "id" UUID PRIMARY KEY,
    "external_id" VARCHAR(255) UNIQUE,
    "email" VARCHAR(255) UNIQUE NOT NULL,
    "username" VARCHAR(255) UNIQUE NOT NULL,
    "display_name" VARCHAR(255),
    "avatar_url" VARCHAR(255),
    "role" VARCHAR(255) CHECK (role IN ('developer', 'consumer', 'admin')) DEFAULT 'consumer',
    "stripe_customer_id" VARCHAR(255),
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Sample data for User
INSERT INTO "User" 
("id", "external_id", "email", "username", "display_name", "avatar_url", "role", "stripe_customer_id", "created_at", "updated_at") 
VALUES 
(uuid_generate_v4(), 'ext-123', 'johndoe@example.com', 'john_doe', 'John Doe', 'http://example.com/avatar.jpg', 'developer', NULL, NOW(), NOW());

-- Create table for Agent
CREATE TABLE "Agent" (
    "id" UUID PRIMARY KEY,
    "slug" VARCHAR(255) UNIQUE NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "tagline" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "full_description" TEXT,
    "logo_url" VARCHAR(255),
    "demo_video_url" VARCHAR(255),
    "category" VARCHAR(255) CHECK (category IN ('productivity', 'creative', 'analytics', 'development', 'other')),
    "pricing_model" VARCHAR(255) CHECK (pricing_model IN ('free', 'one_time', 'subscription')),
    "price_cents" INTEGER CHECK(price_cents >= 0),
    "is_public" BOOLEAN DEFAULT FALSE,
    "is_verified" BOOLEAN DEFAULT FALSE,
    "owner_id" UUID NOT NULL REFERENCES "User" ("id"),
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Sample data for Agent
INSERT INTO "Agent" 
("id", "slug", "name", "tagline", "description", "category", "pricing_model", "price_cents", "is_public", "is_verified", "owner_id", "created_at", "updated_at") 
VALUES 
(uuid_generate_v4(), 'awesome-agent', 'Awesome AI', 'This agent does awesome things.', 'A more detailed description...', 'productivity', 'free', NULL, TRUE, TRUE, (SELECT "id" FROM "User" WHERE "username"='john_doe'), NOW(), NOW());

-- Create table for AgentVersion
CREATE TABLE "AgentVersion" (
    "id" UUID PRIMARY KEY,
    "agent_id" UUID REFERENCES "Agent" ("id"),
    "version" INTEGER NOT NULL,
    "system_prompt" TEXT NOT NULL,
    "config_json" JSONB,
    "is_active" BOOLEAN DEFAULT FALSE,
    "created_by" UUID REFERENCES "User" ("id"),
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE ("agent_id", "version")
);

-- Sample data for AgentVersion
INSERT INTO "AgentVersion" 
("id", "agent_id", "version", "system_prompt", "config_json", "is_active", "created_by", "created_at") 
VALUES 
(uuid_generate_v4(), (SELECT "id" FROM "Agent" WHERE "slug"='awesome-agent'), 1, 'Respond with enthusiasm.', '{"settings": "default"}', TRUE, (SELECT "id" FROM "User" WHERE "username"='john_doe'), NOW());

-- Create table for Subscription
CREATE TABLE "Subscription" (
    "id" UUID PRIMARY KEY,
    "user_id" UUID REFERENCES "User" ("id"),
    "agent_id" UUID REFERENCES "Agent" ("id"),
    "stripe_subscription_id" VARCHAR(255) UNIQUE NOT NULL,
    "status" VARCHAR(255) CHECK (status IN ('active', 'canceled', 'past_due', 'unpaid')),
    "current_period_start" TIMESTAMPTZ NOT NULL,
    "current_period_end" TIMESTAMPTZ NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Sample data for Subscription
INSERT INTO "Subscription" 
("id", "user_id", "agent_id", "stripe_subscription_id", "status", "current_period_start", "current_period_end", "created_at", "updated_at") 
VALUES 
(uuid_generate_v4(), (SELECT "id" FROM "User" WHERE "username"='john_doe'), (SELECT "id" FROM "Agent" WHERE "slug"='awesome-agent'), 'sub_123456789', 'active', NOW(), NOW() + INTERVAL '30 days', NOW(), NOW());

-- Create table for AgentInteraction
CREATE TABLE "AgentInteraction" (
    "id" UUID PRIMARY KEY,
    "session_id" UUID NOT NULL,
    "user_id" UUID REFERENCES "User" ("id"),
    "agent_id" UUID REFERENCES "Agent" ("id"),
    "agent_version_id" UUID REFERENCES "AgentVersion" ("id"),
    "interaction_type" VARCHAR(255) CHECK (interaction_type IN ('view', 'run', 'like', 'share')),
    "metadata" JSONB,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Sample data for AgentInteraction
INSERT INTO "AgentInteraction" 
("id", "session_id", "user_id", "agent_id", "agent_version_id", "interaction_type", "metadata", "created_at") 
VALUES 
(uuid_generate_v4(), uuid_generate_v4(), (SELECT "id" FROM "User" WHERE "username"='john_doe'), (SELECT "id" FROM "Agent" WHERE "slug"='awesome-agent'), (SELECT "id" FROM "AgentVersion" WHERE "agent_id"=(SELECT "id" FROM "Agent" WHERE "slug"='awesome-agent')), 'view', '{"response_time": 200}', NOW());

-- Example RLS Policy: Only allow users to see public agents
CREATE POLICY agent_policy ON "Agent"
    FOR SELECT
    USING ("is_public" = TRUE);

-- Enable RLS on Agent table
ALTER TABLE "Agent" ENABLE ROW LEVEL SECURITY;

COMMIT;
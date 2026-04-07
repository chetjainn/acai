-- Create tables for the ACAI Platform
CREATE TABLE agent_listings (
    agent_id UUID PRIMARY KEY,
    name TEXT NOT NULL CHECK (char_length(name) > 0),
    description TEXT NOT NULL CHECK (char_length(description) BETWEEN 10 AND 5000),
    category TEXT NOT NULL,
    capabilities TEXT[],
    pricing_model TEXT CHECK (pricing_model IN ('free', 'subscription', 'pay_per_use', 'custom')),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    owner_user_id UUID NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('draft', 'published', 'archived')),
    quality_score FLOAT CHECK (quality_score BETWEEN 0 AND 1),
    last_quality_check TIMESTAMPTZ
);

CREATE TABLE agent_reviews (
    review_id UUID PRIMARY KEY,
    agent_id UUID REFERENCES agent_listings(agent_id),
    reviewer_user_id UUID NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    helpful_count INT DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    sentiment_score FLOAT CHECK (sentiment_score BETWEEN -1 AND 1),
    is_verified_owner BOOLEAN DEFAULT FALSE
);

CREATE TABLE user_events (
    event_id UUID PRIMARY KEY,
    session_id UUID NOT NULL,
    user_id UUID,
    event_type TEXT NOT NULL,
    agent_id UUID,
    timestamp TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    properties JSON,
    user_agent TEXT,
    ip_hash TEXT
);

CREATE TABLE user_behavior_aggregated (
    date DATE NOT NULL,
    agent_id UUID NOT NULL,
    total_views INT NOT NULL,
    unique_viewers INT NOT NULL,
    deploy_clicks INT NOT NULL,
    conversion_rate FLOAT CHECK (conversion_rate BETWEEN 0 AND 1),
    avg_session_duration FLOAT,
    PRIMARY KEY (date, agent_id)
);

-- Create an index on user_events for quick lookup
CREATE INDEX idx_user_events_session ON user_events (session_id);

-- RLS Policies
ALTER TABLE agent_listings ENABLE ROW LEVEL SECURITY;
CREATE POLICY user_can_write_agent ON agent_listings
    FOR UPDATE, DELETE USING (owner_user_id = current_setting('myapp.user_id')::UUID);

ALTER TABLE agent_reviews ENABLE ROW LEVEL SECURITY;
CREATE POLICY user_can_write_review ON agent_reviews
    FOR UPDATE, DELETE USING (reviewer_user_id = current_setting('myapp.user_id')::UUID);

-- Insert sample data
INSERT INTO agent_listings (agent_id, name, description, category, capabilities, pricing_model, created_at, updated_at, owner_user_id, status, quality_score, last_quality_check)
VALUES 
('11111111-1111-1111-1111-111111111111', 'AI Image Processor', 'Processes images using AI algorithms.', 'Image Processing', ARRAY['resizing', 'filtering'], 'subscription', NOW(), NOW(), '22222222-2222-2222-2222-222222222222', 'published', 0.95, NOW());

INSERT INTO agent_reviews (review_id, agent_id, reviewer_user_id, rating, review_text, created_at, updated_at, sentiment_score, is_verified_owner)
VALUES 
('33333333-3333-3333-3333-333333333333', '11111111-1111-1111-1111-111111111111', '44444444-4444-4444-4444-444444444444', 5, 'This AI is fantastic!', NOW(), NOW(), 0.8, TRUE);

INSERT INTO user_events (event_id, session_id, user_id, event_type, agent_id, timestamp, properties, user_agent, ip_hash)
VALUES 
('55555555-5555-5555-5555-555555555555', '66666666-6666-6666-6666-666666666666', '44444444-4444-4444-4444-444444444444', 'view_listing', '11111111-1111-1111-1111-111111111111', NOW(), '{"detail":"viewed agent details"}', 'Mozilla/5.0', 'abcd1234');

INSERT INTO user_behavior_aggregated (date, agent_id, total_views, unique_viewers, deploy_clicks, conversion_rate, avg_session_duration)
VALUES 
(CURRENT_DATE, '11111111-1111-1111-1111-111111111111', 100, 80, 10, 0.1, 120.5);
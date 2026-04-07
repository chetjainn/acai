-- Create tables for the ACAI platform

CREATE TABLE IF NOT EXISTS Agent_Dim (
    agent_sk SERIAL PRIMARY KEY,
    agent_id UUID UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    developer VARCHAR(255),
    primary_category VARCHAR(255),
    tags TEXT[],
    model_info VARCHAR(255),
    capabilities_array TEXT[],
    pricing_tier VARCHAR(50),
    is_active BOOLEAN DEFAULT TRUE,
    valid_from TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    valid_to TIMESTAMP NOT NULL DEFAULT '9999-12-31',
    current_flag BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS Agent_Interaction_Fact (
    interaction_sk SERIAL PRIMARY KEY,
    date_sk INT NOT NULL,
    agent_sk INT NOT NULL REFERENCES Agent_Dim(agent_sk),
    user_sk INT,
    event_type VARCHAR(50) NOT NULL,
    session_id VARCHAR(255),
    event_count INT DEFAULT 1,
    properties JSON,
    event_timestamp TIMESTAMP NOT NULL
);

-- Add indexes for optimized query performance
CREATE INDEX ON Agent_Dim(agent_id);
CREATE INDEX ON Agent_Interaction_Fact(agent_sk);
CREATE INDEX ON Agent_Interaction_Fact(event_timestamp);

-- Sample data for Agent_Dim
INSERT INTO Agent_Dim (agent_id, name, description, developer, primary_category, tags, model_info, capabilities_array, pricing_tier) VALUES
('123e4567-e89b-12d3-a456-426614174000', 'ChatGPT', 'AI chatbot', 'OpenAI', 'Natural Language Processing', ARRAY['NLP', 'Chatbot'], 'OpenAI:ChatGPT', ARRAY['Conversational AI'], 'premium'),
('123e4567-e89b-12d3-a456-426614174001', 'Vision AI', 'Image recognition AI', 'Google', 'Computer Vision', ARRAY['CV', 'Image recognition'], 'Google:VisionAI', ARRAY['Image processing'], 'standard');

-- Sample data for Agent_Interaction_Fact
INSERT INTO Agent_Interaction_Fact (date_sk, agent_sk, event_type, session_id, properties, event_timestamp) VALUES
(20231001, 1, 'view', 'sess123', '{"compare_with": ["123e4567-e89b-12d3-a456-426614174001"]}'::json, '2023-10-01 12:00:00'),
(20231001, 2, 'compare', 'sess124', '{"compare_with": ["123e4567-e89b-12d3-a456-426614174000"]}'::json, '2023-10-01 12:05:00');

-- RLS policies setup

-- Enable RLS
ALTER TABLE Agent_Dim ENABLE ROW LEVEL SECURITY;
ALTER TABLE Agent_Interaction_Fact ENABLE ROW LEVEL SECURITY;

-- Create a policy for public access to public agents only
CREATE POLICY public_agents ON Agent_Dim
    FOR SELECT
    USING (is_active AND current_flag);

-- Create a policy allowing access to interactions based on user roles or criteria
CREATE POLICY interaction_data_access ON Agent_Interaction_Fact
    FOR SELECT
    USING (EXISTS (SELECT 1 FROM Agent_Dim WHERE Agent_Dim.agent_sk = Agent_Interaction_Fact.agent_sk AND is_active));

-- Grant SELECT permissions to specific roles
GRANT SELECT ON Agent_Dim TO PUBLIC;
GRANT SELECT ON Agent_Interaction_Fact TO COMPASS_user, FORGE_user;
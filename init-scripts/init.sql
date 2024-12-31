-- Create the greenlight role if it doesn't already exist
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'greenlight') THEN
CREATE ROLE greenlight WITH LOGIN PASSWORD 'pa55word';
END IF;
END
$$;

-- Grant privileges to the greenlight role
GRANT ALL PRIVILEGES ON DATABASE greenlight TO greenlight;

-- Connect to the greenlight database
\connect greenlight

-- Create the citext extension if it doesn't already exist
CREATE EXTENSION IF NOT EXISTS citext;

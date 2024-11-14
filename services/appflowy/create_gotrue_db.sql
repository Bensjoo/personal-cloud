-- Create database
CREATE DATABASE gotrue;

-- Create user 
CREATE USER gotrue_writer WITH ENCRYPTED PASSWORD 'choose-a-secure-password';

-- Grant privileges
GRANT ALL PRIVILEGES ON DATABASE gotrue TO gotrue_writer;

-- Create the auth schema
CREATE SCHEMA auth;

-- Grant privileges to gotrue user
GRANT ALL ON SCHEMA auth TO gotrue_writer;
GRANT ALL ON ALL TABLES IN SCHEMA auth TO gotrue_writer;
ALTER DEFAULT PRIVILEGES IN SCHEMA auth GRANT ALL ON TABLES TO gotrue_writer;


-- Create the enum type in auth schema
CREATE TYPE auth.factor_type AS ENUM ('totp', 'phone');
GRANT ALL ON TYPE auth.factor_type TO gotrue_writer;
ALTER TYPE auth.factor_type OWNER TO gotrue_writer;
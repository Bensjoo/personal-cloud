--create database
CREATE DATABASE noco;
-- writer user
CREATE USER noco_writer WITH PASSWORD 'PG_PASS';

-- as postgres in the new noco database
GRANT ALL PRIVILEGES ON DATABASE noco TO noco_writer;
GRANT ALL ON ALL TABLES IN SCHEMA public TO noco_writer;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO noco_writer;
GRANT ALL ON ALL FUNCTIONS IN SCHEMA public TO noco_writer;

-- TODO: reader user for BI hookup?
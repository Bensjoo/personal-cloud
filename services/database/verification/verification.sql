DROP TABLE IF EXISTS kpi_data;
CREATE TABLE IF NOT EXISTS kpi_data (
    name VARCHAR(255) NOT NULL,
    kpi INTEGER NOT NULL,
    timestamp TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO kpi_data (name, kpi) VALUES ('alice', 1);
INSERT INTO kpi_data (name, kpi) VALUES ('bob', 2);
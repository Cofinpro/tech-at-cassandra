CREATE KEYSPACE marketdata WITH REPLICATION = { 'class' : 'NetworkTopologyStrategy', 'datacenter1' : 3 };

USE marketdata;


CREATE TABLE axes (
  axe_date date, isin varchar, axe_time time, broker varchar,
  side varchar, size bigint, price decimal, currency varchar,
  PRIMARY KEY ((isin, axe_date), axe_time, broker, side)
) WITH CLUSTERING ORDER BY (axe_time DESC, broker ASC);


INSERT INTO axes (isin, axe_date, axe_time, broker, side, currency, price, size)
VALUES ('DE0000000011', '2018-04-04', '18:00:00', 'DEUBA', 'buy', 'EUR', 101.50, 10000);

INSERT INTO axes (isin, axe_date, axe_time, broker, side, currency, price, size)
VALUES ('DE0000000011', '2018-04-04', '18:00:00', 'BARC', 'buy', 'EUR', 102.50, 10000);

INSERT INTO axes (isin, axe_date, axe_time, broker, side, currency, price, size)
VALUES ('DE0000000011', '2018-04-04', '18:01:00', 'DEUBA', 'buy', 'EUR', 102.00, 5000);

INSERT INTO axes (isin, axe_date, axe_time, broker, side, currency, price, size)
VALUES ('US0000000022', '2018-04-04', '18:00:30', 'BARC', 'sell', 'EUR', 7.22, 1000000);

INSERT INTO axes (isin, axe_date, axe_time, broker, side, currency, price, size)
VALUES ('US0000000022', '2018-04-04', '18:01:30', 'BARC', 'sell', 'EUR', 6.97, 1000000);

INSERT INTO axes (isin, axe_date, axe_time, broker, side, currency, price, size)
VALUES ('US0000000022', '2018-04-04', '18:02:30', 'BARC', 'sell', 'EUR', 6.84, 1000000);


-- geht nicht:
SELECT * FROM axes WHERE axe_date = '2018-04-04';

-- geht:
SELECT * FROM axes WHERE axe_date = '2018-04-04' AND isin = 'DE0000000011';

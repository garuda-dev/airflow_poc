--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Homebrew)
-- Dumped by pg_dump version 14.5 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: dengg; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA dengg;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: emp; Type: TABLE; Schema: dengg; Owner: -
--

CREATE TABLE dengg.emp (
    id integer,
    f_name character varying(10),
    l_name character varying(10),
    manager_id integer
);


--
-- Name: orders; Type: TABLE; Schema: dengg; Owner: -
--

CREATE TABLE dengg.orders (
    order_id character varying(10),
    customer_id character varying(10),
    order_date timestamp without time zone,
    product_purchased text
);


--
-- Name: t; Type: TABLE; Schema: dengg; Owner: -
--

CREATE TABLE dengg.t (
    col1 text,
    col2 text
)
PARTITION BY LIST (col1);


--
-- Name: p1; Type: TABLE; Schema: dengg; Owner: -
--

CREATE TABLE dengg.p1 (
    col1 text,
    col2 text
);


--
-- Name: p2; Type: TABLE; Schema: dengg; Owner: -
--

CREATE TABLE dengg.p2 (
    col1 text,
    col2 text
);


--
-- Name: products; Type: TABLE; Schema: dengg; Owner: -
--

CREATE TABLE dengg.products (
    product_id integer,
    product_name character varying(30)
);


--
-- Name: sales; Type: TABLE; Schema: dengg; Owner: -
--

CREATE TABLE dengg.sales (
    sale_id integer,
    product_id integer,
    year integer,
    quantity integer,
    price integer
);


--
-- Name: teams; Type: TABLE; Schema: dengg; Owner: -
--

CREATE TABLE dengg.teams (
    team_1 text,
    team_2 text,
    winner text
);


--
-- Name: p1; Type: TABLE ATTACH; Schema: dengg; Owner: -
--

ALTER TABLE ONLY dengg.t ATTACH PARTITION dengg.p1 FOR VALUES IN ('Vikas');


--
-- Name: p2; Type: TABLE ATTACH; Schema: dengg; Owner: -
--

ALTER TABLE ONLY dengg.t ATTACH PARTITION dengg.p2 FOR VALUES IN ('Akshay');


--
-- Data for Name: emp; Type: TABLE DATA; Schema: dengg; Owner: -
--

INSERT INTO dengg.emp VALUES (3, 'Smriti', 'Mandhana', 2);
INSERT INTO dengg.emp VALUES (2, 'Rohit', 'Sharma', 1);
INSERT INTO dengg.emp VALUES (1, 'Virat', 'Kohali', NULL);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: dengg; Owner: -
--

INSERT INTO dengg.orders VALUES ('1', '101', '2023-01-05 00:00:00', 'Cofee Mug');
INSERT INTO dengg.orders VALUES ('2', '101', '2023-01-09 00:00:00', 'T-shirt');
INSERT INTO dengg.orders VALUES ('3', '101', '2023-01-09 00:00:00', 'Cap');
INSERT INTO dengg.orders VALUES ('4', '102', '2023-01-09 00:00:00', 'Sunglasses');
INSERT INTO dengg.orders VALUES ('5', '102', '2023-01-15 00:00:00', 'Shoes');
INSERT INTO dengg.orders VALUES ('6', '103', '2023-01-15 00:00:00', 'Cofee Mug');
INSERT INTO dengg.orders VALUES ('7', '101', '2023-01-31 00:00:00', 'Cofee Mug');
INSERT INTO dengg.orders VALUES ('8', '104', '2023-01-31 00:00:00', 'Cap');
INSERT INTO dengg.orders VALUES ('9', '105', '2023-01-31 00:00:00', 'Cofee Mug');
INSERT INTO dengg.orders VALUES ('10', '106', '2023-01-31 00:00:00', 'Shoes');


--
-- Data for Name: p1; Type: TABLE DATA; Schema: dengg; Owner: -
--

INSERT INTO dengg.p1 VALUES ('Vikas', 'ENGG');
INSERT INTO dengg.p1 VALUES ('Vikas', 'ENGG');


--
-- Data for Name: p2; Type: TABLE DATA; Schema: dengg; Owner: -
--

INSERT INTO dengg.p2 VALUES ('Akshay', 'ENGG');
INSERT INTO dengg.p2 VALUES ('Akshay', 'ENGG');


--
-- Data for Name: products; Type: TABLE DATA; Schema: dengg; Owner: -
--

INSERT INTO dengg.products VALUES (100, 'Nokia');
INSERT INTO dengg.products VALUES (200, 'IPhone');
INSERT INTO dengg.products VALUES (300, 'Samsung');
INSERT INTO dengg.products VALUES (400, 'LG');


--
-- Data for Name: sales; Type: TABLE DATA; Schema: dengg; Owner: -
--

INSERT INTO dengg.sales VALUES (1, 100, 2010, 25, 5000);
INSERT INTO dengg.sales VALUES (2, 100, 2011, 16, 5000);
INSERT INTO dengg.sales VALUES (3, 100, 2012, 8, 5000);
INSERT INTO dengg.sales VALUES (4, 200, 2010, 10, 9000);
INSERT INTO dengg.sales VALUES (5, 200, 2011, 15, 9000);
INSERT INTO dengg.sales VALUES (6, 200, 2012, 20, 9000);
INSERT INTO dengg.sales VALUES (7, 300, 2010, 20, 7000);
INSERT INTO dengg.sales VALUES (8, 300, 2011, 18, 7000);
INSERT INTO dengg.sales VALUES (9, 300, 2012, 20, 7000);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: dengg; Owner: -
--

INSERT INTO dengg.teams VALUES ('TeamA', 'TeamB', 'TeamA');
INSERT INTO dengg.teams VALUES ('TeamA', 'TeamB', 'TeamB');


--
-- PostgreSQL database dump complete
--


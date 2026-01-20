--
-- PostgreSQL database dump
--

\restrict aGKs6f956iwHiTvPsuHh7EKfSIuCjQtoookDbEw2hbNbo46KupCfw2ru8RDcEPu

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2026-01-20 05:15:42

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 16768)
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    id_producto integer NOT NULL,
    nombre character varying(100) NOT NULL,
    precio integer NOT NULL,
    stock integer NOT NULL,
    CONSTRAINT producto_stock_check CHECK ((stock >= 0))
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16767)
-- Name: producto_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.producto_id_producto_seq OWNER TO postgres;

--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 220
-- Name: producto_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_id_producto_seq OWNED BY public.producto.id_producto;


--
-- TOC entry 219 (class 1259 OID 16757)
-- Name: vendedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendedor (
    cedula bigint NOT NULL,
    nombre character varying(100) NOT NULL,
    correo character varying(100) NOT NULL,
    telefono character varying(20)
);


ALTER TABLE public.vendedor OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16780)
-- Name: venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venta (
    id_venta integer NOT NULL,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    cantidad integer NOT NULL,
    valor_total integer NOT NULL,
    cedula_vendedor bigint,
    id_producto integer
);


ALTER TABLE public.venta OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16779)
-- Name: venta_id_venta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venta_id_venta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.venta_id_venta_seq OWNER TO postgres;

--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 222
-- Name: venta_id_venta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venta_id_venta_seq OWNED BY public.venta.id_venta;


--
-- TOC entry 4865 (class 2604 OID 16771)
-- Name: producto id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto ALTER COLUMN id_producto SET DEFAULT nextval('public.producto_id_producto_seq'::regclass);


--
-- TOC entry 4866 (class 2604 OID 16783)
-- Name: venta id_venta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta ALTER COLUMN id_venta SET DEFAULT nextval('public.venta_id_venta_seq'::regclass);


--
-- TOC entry 5028 (class 0 OID 16768)
-- Dependencies: 221
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto (id_producto, nombre, precio, stock) FROM stdin;
2	Batería 12V	350000	20
3	Frenos	85000	50
4	Aceite 1L	45000	80
5	Plumillas	15000	60
6	motor	27000000	5
1	Filtro Aceite	25000	99
\.


--
-- TOC entry 5026 (class 0 OID 16757)
-- Dependencies: 219
-- Data for Name: vendedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendedor (cedula, nombre, correo, telefono) FROM stdin;
1010	Carlos Pérez	carlos@mail.com	3001
2020	Maria Rodriguez	maria@mail.com	3002
3030	Juan Gomez	juan@mail.com	3003
4040	Ana Diaz	ana@mail.com	3004
5050	Luis Martinez	luis@mail.com	3005
\.


--
-- TOC entry 5030 (class 0 OID 16780)
-- Dependencies: 223
-- Data for Name: venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venta (id_venta, fecha, cantidad, valor_total, cedula_vendedor, id_producto) FROM stdin;
1	2026-01-20 01:14:37.960063	2	50000	1010	1
2	2026-01-20 01:14:37.960063	1	350000	2020	2
3	2026-01-20 01:14:37.960063	4	340000	3030	3
4	2026-01-20 01:14:37.960063	1	45000	4040	4
5	2026-01-20 01:14:37.960063	2	30000	5050	5
6	2026-01-20 04:08:23.377839	3	81000000	5050	6
\.


--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 220
-- Name: producto_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_id_producto_seq', 6, true);


--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 222
-- Name: venta_id_venta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.venta_id_venta_seq', 6, true);


--
-- TOC entry 4874 (class 2606 OID 16778)
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id_producto);


--
-- TOC entry 4870 (class 2606 OID 16766)
-- Name: vendedor vendedor_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendedor
    ADD CONSTRAINT vendedor_correo_key UNIQUE (correo);


--
-- TOC entry 4872 (class 2606 OID 16764)
-- Name: vendedor vendedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendedor
    ADD CONSTRAINT vendedor_pkey PRIMARY KEY (cedula);


--
-- TOC entry 4876 (class 2606 OID 16789)
-- Name: venta venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_pkey PRIMARY KEY (id_venta);


--
-- TOC entry 4877 (class 2606 OID 16790)
-- Name: venta venta_cedula_vendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_cedula_vendedor_fkey FOREIGN KEY (cedula_vendedor) REFERENCES public.vendedor(cedula) ON DELETE SET NULL;


--
-- TOC entry 4878 (class 2606 OID 16795)
-- Name: venta venta_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto) ON DELETE RESTRICT;


-- Completed on 2026-01-20 05:15:42

--
-- PostgreSQL database dump complete
--

\unrestrict aGKs6f956iwHiTvPsuHh7EKfSIuCjQtoookDbEw2hbNbo46KupCfw2ru8RDcEPu


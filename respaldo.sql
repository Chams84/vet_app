--
-- PostgreSQL database dump
--

\restrict KULUjep5pZfwRj974VgcFC0I7nYREWIJc1fqV8YmLiop8VSXhVqPqmjODrazD0W

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin; Type: TABLE; Schema: public; Owner: vet_admin
--

CREATE TABLE public.admin (
    id integer NOT NULL,
    nombre text,
    email text,
    password text
);


ALTER TABLE public.admin OWNER TO vet_admin;

--
-- Name: admin_id_seq; Type: SEQUENCE; Schema: public; Owner: vet_admin
--

CREATE SEQUENCE public.admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_id_seq OWNER TO vet_admin;

--
-- Name: admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vet_admin
--

ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;


--
-- Name: consultas; Type: TABLE; Schema: public; Owner: vet_admin
--

CREATE TABLE public.consultas (
    id integer NOT NULL,
    horario text,
    id_doctor integer,
    id_mascota integer
);


ALTER TABLE public.consultas OWNER TO vet_admin;

--
-- Name: consultas_id_seq; Type: SEQUENCE; Schema: public; Owner: vet_admin
--

CREATE SEQUENCE public.consultas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.consultas_id_seq OWNER TO vet_admin;

--
-- Name: consultas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vet_admin
--

ALTER SEQUENCE public.consultas_id_seq OWNED BY public.consultas.id;


--
-- Name: doctores; Type: TABLE; Schema: public; Owner: vet_admin
--

CREATE TABLE public.doctores (
    id integer NOT NULL,
    nombre text,
    especialidad text,
    horario text,
    contacto text
);


ALTER TABLE public.doctores OWNER TO vet_admin;

--
-- Name: doctores_id_seq; Type: SEQUENCE; Schema: public; Owner: vet_admin
--

CREATE SEQUENCE public.doctores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.doctores_id_seq OWNER TO vet_admin;

--
-- Name: doctores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vet_admin
--

ALTER SEQUENCE public.doctores_id_seq OWNED BY public.doctores.id;


--
-- Name: mascotas; Type: TABLE; Schema: public; Owner: vet_admin
--

CREATE TABLE public.mascotas (
    id integer NOT NULL,
    nombre text,
    edad integer,
    raza text,
    peso double precision,
    sexo text,
    h_medico text
);


ALTER TABLE public.mascotas OWNER TO vet_admin;

--
-- Name: mascotas_id_seq; Type: SEQUENCE; Schema: public; Owner: vet_admin
--

CREATE SEQUENCE public.mascotas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mascotas_id_seq OWNER TO vet_admin;

--
-- Name: mascotas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vet_admin
--

ALTER SEQUENCE public.mascotas_id_seq OWNED BY public.mascotas.id;


--
-- Name: admin id; Type: DEFAULT; Schema: public; Owner: vet_admin
--

ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);


--
-- Name: consultas id; Type: DEFAULT; Schema: public; Owner: vet_admin
--

ALTER TABLE ONLY public.consultas ALTER COLUMN id SET DEFAULT nextval('public.consultas_id_seq'::regclass);


--
-- Name: doctores id; Type: DEFAULT; Schema: public; Owner: vet_admin
--

ALTER TABLE ONLY public.doctores ALTER COLUMN id SET DEFAULT nextval('public.doctores_id_seq'::regclass);


--
-- Name: mascotas id; Type: DEFAULT; Schema: public; Owner: vet_admin
--

ALTER TABLE ONLY public.mascotas ALTER COLUMN id SET DEFAULT nextval('public.mascotas_id_seq'::regclass);


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: vet_admin
--

COPY public.admin (id, nombre, email, password) FROM stdin;
2	Ricardo	chamsk8@vet.com	scrypt:32768:8:1$UmZD3igiKgURowof$45876073e646962dfb4f1799203bd2c06193e91c1b6c572ccabb87b56b4251777879de3d73edb6ca6dbc8c09bda3113e83f8d478d5c29985ef4ad66abf7193fc
4	Dafne	daxx@vet.com	scrypt:32768:8:1$UPG702YbITJjTok9$dc3b2c975e9e3211849cb486519729088595030c32730fb1d06544b99f0b24751b65ce1fb9a6ccf0eddbead78c1fea80917d20d2fe24df52bf61ab76f6440f32
\.


--
-- Data for Name: consultas; Type: TABLE DATA; Schema: public; Owner: vet_admin
--

COPY public.consultas (id, horario, id_doctor, id_mascota) FROM stdin;
2	Vespertino	3	2
1	Vespertino	2	1
\.


--
-- Data for Name: doctores; Type: TABLE DATA; Schema: public; Owner: vet_admin
--

COPY public.doctores (id, nombre, especialidad, horario, contacto) FROM stdin;
2	Ricardo	Veterinaria	Matutino	5546876428
3	Dafne	Cirugía	Matutino	5576856978
\.


--
-- Data for Name: mascotas; Type: TABLE DATA; Schema: public; Owner: vet_admin
--

COPY public.mascotas (id, nombre, edad, raza, peso, sexo, h_medico) FROM stdin;
1	Wally	9	Labrador	20.2	M	Perro
2	Logan	15	French Poodle	5.5	M	Perro Sano
\.


--
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vet_admin
--

SELECT pg_catalog.setval('public.admin_id_seq', 4, true);


--
-- Name: consultas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vet_admin
--

SELECT pg_catalog.setval('public.consultas_id_seq', 2, true);


--
-- Name: doctores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vet_admin
--

SELECT pg_catalog.setval('public.doctores_id_seq', 3, true);


--
-- Name: mascotas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vet_admin
--

SELECT pg_catalog.setval('public.mascotas_id_seq', 2, true);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: vet_admin
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- Name: consultas consultas_pkey; Type: CONSTRAINT; Schema: public; Owner: vet_admin
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT consultas_pkey PRIMARY KEY (id);


--
-- Name: doctores doctores_pkey; Type: CONSTRAINT; Schema: public; Owner: vet_admin
--

ALTER TABLE ONLY public.doctores
    ADD CONSTRAINT doctores_pkey PRIMARY KEY (id);


--
-- Name: mascotas mascotas_pkey; Type: CONSTRAINT; Schema: public; Owner: vet_admin
--

ALTER TABLE ONLY public.mascotas
    ADD CONSTRAINT mascotas_pkey PRIMARY KEY (id);


--
-- Name: consultas consultas_id_doctor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vet_admin
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT consultas_id_doctor_fkey FOREIGN KEY (id_doctor) REFERENCES public.doctores(id);


--
-- Name: consultas consultas_id_mascota_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vet_admin
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT consultas_id_mascota_fkey FOREIGN KEY (id_mascota) REFERENCES public.mascotas(id);


--
-- PostgreSQL database dump complete
--

\unrestrict KULUjep5pZfwRj974VgcFC0I7nYREWIJc1fqV8YmLiop8VSXhVqPqmjODrazD0W


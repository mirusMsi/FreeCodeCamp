--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: atmosphere; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.atmosphere (
    atmosphere_id integer NOT NULL,
    planet_id integer NOT NULL,
    component_id integer NOT NULL,
    value numeric(3,1) NOT NULL,
    name character varying
);


ALTER TABLE public.atmosphere OWNER TO freecodecamp;

--
-- Name: atmosphere_atmosphere_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.atmosphere_atmosphere_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.atmosphere_atmosphere_id_seq OWNER TO freecodecamp;

--
-- Name: atmosphere_atmosphere_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.atmosphere_atmosphere_id_seq OWNED BY public.atmosphere.atmosphere_id;


--
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying NOT NULL,
    comment text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.cluster_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cluster_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.cluster_cluster_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: component; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.component (
    component_id integer NOT NULL,
    name character varying NOT NULL,
    shortname character varying(12) NOT NULL
);


ALTER TABLE public.component OWNER TO freecodecamp;

--
-- Name: components_component_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.components_component_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_component_id_seq OWNER TO freecodecamp;

--
-- Name: components_component_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.components_component_id_seq OWNED BY public.component.component_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    radius_in_kly integer,
    distance_in_kly numeric(12,2),
    constellation_id integer,
    stars_in_g integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    distance_to_planet numeric(12,4),
    weight_in_m numeric(12,4),
    radius_in_r numeric(12,4)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer NOT NULL,
    weight_in_m numeric(12,4),
    radius_in_r numeric(12,4),
    rings_is boolean NOT NULL,
    magnetosphere_is boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_palnet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_palnet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_palnet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_palnet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_palnet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer NOT NULL,
    weight_in_m numeric(4,1),
    radius_in_r numeric(4,1)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: atmosphere atmosphere_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.atmosphere ALTER COLUMN atmosphere_id SET DEFAULT nextval('public.atmosphere_atmosphere_id_seq'::regclass);


--
-- Name: component component_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.component ALTER COLUMN component_id SET DEFAULT nextval('public.components_component_id_seq'::regclass);


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.cluster_cluster_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_palnet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: atmosphere; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.atmosphere VALUES (1, 2, 1, 96.0, NULL);
INSERT INTO public.atmosphere VALUES (2, 2, 3, 4.0, NULL);
INSERT INTO public.atmosphere VALUES (3, 3, 2, 78.0, NULL);
INSERT INTO public.atmosphere VALUES (4, 3, 5, 21.0, NULL);
INSERT INTO public.atmosphere VALUES (5, 3, 6, 1.0, NULL);
INSERT INTO public.atmosphere VALUES (6, 4, 1, 95.0, NULL);
INSERT INTO public.atmosphere VALUES (7, 4, 3, 3.0, NULL);
INSERT INTO public.atmosphere VALUES (8, 4, 6, 2.0, NULL);
INSERT INTO public.atmosphere VALUES (9, 5, 8, 89.0, NULL);
INSERT INTO public.atmosphere VALUES (10, 5, 9, 11.0, NULL);
INSERT INTO public.atmosphere VALUES (11, 6, 8, 94.0, NULL);
INSERT INTO public.atmosphere VALUES (12, 6, 9, 6.0, NULL);
INSERT INTO public.atmosphere VALUES (13, 7, 8, 83.0, NULL);
INSERT INTO public.atmosphere VALUES (14, 7, 9, 17.0, NULL);
INSERT INTO public.atmosphere VALUES (15, 8, 8, 80.0, NULL);
INSERT INTO public.atmosphere VALUES (16, 8, 9, 20.0, NULL);


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.component VALUES (1, 'Carbon dioxide', 'CO2');
INSERT INTO public.component VALUES (2, 'Nitrogen', 'N');
INSERT INTO public.component VALUES (3, 'Dinitrogen', 'N2');
INSERT INTO public.component VALUES (4, 'Oxygen', 'O');
INSERT INTO public.component VALUES (5, 'Dioxygen', 'O2');
INSERT INTO public.component VALUES (6, 'Argon', 'Ar');
INSERT INTO public.component VALUES (7, 'Hydrogen', 'H');
INSERT INTO public.component VALUES (8, 'Dihydrogen', 'H2');
INSERT INTO public.component VALUES (9, 'Helium', 'He');


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Sagittarius', NULL);
INSERT INTO public.constellation VALUES (2, 'Andromeda', NULL);
INSERT INTO public.constellation VALUES (3, 'Perseus', NULL);
INSERT INTO public.constellation VALUES (4, 'Pavo', NULL);
INSERT INTO public.constellation VALUES (5, 'Sculptor', NULL);
INSERT INTO public.constellation VALUES (6, 'Coma Berenices', NULL);
INSERT INTO public.constellation VALUES (7, 'Viro', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'UGC 2885', 463, 232.00, 3, NULL);
INSERT INTO public.galaxy VALUES (4, 'NGC 6872', 522, 212.00, 4, NULL);
INSERT INTO public.galaxy VALUES (5, 'Comet', 600, 3200000.00, 5, NULL);
INSERT INTO public.galaxy VALUES (6, 'NGC 4874', 1000, 3600000.00, 6, NULL);
INSERT INTO public.galaxy VALUES (7, 'IC 1101', 210, 1000000.00, 7, 100000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220, 2.45, 2, 1000);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 185, NULL, 1, 400);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 362600.0000, 1.0000, 1.0000);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 9234.4200, 1.7690, 1.7840);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 23455.5000, 0.2472, 0.9732);
INSERT INTO public.moon VALUES (4, 'Io', 5, 420000.0000, 0.0150, 0.2860);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 664862.0000, 0.0080, 0.2450);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 1069200.0000, 0.0250, 0.4130);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 1869000.0000, 0.0180, 0.3780);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 181902.0000, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 237948.0000, 0.0180, 0.0395);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 294619.0000, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 377396.0000, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 527108.0000, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Titan', 6, 1186680.0000, 0.0225, 0.4040);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 3560820.0000, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 129390.0000, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 191020.0000, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 266000.0000, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 435910.0000, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 583520.0000, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Nereid', 8, 5513940.0000, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Sao', 8, 22228000.0000, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Laomedeia', 8, 23613000.0000, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Triton', 8, 354759.0000, 0.0036, 0.2122);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 7, 0.0550, 0.3829, false, true);
INSERT INTO public.planet VALUES (2, 'Venus', 7, 0.8150, 0.9499, false, false);
INSERT INTO public.planet VALUES (3, 'Earth', 7, 1.0000, 1.0000, false, true);
INSERT INTO public.planet VALUES (4, 'Mars', 7, 0.1070, 0.5330, false, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 7, 317.8000, 10.9730, true, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 7, 95.1590, 9.1402, true, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 7, 14.5360, 4.0070, true, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 7, 17.1470, 3.8830, true, true);
INSERT INTO public.planet VALUES (10, 'Gliese 436 b', 2, 21.3600, 4.3270, false, false);
INSERT INTO public.planet VALUES (9, 'Gliese 1214 b', 1, 8.1700, 2.7420, false, false);
INSERT INTO public.planet VALUES (11, 'Gliese 504 b', 3, 317.8000, 0.9600, false, true);
INSERT INTO public.planet VALUES (12, 'Kepler-10c', 4, 7.3700, 2.3500, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 2, 2.1, 1.7);
INSERT INTO public.star VALUES (2, 'Pollux', 3, 1.9, 9.1);
INSERT INTO public.star VALUES (3, 'Arcturus', 4, 1.1, 25.4);
INSERT INTO public.star VALUES (4, 'Aldebaran', 5, 1.2, 45.1);
INSERT INTO public.star VALUES (5, 'Rigel', 6, 21.0, 78.9);
INSERT INTO public.star VALUES (6, 'Antares', 7, 14.3, 680.0);
INSERT INTO public.star VALUES (7, 'Sun', 1, 1.0, 1.0);


--
-- Name: atmosphere_atmosphere_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.atmosphere_atmosphere_id_seq', 16, true);


--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.cluster_cluster_id_seq', 7, true);


--
-- Name: components_component_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.components_component_id_seq', 9, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_palnet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_palnet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: atmosphere atmosphere_foreign_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.atmosphere
    ADD CONSTRAINT atmosphere_foreign_key UNIQUE (planet_id, component_id);


--
-- Name: atmosphere atmosphere_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.atmosphere
    ADD CONSTRAINT atmosphere_pkey PRIMARY KEY (atmosphere_id);


--
-- Name: constellation cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT cluster_name_key UNIQUE (name);


--
-- Name: constellation cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT cluster_pkey PRIMARY KEY (constellation_id);


--
-- Name: component components_fullname_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT components_fullname_key UNIQUE (name);


--
-- Name: component components_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT components_pkey PRIMARY KEY (component_id);


--
-- Name: component components_shortname_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT components_shortname_key UNIQUE (shortname);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: atmosphere atmosphere_component_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.atmosphere
    ADD CONSTRAINT atmosphere_component_id_fkey FOREIGN KEY (component_id) REFERENCES public.component(component_id);


--
-- Name: atmosphere atmosphere_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.atmosphere
    ADD CONSTRAINT atmosphere_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: galaxy galaxy_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_cluster_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon

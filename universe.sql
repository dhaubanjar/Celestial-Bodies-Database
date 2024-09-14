--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: astronomical_events; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomical_events (
    astronomical_events_id integer NOT NULL,
    name character varying(100) NOT NULL,
    related_star_id integer NOT NULL,
    related_planet_id integer NOT NULL,
    is_significant boolean NOT NULL,
    description text,
    event_magnitude numeric(10,2)
);


ALTER TABLE public.astronomical_events OWNER TO freecodecamp;

--
-- Name: astronomical_events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomical_events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomical_events_event_id_seq OWNER TO freecodecamp;

--
-- Name: astronomical_events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomical_events_event_id_seq OWNED BY public.astronomical_events.astronomical_events_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_count integer,
    planet_count integer,
    distance_from_earth numeric(10,2),
    is_visible boolean,
    galaxy_type text
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
    name character varying(50) NOT NULL,
    moon_count integer,
    planet_count integer,
    distance_from_earth numeric(10,2),
    is_visible boolean,
    galaxy_type text,
    planet_id integer
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
    name character varying(50) NOT NULL,
    moon_count integer,
    population integer,
    distance_from_earth numeric(10,2),
    is_visible boolean,
    galaxy_type text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_count integer,
    planet_count integer,
    distance_from_earth numeric(10,2),
    is_visible boolean,
    galaxy_type text,
    galaxy_id integer
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
-- Name: astronomical_events astronomical_events_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_events ALTER COLUMN astronomical_events_id SET DEFAULT nextval('public.astronomical_events_event_id_seq'::regclass);


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

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: astronomical_events; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomical_events VALUES (1, 'Supernova Explosion', 1, 2, true, 'A massive star explodes, emitting a bright burst of light.', 20.15);
INSERT INTO public.astronomical_events VALUES (2, 'Comet Arrival', 3, 4, true, 'A new comet has entered the solar system, visible to the naked eye.', 5.80);
INSERT INTO public.astronomical_events VALUES (3, 'Planetary Alignment', 2, 5, false, 'A rare alignment of multiple planets in the night sky.', 2.45);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000000, 8, 0.00, true, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000000, 15, 2537000.00, true, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 500000000, 9, 29000000.00, false, 'Elliptical');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 200000000, 5, 23000000.00, true, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 400000000, 3, 3000000.00, true, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 800000000, 6, 50000000.00, false, 'Lenticular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 1, 0.00, true, 'Terrestrial', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 1, 0, 9.38, true, 'Rocky', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 1, 0, 23.46, true, 'Rocky', 2);
INSERT INTO public.moon VALUES (4, 'Io', 1, 0, 421.70, true, 'Volcanic', 3);
INSERT INTO public.moon VALUES (5, 'Europa', 1, 0, 670.90, true, 'Icy', 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1, 0, 1070.00, true, 'Icy', 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 1, 0, 1882.70, true, 'Icy', 3);
INSERT INTO public.moon VALUES (8, 'Titan', 1, 0, 1221.00, true, 'Atmospheric', 4);
INSERT INTO public.moon VALUES (9, 'Rhea', 1, 0, 527.00, true, 'Ice', 4);
INSERT INTO public.moon VALUES (10, 'Iapetus', 1, 0, 356.00, true, 'Rocky', 4);
INSERT INTO public.moon VALUES (11, 'Enceladus', 1, 0, 238.00, true, 'Icy', 4);
INSERT INTO public.moon VALUES (12, 'Triton', 1, 0, 354.76, true, 'Icy', 5);
INSERT INTO public.moon VALUES (13, 'Charon', 1, 0, 197.00, true, 'Rocky', 5);
INSERT INTO public.moon VALUES (14, 'Nereid', 1, 0, 115000.00, false, 'Icy', 5);
INSERT INTO public.moon VALUES (15, 'Oberon', 1, 0, 583.50, true, 'Rocky', 6);
INSERT INTO public.moon VALUES (16, 'Miranda', 1, 0, 129.00, true, 'Icy', 6);
INSERT INTO public.moon VALUES (17, 'Titania', 1, 0, 436.00, true, 'Icy', 6);
INSERT INTO public.moon VALUES (18, 'Ariel', 1, 0, 191.00, true, 'Icy', 6);
INSERT INTO public.moon VALUES (19, 'Mimas', 1, 0, 185.00, true, 'Rocky', 6);
INSERT INTO public.moon VALUES (20, 'Phoebe', 1, 0, 12952.00, false, 'Icy', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 78000, 0.00, true, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (2, 'Mars', 2, 0, 227.93, true, 'Terrestrial', 2);
INSERT INTO public.planet VALUES (3, 'Jupiter', 79, 0, 778.57, true, 'Gas Giant', 3);
INSERT INTO public.planet VALUES (4, 'Saturn', 83, 0, 1433.53, true, 'Gas Giant', 4);
INSERT INTO public.planet VALUES (5, 'Uranus', 27, 0, 2872.46, true, 'Ice Giant', 5);
INSERT INTO public.planet VALUES (6, 'Neptune', 14, 0, 4495.06, false, 'Ice Giant', 6);
INSERT INTO public.planet VALUES (7, 'Mercury', 0, 0, 57.91, true, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (8, 'Venus', 0, 0, 108.21, true, 'Terrestrial', 2);
INSERT INTO public.planet VALUES (9, 'Pluto', 5, 0, 5913.00, false, 'Dwarf Planet', 3);
INSERT INTO public.planet VALUES (10, 'Eris', 1, 0, 9600.00, false, 'Dwarf Planet', 4);
INSERT INTO public.planet VALUES (11, 'Haumea', 2, 0, 6430.00, false, 'Dwarf Planet', 5);
INSERT INTO public.planet VALUES (12, 'Makemake', 1, 0, 6510.00, false, 'Dwarf Planet', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1000000, 5, 8.60, true, 'Main Sequence', 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 500000, 3, 642.50, true, 'Red Supergiant', 2);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 800000, 2, 4.24, true, 'Red Dwarf', 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 1500000, 6, 4.37, true, 'Main Sequence', 1);
INSERT INTO public.star VALUES (5, 'Vega', 1200000, 4, 25.04, true, 'Main Sequence', 3);
INSERT INTO public.star VALUES (6, 'Rigel', 700000, 2, 863.00, false, 'Blue Supergiant', 2);


--
-- Name: astronomical_events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomical_events_event_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: astronomical_events astronomical_events_event_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_events
    ADD CONSTRAINT astronomical_events_event_name_key UNIQUE (name);


--
-- Name: astronomical_events astronomical_events_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_events
    ADD CONSTRAINT astronomical_events_pkey PRIMARY KEY (astronomical_events_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


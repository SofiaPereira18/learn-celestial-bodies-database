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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    speed numeric,
    age integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_planets integer,
    number_stars double precision,
    age double precision
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter numeric,
    has_ring boolean,
    speed numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_ring boolean,
    diameter numeric NOT NULL,
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_ring boolean,
    diameter numeric,
    speed numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 17.1, 5);
INSERT INTO public.asteroid VALUES (2, 'Pallas', 15.4, 5);
INSERT INTO public.asteroid VALUES (3, 'Vesta', 22.6, 5);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 13.3, 5);
INSERT INTO public.asteroid VALUES (5, 'Eros', 20.1, 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 8, 100000000000, 13);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 5, 1000000000000, 10);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3, 40000000000, 3);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 4, 30000000000, 8);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 6, 20000000000, 5);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 2, 50000000000, 13);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3474.0, false, 1.58, 3);
INSERT INTO public.moon VALUES (2, 'Io', 3643.0, false, 17.33, 4);
INSERT INTO public.moon VALUES (3, 'Europa', 3121.6, false, 13.74, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5262.4, false, 10.88, 4);
INSERT INTO public.moon VALUES (5, 'Callisto', 4821.6, false, 8.21, 4);
INSERT INTO public.moon VALUES (6, 'Titan', 5152.0, true, 5.57, 5);
INSERT INTO public.moon VALUES (7, 'Rhea', 763.8, false, 4.77, 5);
INSERT INTO public.moon VALUES (8, 'Enceladus', 504.2, false, 12.61, 5);
INSERT INTO public.moon VALUES (9, 'Tethys', 1062.0, false, 5.95, 5);
INSERT INTO public.moon VALUES (10, 'Iapetus', 1469.0, true, 3.93, 5);
INSERT INTO public.moon VALUES (11, 'Miranda', 471.6, false, 6.58, 7);
INSERT INTO public.moon VALUES (12, 'Ariel', 1167.0, false, 7.89, 7);
INSERT INTO public.moon VALUES (13, 'Umbriel', 1169.0, false, 6.80, 7);
INSERT INTO public.moon VALUES (14, 'Titania', 1577.0, false, 5.53, 7);
INSERT INTO public.moon VALUES (15, 'Oberon', 1523.0, false, 5.41, 7);
INSERT INTO public.moon VALUES (16, 'Triton', 2706.0, false, 4.35, 8);
INSERT INTO public.moon VALUES (17, 'Proteus', 418.0, false, 5.87, 8);
INSERT INTO public.moon VALUES (18, 'Nereid', 170.0, false, 1.69, 8);
INSERT INTO public.moon VALUES (19, 'Charon', 1212.0, false, 0.67, 9);
INSERT INTO public.moon VALUES (20, 'Haumea I', 500.0, false, 2.33, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 4879.0, 'The closest planet to the Sun.', 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, 12104.0, 'The second planet from the Sun.', 1);
INSERT INTO public.planet VALUES (3, 'Earth', false, 12742.0, 'Our home planet.', 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 6779.0, 'Known as the Red Planet.', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, 139820.0, 'The largest planet in the Solar System.', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', true, 116460.0, 'Famous for its rings.', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', true, 50724.0, 'Has a unique tilt on its axis.', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', true, 49244.0, 'The farthest planet from the Sun.', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', true, 2376.6, 'A dwarf planet in the Kuiper Belt.', 1);
INSERT INTO public.planet VALUES (10, 'Eris', true, 2326.0, 'A dwarf planet in the scattered disk.', 1);
INSERT INTO public.planet VALUES (11, 'Haumea', true, 1632.0, 'A dwarf planet known for its elongated shape.', 1);
INSERT INTO public.planet VALUES (12, 'Ceres', true, 939.4, 'The largest object in the asteroid belt.', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri', true, 1.2, 30.0, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', false, 1.5, 20.0, 1);
INSERT INTO public.star VALUES (3, 'Sirius', true, 1.0, 40.0, 2);
INSERT INTO public.star VALUES (4, 'Polaris', false, 0.8, 25.0, 2);
INSERT INTO public.star VALUES (5, 'Vega', true, 1.1, 35.0, 3);
INSERT INTO public.star VALUES (6, 'Arcturus', false, 1.3, 22.0, 3);


--
-- Name: asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_id_seq', 1, false);


--
-- Name: asteroid asteroid_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_id PRIMARY KEY (asteroid_id);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id PRIMARY KEY (moon_id);


--
-- Name: moon moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id PRIMARY KEY (planet_id);


--
-- Name: planet planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id PRIMARY KEY (star_id);


--
-- Name: star star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_key UNIQUE (star_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


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


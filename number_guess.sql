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

DROP DATABASE users;
--
-- Name: users; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE users WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE users OWNER TO freecodecamp;

\connect users

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('Rafael', NULL, NULL);
INSERT INTO public.users VALUES ('user_1734708240061', NULL, NULL);
INSERT INTO public.users VALUES ('user_1734708240061', NULL, NULL);
INSERT INTO public.users VALUES ('user_1734708240060', NULL, NULL);
INSERT INTO public.users VALUES ('user_1734708240060', NULL, NULL);
INSERT INTO public.users VALUES ('user_1734708240061', NULL, NULL);
INSERT INTO public.users VALUES ('user_1734708240061', NULL, NULL);
INSERT INTO public.users VALUES ('user_1734708240061', NULL, NULL);
INSERT INTO public.users VALUES ('user_1734708270393', NULL, NULL);
INSERT INTO public.users VALUES ('user_1734708270393', NULL, NULL);
INSERT INTO public.users VALUES ('user_1734708270392', NULL, NULL);
INSERT INTO public.users VALUES ('user_1734708270392', NULL, NULL);
INSERT INTO public.users VALUES ('user_1734708270393', NULL, NULL);
INSERT INTO public.users VALUES ('user_1734708270393', NULL, NULL);
INSERT INTO public.users VALUES ('user_1734708270393', NULL, NULL);
INSERT INTO public.users VALUES ('user_1734708286318', NULL, NULL);
INSERT INTO public.users VALUES ('user_1734708286317', NULL, NULL);
INSERT INTO public.users VALUES ('user_1734708647041', 2, 379);
INSERT INTO public.users VALUES ('user_1734708647042', 5, 408);
INSERT INTO public.users VALUES ('user_1734708924020', 2, 218);
INSERT INTO public.users VALUES ('user_1734708924021', 5, 26);
INSERT INTO public.users VALUES ('user_1734709000477', 2, 102);
INSERT INTO public.users VALUES ('user_1734709000478', 5, 164);


--
-- PostgreSQL database dump complete
--


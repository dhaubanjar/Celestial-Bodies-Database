# Celestial-Bodies-Database

# Introduction
A database project to fulfill the requirements of freecodecamp.org

# About Project
This project consists of a relational database designed to catalog and manage data about galaxies, planets, stars, moons, and astronomical events. The database includes the following tables:
 * **Galaxy** : Stores information about different galaxies.
 * **Planet** : Contains data on various planets within those galaxies.
 * **Star** : Includes details on stars, such as their properties and locations.
 * **Moon** : Records information about moons orbiting the planets.
 * **Astronomical_events** : Logs significant events related to celestial bodies, like eclipses or supernovas.

# Database Schema
* **Galaxy** :
    * galaxy_id integer NOT NULL
    * name character varying(50) NOT NULL
    * star_count integer
    * planet_count integer
    * distance_from_earth numeric(10,2)
    * is_visible boolean
    * galaxy_type text
 
* **Moon** :
    * moon_id integer NOT NULL
    * name character varying(50) NOT NULL
    * moon_count integer
    * planet_count integer
    * distance_from_earth numeric(10,2)
    * is_visible boolean
    * galaxy_type text
    * planet_id integer
 
* **Planet** :
    * planet_id integer NOT NULL
    * name character varying(50) NOT NULL
    * moon_count integer
    * population integer
    * distance_from_earth numeric(10,2)
    * is_visible boolean
    * galaxy_type text
    * star_id integer
 
* **Star** :
    * star_id integer NOT NULL
    * name character varying(50) NOT NULL
    * star_count integer
    * planet_count integer
    * distance_from_earth numeric(10,2)
    * is_visible boolean
    * galaxy_type text
    * galaxy_id integer 

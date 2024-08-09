--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1.pgdg120+1)

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
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id character varying(10) NOT NULL,
    name character varying(100),
    price numeric(5,2),
    description text,
    image character varying(255),
    category character varying(50),
    rating integer,
    is_featured boolean DEFAULT false
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, price, description, image, category, rating, is_featured) FROM stdin;
m1	Mac & Cheese	8.99	Creamy cheddar cheese mixed with perfectly cooked macaroni, topped with crispy breadcrumbs. A classic comfort food.	images/beef-tacos.jpg	Fastfood	4	f
m3	Caesar Salad	7.99	Romaine lettuce tossed in Caesar dressing, topped with croutons and parmesan shavings.	images/caesar-salad.jpg	Salads	3	f
m4	Spaghetti Carbonara	10.99	Al dente spaghetti with a creamy sauce made from egg yolk, pecorino cheese, pancetta, and pepper.	images/spaghetti-carbonara.jpg	Pasta	5	f
m5	Veggie Burger	9.99	A juicy veggie patty served on a whole grain bun with lettuce, tomato, and a tangy sauce.	images/veggie-burger.jpg	Fastfood	1	f
m6	Grilled Chicken Sandwich	10.99	Tender grilled chicken breast with avocado, bacon, lettuce, and honey mustard on a toasted bun.	images/grilled-chicken-sandwich.jpg	Fastfood	4	f
m7	Steak Frites	17.99	Succulent steak cooked to your preference, served with crispy golden fries and herb butter.	images/steak-frites.jpg	Steaks	5	f
m8	Sushi Roll Platter	15.99	An assortment of fresh sushi rolls including California, Spicy Tuna, and Eel Avocado.	images/sushi-roll-platter.jpg	Seafood	2	f
m9	Chicken Curry	13.99	Tender pieces of chicken simmered in a rich and aromatic curry sauce, served with basmati rice.	images/chicken-curry.jpg	Soups	3	f
m10	Vegan Buddha Bowl	11.99	A hearty bowl filled with quinoa, roasted veggies, avocado, and a tahini dressing.	images/vegan-buddha-bowl.jpg	Salads	1	f
m11	Seafood Paella	19.99	A Spanish delicacy filled with saffron-infused rice, shrimp, mussels, and chorizo.	images/seafood-paella.jpg	Seafood	3	f
m13	Miso Ramen	12.99	A warming bowl of ramen with miso broth, tender pork, soft-boiled egg, and green onions.	images/miso-ramen.jpg	Soups	4	f
m15	Chocolate Brownie	5.99	A rich and fudgy brownie, topped with a scoop of vanilla ice cream and chocolate sauce.	images/chocolate-brownie.jpg	Sweetie	4	f
m16	Lobster Bisque	14.99	A creamy soup made from lobster stock, aromatic vegetables, and a touch of brandy.	images/lobster-bisque.jpg	Soups	2	f
m17	Mushroom Risotto	13.99	Creamy Arborio rice cooked with a medley of wild mushrooms and finished with parmesan.	images/mushroom-risotto.jpg	Pasta	2	f
m18	Eggplant Parmesan	11.99	Layers of breaded eggplant, marinara sauce, and melted mozzarella and parmesan cheeses.	images/eggplant-parmesan.jpg	Pasta	3	f
m19	Lemon Cheesecake	6.99	A creamy cheesecake with a tangy lemon flavor, served on a crumbly biscuit base.	images/lemon-cheesecake.jpg	Sweetie	4	f
m20	Falafel Wrap	8.99	Crispy falafels wrapped in a warm pita with lettuce, tomatoes, and a tahini sauce.	images/falafel-wrap.jpg	Salads	3	f
m12	Pancake Stack	8.99	Fluffy pancakes stacked high, drizzled with maple syrup and topped with fresh berries.	images/pancake-stack.jpg	Sweetie	5	t
m14	Beef Tacos	9.99	Three soft tortillas filled with seasoned beef, fresh salsa, cheese, and sour cream.	images/beef-tacos.jpg	Fastfood	5	t
m2	Margherita Pizza	12.99	A classic pizza with fresh mozzarella, tomatoes, and basil on a thin and crispy crust.	images/margherita-pizza.jpg	Fastfood	5	t
\.


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


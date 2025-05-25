--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-25 12:36:31

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 228 (class 1259 OID 16904)
-- Name: ciudad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ciudad (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    idregion integer NOT NULL,
    area double precision,
    poblacion integer,
    capitalpais boolean DEFAULT false NOT NULL,
    capitalregion boolean DEFAULT false NOT NULL,
    areametropolitana boolean DEFAULT false NOT NULL
);


ALTER TABLE public.ciudad OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16903)
-- Name: ciudad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ciudad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ciudad_id_seq OWNER TO postgres;

--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 227
-- Name: ciudad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ciudad_id_seq OWNED BY public.ciudad.id;


--
-- TOC entry 218 (class 1259 OID 16843)
-- Name: continente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.continente (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.continente OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16842)
-- Name: continente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.continente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.continente_id_seq OWNER TO postgres;

--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 217
-- Name: continente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.continente_id_seq OWNED BY public.continente.id;


--
-- TOC entry 222 (class 1259 OID 16859)
-- Name: moneda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moneda (
    id integer NOT NULL,
    moneda character varying(50) NOT NULL,
    sigla character varying(10),
    imagen character varying(255)
);


ALTER TABLE public.moneda OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16858)
-- Name: moneda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moneda_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.moneda_id_seq OWNER TO postgres;

--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 221
-- Name: moneda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moneda_id_seq OWNED BY public.moneda.id;


--
-- TOC entry 224 (class 1259 OID 16866)
-- Name: pais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pais (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    idcontinente integer NOT NULL,
    idtiporegion integer NOT NULL,
    idmoneda integer,
    mapa text,
    bandera text,
    monedanombre character varying(50),
    monedasigla character varying(10),
    monedaimagen character varying(255)
);


ALTER TABLE public.pais OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16865)
-- Name: pais_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pais_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pais_id_seq OWNER TO postgres;

--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 223
-- Name: pais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pais_id_seq OWNED BY public.pais.id;


--
-- TOC entry 226 (class 1259 OID 16891)
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    idpais integer NOT NULL,
    area double precision,
    poblacion integer
);


ALTER TABLE public.region OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16890)
-- Name: region_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.region_id_seq OWNER TO postgres;

--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 225
-- Name: region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.region_id_seq OWNED BY public.region.id;


--
-- TOC entry 220 (class 1259 OID 16851)
-- Name: tiporegion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tiporegion (
    id integer NOT NULL,
    tiporegion character varying(50) NOT NULL
);


ALTER TABLE public.tiporegion OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16850)
-- Name: tiporegion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tiporegion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tiporegion_id_seq OWNER TO postgres;

--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 219
-- Name: tiporegion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tiporegion_id_seq OWNED BY public.tiporegion.id;


--
-- TOC entry 229 (class 1259 OID 16919)
-- Name: vwciudades; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vwciudades AS
 SELECT c.id AS idciudad,
    c.nombre AS ciudad,
    r.id AS idregion,
    r.nombre AS region,
    p.id AS idpais,
    p.nombre AS pais,
    c.capitalpais,
    c.capitalregion
   FROM ((public.pais p
     LEFT JOIN public.region r ON ((r.idpais = p.id)))
     LEFT JOIN public.ciudad c ON ((c.idregion = r.id)));


ALTER VIEW public.vwciudades OWNER TO postgres;

--
-- TOC entry 4729 (class 2604 OID 16907)
-- Name: ciudad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudad ALTER COLUMN id SET DEFAULT nextval('public.ciudad_id_seq'::regclass);


--
-- TOC entry 4724 (class 2604 OID 16846)
-- Name: continente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.continente ALTER COLUMN id SET DEFAULT nextval('public.continente_id_seq'::regclass);


--
-- TOC entry 4726 (class 2604 OID 16862)
-- Name: moneda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moneda ALTER COLUMN id SET DEFAULT nextval('public.moneda_id_seq'::regclass);


--
-- TOC entry 4727 (class 2604 OID 16869)
-- Name: pais id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pais ALTER COLUMN id SET DEFAULT nextval('public.pais_id_seq'::regclass);


--
-- TOC entry 4728 (class 2604 OID 16894)
-- Name: region id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region ALTER COLUMN id SET DEFAULT nextval('public.region_id_seq'::regclass);


--
-- TOC entry 4725 (class 2604 OID 16854)
-- Name: tiporegion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiporegion ALTER COLUMN id SET DEFAULT nextval('public.tiporegion_id_seq'::regclass);


--
-- TOC entry 4912 (class 0 OID 16904)
-- Dependencies: 228
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ciudad (id, nombre, idregion, area, poblacion, capitalpais, capitalregion, areametropolitana) FROM stdin;
1	LETICIA	1	0	0	f	t	f
2	PUERTO NARIÑO	1	0	0	f	f	f
4	ABRIAQUI	2	0	0	f	f	f
5	ALEJANDRIA	2	0	0	f	f	f
6	AMAGA	2	0	0	f	f	f
7	AMALFI	2	0	0	f	f	f
8	ANDES	2	0	0	f	f	f
9	ANGELOPOLIS	2	0	0	f	f	f
10	ANGOSTURA	2	0	0	f	f	f
11	ANORI	2	0	0	f	f	f
12	SANTA FE DE ANTIOQUIA	2	0	0	f	f	f
13	ANZA	2	0	0	f	f	f
14	APARTADO	2	0	0	f	f	f
15	ARBOLETES	2	0	0	f	f	f
16	ARGELIA	2	0	0	f	f	f
17	ARMENIA	2	0	0	f	f	f
18	BARBOSA	2	0	0	f	f	t
19	BELLO	2	0	0	f	f	t
20	BELMIRA	2	0	0	f	f	f
21	BETANIA	2	0	0	f	f	f
22	BETULIA	2	0	0	f	f	f
23	BOLIVAR	2	0	0	f	f	f
24	BRICEÑO	2	0	0	f	f	f
25	BURITICA	2	0	0	f	f	f
26	CACERES	2	0	0	f	f	f
27	CAICEDO	2	0	0	f	f	f
28	CALDAS	2	0	0	f	f	t
29	CAMPAMENTO	2	0	0	f	f	f
30	CAÑASGORDAS	2	0	0	f	f	f
31	CARACOLI	2	0	0	f	f	f
32	CARAMANTA	2	0	0	f	f	f
33	FOSCA	14	0	0	f	f	f
34	CARMEN DE VIBORAL	2	0	0	f	f	f
35	CAROLINA	2	0	0	f	f	f
36	CAUCASIA	2	0	0	f	f	f
37	CISNEROS	2	0	0	f	f	f
38	COCORNA	2	0	0	f	f	f
39	CONCEPCION	2	0	0	f	f	f
40	CONCORDIA	2	0	0	f	f	f
41	COPACABANA	2	0	0	f	f	f
42	CHIGORODO	2	0	0	f	f	f
43	DABEIBA	2	0	0	f	f	f
44	DON MATIAS	2	0	0	f	f	f
45	EBEJICO	2	0	0	f	f	f
46	EL BAGRE	2	0	0	f	f	f
47	EL JORDAN	2	0	0	f	f	f
48	ENTRERRIOS	2	0	0	f	f	f
49	ENVIGADO	2	0	0	f	f	f
50	FREDONIA	2	0	0	f	f	f
51	FRONTINO	2	0	0	f	f	f
52	GIRALDO	2	0	0	f	f	f
53	GIRARDOTA	2	0	0	f	f	t
54	GOMEZ PLATA	2	0	0	f	f	f
55	GRANADA	2	0	0	f	f	f
56	GUADALUPE	2	0	0	f	f	f
57	GUARNE	2	0	0	f	f	t
58	GUATAPE	2	0	0	f	f	f
59	HELICONIA	2	0	0	f	f	f
60	HISPANIA	2	0	0	f	f	f
61	ITAGÜI	2	0	0	f	f	t
62	ITUANGO	2	0	0	f	f	f
63	JARDIN	2	0	0	f	f	f
64	JERICO	2	0	0	f	f	f
65	LA CEJA	2	0	0	f	f	f
66	LA ESTRELLA	2	0	0	f	f	f
67	LA PINTADA	2	0	0	f	f	f
68	LA UNION	2	0	0	f	f	f
69	LIBORINA	2	0	0	f	f	f
70	MACEO	2	0	0	f	f	f
71	MARINILLA	2	0	0	f	f	f
72	MEDELLIN	2	0	0	f	t	t
73	MONTEBELLO	2	0	0	f	f	f
74	MURINDO	2	0	0	f	f	f
75	MUTATA	2	0	0	f	f	f
76	NARIÑO	2	0	0	f	f	f
77	NECHI	2	0	0	f	f	f
78	NECOCLI	2	0	0	f	f	f
79	OLAYA	2	0	0	f	f	f
80	PEQUE	2	0	0	f	f	f
81	PEÑOL	2	0	0	f	f	f
82	PUEBLO RICO	2	0	0	f	f	f
83	PUERTO BERRIO	2	0	0	f	f	f
84	PUERTO NARE	2	0	0	f	f	f
85	PUERTO TRIUNFO	2	0	0	f	f	f
86	REMEDIOS	2	0	0	f	f	f
87	RETIRO	2	0	0	f	f	f
88	RIONEGRO	2	0	0	f	f	t
89	SABANALARGA	2	0	0	f	f	f
90	SABANETA	2	0	0	f	f	t
91	SALGAR	2	0	0	f	f	f
92	SAN ANDRES	2	0	0	f	f	f
93	SAN CARLOS	2	0	0	f	f	f
94	SAN FRANCISCO	2	0	0	f	f	f
95	SAN JERONIMO	2	0	0	f	f	f
96	SAN JOSE DE LA MONTAÑA	2	0	0	f	f	f
97	SAN JUAN DE URABA	2	0	0	f	f	f
98	SAN LUIS	2	0	0	f	f	f
99	SAN PEDRO	2	0	0	f	f	t
100	SAN PEDRO DE URABA	2	0	0	f	f	f
101	SAN RAFAEL	2	0	0	f	f	f
102	SAN ROQUE	2	0	0	f	f	f
103	SAN VICENTE	2	0	0	f	f	f
104	SANTA BARBARA	2	0	0	f	f	f
105	SANTA ROSA DE OSOS	2	0	0	f	f	f
106	SANTIAGO	2	0	0	f	f	f
107	SANTO DOMINGO	2	0	0	f	f	f
108	SANTUARIO	2	0	0	f	f	f
109	SEGOVIA	2	0	0	f	f	f
110	SONSON	2	0	0	f	f	f
111	SOPETRAN	2	0	0	f	f	f
112	TAMESIS	2	0	0	f	f	f
113	TARAZA	2	0	0	f	f	f
114	TARSO	2	0	0	f	f	f
115	TITIRIBI	2	0	0	f	f	f
116	TOLEDO	2	0	0	f	f	f
117	TURBO	2	0	0	f	f	f
118	URAMITA	2	0	0	f	f	f
119	URRAO	2	0	0	f	f	f
120	VALDIVIA	2	0	0	f	f	f
121	VALPARAISO	2	0	0	f	f	f
122	VEGACHI	2	0	0	f	f	f
123	VENECIA	2	0	0	f	f	f
124	VIGIA DEL FUERTE	2	0	0	f	f	f
125	YARUMAL	2	0	0	f	f	f
126	YOLOMBO	2	0	0	f	f	f
127	YONDO	2	0	0	f	f	f
128	ZARAGOZA	2	0	0	f	f	f
129	ARAUCA	3	0	0	f	t	f
130	ARAUQUITA	3	0	0	f	f	f
131	CRAVO NORTE	3	0	0	f	f	f
132	FORTUL	3	0	0	f	f	f
133	PUERTO RONDON	3	0	0	f	f	f
134	SARAVENA	3	0	0	f	f	f
135	TAME	3	0	0	f	f	f
136	PROVIDENCIA	4	0	0	f	f	f
137	SAN ANDRES	4	0	0	f	t	f
138	BARANOA	5	0	0	f	f	f
139	BARRANQUILLA	5	0	0	f	t	f
140	CAMPO DE LA CRUZ	5	0	0	f	f	f
141	CANDELARIA	5	0	0	f	f	f
142	GALAPA	5	0	0	f	f	f
143	JUAN DE ACOSTA	5	0	0	f	f	f
144	LUNUACO	5	0	0	f	f	f
145	MALAMBO	5	0	0	f	f	f
146	MANATI	5	0	0	f	f	f
147	PALMAR DE VARELA	5	0	0	f	f	f
148	PIOJO	5	0	0	f	f	f
149	POLONUEVO	5	0	0	f	f	f
150	PONEDERA	5	0	0	f	f	f
151	PUERTO COLOMBIA	5	0	0	f	f	f
152	REPELON	5	0	0	f	f	f
153	SABANAGRANDE	5	0	0	f	f	f
154	SABANALARGA	5	0	0	f	f	f
155	SANTA LUCIA	5	0	0	f	f	f
156	SANTO TOMAS	5	0	0	f	f	f
157	SOLEDAD	5	0	0	f	f	f
158	SUAN	5	0	0	f	f	f
159	TUBARA	5	0	0	f	f	f
160	USIACURI	5	0	0	f	f	f
161	ACHI	6	0	0	f	f	f
162	ARJONA	6	0	0	f	f	f
163	BARRANCO DE LOBA	6	0	0	f	f	f
164	CALAMAR	6	0	0	f	f	f
165	CARTAGENA	6	0	0	f	t	f
166	CORDOBA	6	0	0	f	f	f
167	EL CARMEN DE BOLIVAR	6	0	0	f	f	f
168	EL GUAMO	6	0	0	f	f	f
169	MAGANGUE	6	0	0	f	f	f
170	MAHATES	6	0	0	f	f	f
171	MARGARITA	6	0	0	f	f	f
172	MARIA LA BAJA	6	0	0	f	f	f
173	MOMPOS	6	0	0	f	f	f
174	MORALES	6	0	0	f	f	f
175	PINILLOS	6	0	0	f	f	f
176	RIO VIEJO	6	0	0	f	f	f
177	SAN ESTANISLAO	6	0	0	f	f	f
178	SAN FERNANDO	6	0	0	f	f	f
179	SAN JACINTO	6	0	0	f	f	f
180	SAN JUAN NEPOMUCENO	6	0	0	f	f	f
181	SAN MARTIN DE LOBA	6	0	0	f	f	f
182	SAN PABLO	6	0	0	f	f	f
183	SANTA CATALINA	6	0	0	f	f	f
184	SANTA ROSA	6	0	0	f	f	f
185	SANTA ROSA DEL SUR	6	0	0	f	f	f
186	SIMITI	6	0	0	f	f	f
187	SOPLAVIENTO	6	0	0	f	f	f
188	TALAIGUA NUEVO	6	0	0	f	f	f
189	TURBACO	6	0	0	f	f	f
190	TURBANA	6	0	0	f	f	f
191	VILLANUEVA	6	0	0	f	f	f
192	ZAMBRANO	6	0	0	f	f	f
193	ALMEIDA	7	0	0	f	f	f
194	AQUITANA	7	0	0	f	f	f
195	ARCABUCO	7	0	0	f	f	f
196	BELEN	7	0	0	f	f	f
197	BERBEO	7	0	0	f	f	f
198	BETEITIVA	7	0	0	f	f	f
199	BOAVITA	7	0	0	f	f	f
200	BOYACA	7	0	0	f	f	f
201	BRICEÑO	7	0	0	f	f	f
202	BUENAVISTA	7	0	0	f	f	f
203	BUSBANZA	7	0	0	f	f	f
204	CALDAS	7	0	0	f	f	f
205	CAMPOHERMOSO	7	0	0	f	f	f
206	CERINZA	7	0	0	f	f	f
207	CIENAGA	7	0	0	f	f	f
208	COMBITA	7	0	0	f	f	f
209	COPER	7	0	0	f	f	f
210	CORRALES	7	0	0	f	f	f
211	COVARACHIA	7	0	0	f	f	f
212	CUBARA	7	0	0	f	f	f
213	CUCAITA	7	0	0	f	f	f
214	CUITIVA	7	0	0	f	f	f
215	CHINAVITA	7	0	0	f	f	f
216	CHIQUINQUIRA	7	0	0	f	f	f
217	CHIQUIZA	7	0	0	f	f	f
218	CHISCAS	7	0	0	f	f	f
219	CHITA	7	0	0	f	f	f
220	CHITARAQUE	7	0	0	f	f	f
221	CHIVATA	7	0	0	f	f	f
222	CHIVOR	7	0	0	f	f	f
223	DUITAMA	7	0	0	f	f	f
224	EL COCUY	7	0	0	f	f	f
225	EL ESPINO	7	0	0	f	f	f
226	FIRAVITOVA	7	0	0	f	f	f
227	FLORESTA	7	0	0	f	f	f
228	GACHANTIVA	7	0	0	f	f	f
229	GAMEZA	7	0	0	f	f	f
230	GARAGOA	7	0	0	f	f	f
231	GUACAMAYAS	7	0	0	f	f	f
232	GUATEQUE	7	0	0	f	f	f
233	GUAYATA	7	0	0	f	f	f
234	GUICAN	7	0	0	f	f	f
235	IZA	7	0	0	f	f	f
236	JENESANO	7	0	0	f	f	f
237	JERICO	7	0	0	f	f	f
238	LA CAPILLA	7	0	0	f	f	f
239	LA UVITA	7	0	0	f	f	f
240	LA  VICTORIA	7	0	0	f	f	f
241	LABRANZAGRANDE	7	0	0	f	f	f
242	MACANAL	7	0	0	f	f	f
243	MARIPI	7	0	0	f	f	f
244	MIRAFLORES	7	0	0	f	f	f
245	MONGUA	7	0	0	f	f	f
246	MONGUI	7	0	0	f	f	f
247	MONIQUIRA	7	0	0	f	f	f
248	MOTAVITA	7	0	0	f	f	f
249	MUZO	7	0	0	f	f	f
250	NOBSA	7	0	0	f	f	f
251	NUEVO COLON	7	0	0	f	f	f
252	OICATA	7	0	0	f	f	f
253	OTANCHE	7	0	0	f	f	f
254	PACHAVITA	7	0	0	f	f	f
255	PAEZ	7	0	0	f	f	f
256	PAIPA	7	0	0	f	f	f
257	PAJANITO	7	0	0	f	f	f
258	PANQUEBA	7	0	0	f	f	f
259	PAUNA	7	0	0	f	f	f
260	PAYA	7	0	0	f	f	f
261	PAZ DEL RIO	7	0	0	f	f	f
262	PESCA	7	0	0	f	f	f
263	PISBA	7	0	0	f	f	f
264	PUERTO BOYACA	7	0	0	f	f	f
265	QUIPAMA	7	0	0	f	f	f
266	RAMIRIQUI	7	0	0	f	f	f
267	RAQUIRA	7	0	0	f	f	f
268	RONDON	7	0	0	f	f	f
269	SABOYA	7	0	0	f	f	f
270	SACHICA	7	0	0	f	f	f
271	SAMACA	7	0	0	f	f	f
272	SAN EDUARDO	7	0	0	f	f	f
273	SAN JOSE DE PARE	7	0	0	f	f	f
274	SAN LUIS DE GACENO	7	0	0	f	f	f
275	SAN MATEO	7	0	0	f	f	f
276	SAN MIGUEL DE SERNA	7	0	0	f	f	f
277	SAN PABLO DE BORBUR	7	0	0	f	f	f
278	SANTA MARIA	7	0	0	f	f	f
279	SANTA ROSA DE VITERBO	7	0	0	f	f	f
280	SANTA SOFIA	7	0	0	f	f	f
281	SANTANA	7	0	0	f	f	f
282	SATIVANORTE	7	0	0	f	f	f
283	SATIVASUR	7	0	0	f	f	f
284	SIACHOQUE	7	0	0	f	f	f
285	SOATA	7	0	0	f	f	f
286	SOCHA	7	0	0	f	f	f
287	SOCOTA	7	0	0	f	f	f
288	SOGAMOSO	7	0	0	f	f	f
289	SOMONDOCO	7	0	0	f	f	f
290	SORA	7	0	0	f	f	f
291	SORACA	7	0	0	f	f	f
292	SOTAQUIRA	7	0	0	f	f	f
293	SUSACON	7	0	0	f	f	f
294	SUTAMARCHAN	7	0	0	f	f	f
295	SUTATENZA	7	0	0	f	f	f
296	TASCO	7	0	0	f	f	f
297	TENZA	7	0	0	f	f	f
298	TIBANA	7	0	0	f	f	f
299	TIBASOSA	7	0	0	f	f	f
300	TINJACA	7	0	0	f	f	f
301	TIPACOQUE	7	0	0	f	f	f
302	TOCA	7	0	0	f	f	f
303	TOGUI	7	0	0	f	f	f
304	TOPAGA	7	0	0	f	f	f
305	TOTA	7	0	0	f	f	f
306	TUNJA	7	0	0	f	t	f
307	TUNUNGUA	7	0	0	f	f	f
308	TUMEQUE	7	0	0	f	f	f
309	TUTA	7	0	0	f	f	f
310	TUTASA	7	0	0	f	f	f
311	UMBITA	7	0	0	f	f	f
312	VENTAQUEMADA	7	0	0	f	f	f
313	VILLA DE LEYVA	7	0	0	f	f	f
314	VIRACACHA	7	0	0	f	f	f
315	ZETAQUIRA	7	0	0	f	f	f
316	AGUADAS	8	0	0	f	f	f
317	ANSERMA	8	0	0	f	f	f
318	ARANZAZU	8	0	0	f	f	f
319	BELALCAZAR	8	0	0	f	f	f
320	CHINCHINA	8	0	0	f	f	f
321	FILADELFIA	8	0	0	f	f	f
322	LA DORADA	8	0	0	f	f	f
323	LA MERCED	8	0	0	f	f	f
324	MANIZALES	8	0	0	f	t	f
325	MANZANARES	8	0	0	f	f	f
326	MARMATO	8	0	0	f	f	f
327	MARQUETALIA	8	0	0	f	f	f
328	MARULANDA	8	0	0	f	f	f
329	NEIRA	8	0	0	f	f	f
330	PALESTINA	8	0	0	f	f	f
331	PENSILVANIA	8	0	0	f	f	f
332	PACORA	8	0	0	f	f	f
333	RIOSUCIO	8	0	0	f	f	f
334	RISARALDA	8	0	0	f	f	f
335	SALAMINA	8	0	0	f	f	f
336	SAMANA	8	0	0	f	f	f
337	SUPIA	8	0	0	f	f	f
338	VICTORIA	8	0	0	f	f	f
339	VILLAMARIA	8	0	0	f	f	f
340	VITERBO	8	0	0	f	f	f
341	ALBANIA	9	0	0	f	f	f
342	BELEN DE LOS ANDAQUIES	9	0	0	f	f	f
343	CARTAGENA DEL CHAIRA	9	0	0	f	f	f
344	CUNILLO	9	0	0	f	f	f
345	EL DONCELLO	9	0	0	f	f	f
346	EL PAUJIL	9	0	0	f	f	f
347	FLORENCIA	9	0	0	f	t	f
348	LA MONTAÑITA	9	0	0	f	f	f
349	MILAN	9	0	0	f	f	f
350	MORELIA	9	0	0	f	f	f
351	PUERTO RICO	9	0	0	f	f	f
352	SAN JOSE DE LA FRAGUA	9	0	0	f	f	f
353	SAN VICENTE DEL CAGUAN	9	0	0	f	f	f
354	SOLANO	9	0	0	f	f	f
355	SOLITA	9	0	0	f	f	f
356	VALPARAISO	9	0	0	f	f	f
357	AGUAZUL	10	0	0	f	f	f
358	CHAMEZA	10	0	0	f	f	f
359	HATO COROZAL	10	0	0	f	f	f
360	LA SALINA	10	0	0	f	f	f
361	MANI	10	0	0	f	f	f
362	MONTERREY	10	0	0	f	f	f
363	NUNCHIA	10	0	0	f	f	f
364	OROCUE	10	0	0	f	f	f
365	PAZ DE ARIPORO	10	0	0	f	f	f
366	PORE	10	0	0	f	f	f
367	RECETOR	10	0	0	f	f	f
368	SABANALARGA	10	0	0	f	f	f
369	SACAMA	10	0	0	f	f	f
370	SAN LUIS DE PALENQUE	10	0	0	f	f	f
371	TAMARA	10	0	0	f	f	f
372	TAURAMENA	10	0	0	f	f	f
373	TRINIDAD	10	0	0	f	f	f
374	VILLANUEVA	10	0	0	f	f	f
375	YOPAL	10	0	0	f	t	f
376	ALMAGUER	11	0	0	f	f	f
377	ARGELIA	11	0	0	f	f	f
378	BALBOA	11	0	0	f	f	f
379	BOLIVAR	11	0	0	f	f	f
380	BUENOS AIRES	11	0	0	f	f	f
381	CAJIBIO	11	0	0	f	f	f
382	CALDONO	11	0	0	f	f	f
383	CALOTO	11	0	0	f	f	f
384	CORINTO	11	0	0	f	f	f
385	EL TAMBO	11	0	0	f	f	f
386	FLORENCIA	11	0	0	f	f	f
387	GUAPI	11	0	0	f	f	f
388	INZA	11	0	0	f	f	f
389	JAMBALO	11	0	0	f	f	f
390	LA SIERRA	11	0	0	f	f	f
391	LA VEGA	11	0	0	f	f	f
392	LOPEZ (MICAY)	11	0	0	f	f	f
393	MERCADERES	11	0	0	f	f	f
394	MIRANDA	11	0	0	f	f	f
395	MORALES	11	0	0	f	f	f
396	PADILLA	11	0	0	f	f	f
397	PAEZ (BELALCAZAR)	11	0	0	f	f	f
398	PATIA (EL BORDO)	11	0	0	f	f	f
399	PIENDAMO	11	0	0	f	f	f
400	POPAYAN	11	0	0	f	t	f
401	PUERTO TEJADA	11	0	0	f	f	f
402	PURACE	11	0	0	f	f	f
403	ROSAS	11	0	0	f	f	f
404	SAN SEBASTIAN	11	0	0	f	f	f
405	SANTA ROSA	11	0	0	f	f	f
406	SANTANDER DE QUILICHAO	11	0	0	f	f	f
407	SILVIA	11	0	0	f	f	f
408	SOTARA (PISPAMBA)	11	0	0	f	f	f
409	SUAREZ	11	0	0	f	f	f
410	TIMBIQUI	11	0	0	f	f	f
411	TIMBIO	11	0	0	f	f	f
412	TIRIBIO	11	0	0	f	f	f
413	TOTORO	11	0	0	f	f	f
414	AGUACHICA	12	0	0	f	f	f
415	AGUSTIN CODAZZI	12	0	0	f	f	f
416	ASTREA	12	0	0	f	f	f
417	BOSCONIA	12	0	0	f	f	f
418	BECEMIL	12	0	0	f	f	f
419	CURUMANI	12	0	0	f	f	f
420	CHIMICHAGUA	12	0	0	f	f	f
421	CHIGUANA	12	0	0	f	f	f
422	EL COPEY	12	0	0	f	f	f
423	EL PASO	12	0	0	f	f	f
424	GAMARRA	12	0	0	f	f	f
425	GONZALES	12	0	0	f	f	f
426	LA GLORIA	12	0	0	f	f	f
427	LA JAGUA DE IBIRICO	12	0	0	f	f	f
428	LA PAZ	12	0	0	f	f	f
429	MANAURE (BALCON CESAR)	12	0	0	f	f	f
430	PAILITAS	12	0	0	f	f	f
431	PELAYA	12	0	0	f	f	f
432	RIO DE ORO	12	0	0	f	f	f
433	SAN ALBERTO	12	0	0	f	f	f
434	SAN DIEGO	12	0	0	f	f	f
435	SAN MARTIN	12	0	0	f	f	f
436	TAMALAMEQUE	12	0	0	f	f	f
437	VALLEDUPAR	12	0	0	f	t	f
438	AYAPEL	13	0	0	f	f	f
439	BUENAVISTA	13	0	0	f	f	f
440	CANALETE	13	0	0	f	f	f
441	CERETE	13	0	0	f	f	f
442	CHIMA	13	0	0	f	f	f
443	CHINU	13	0	0	f	f	f
444	CIENAGA DE ORO	13	0	0	f	f	f
445	LORICA	13	0	0	f	f	f
446	LOS CORDOBAS	13	0	0	f	f	f
447	MOMIL	13	0	0	f	f	f
448	MONTELIBANO	13	0	0	f	f	f
449	MONTERIA	13	0	0	f	t	f
450	MOÑITOS	13	0	0	f	f	f
451	PLANETA RICA	13	0	0	f	f	f
452	PUEBLO NUEVO	13	0	0	f	f	f
453	PUERTO ESCONDIDO	13	0	0	f	f	f
454	PUERTO LIBERTADOR	13	0	0	f	f	f
455	PURISIMA	13	0	0	f	f	f
456	SAHAGUN	13	0	0	f	f	f
457	SAN ANDRES DE SOTAVENTO	13	0	0	f	f	f
458	SAN ANTERO	13	0	0	f	f	f
459	SAN BERNARDO DEL VIENTO	13	0	0	f	f	f
460	SAN CARLOS	13	0	0	f	f	f
461	SAN PELAYO	13	0	0	f	f	f
462	TIERRALTA	13	0	0	f	f	f
463	VALENCIA	13	0	0	f	f	f
464	AGUA DE DIOS	14	0	0	f	f	f
465	ALBAN	14	0	0	f	f	f
466	ANAPOIMA	14	0	0	f	f	f
467	ANOLAIMA	14	0	0	f	f	f
468	APULO (RAFAEL REYES)	14	0	0	f	f	f
469	ARBELAEZ	14	0	0	f	f	f
470	BELTRAN	14	0	0	f	f	f
471	BITUIMA	14	0	0	f	f	f
472	BOJACA	14	0	0	f	f	f
473	CABRERA	14	0	0	f	f	f
474	CACHIPAY	14	0	0	f	f	f
475	CAJICA	14	0	0	f	f	f
476	CAPARRAPI	14	0	0	f	f	f
477	CAQUEZA	14	0	0	f	f	f
478	CARMEN DE CARUPA	14	0	0	f	f	f
479	COGUA	14	0	0	f	f	f
480	COTA	14	0	0	f	f	f
481	CUCUNUBA	14	0	0	f	f	f
482	CHAGUANI	14	0	0	f	f	f
483	CHIA	14	0	0	f	f	f
484	CHIPAQUE	14	0	0	f	f	f
485	CHOACHI	14	0	0	f	f	f
486	CHOCONTA	14	0	0	f	f	f
487	EL COLEGIO	14	0	0	f	f	f
488	EL PEÑON	14	0	0	f	f	f
489	FACACATIVA	14	0	0	f	f	f
490	FOMEQUE	14	0	0	f	f	f
491	FUNZA	14	0	0	f	f	f
492	FUQUENE	14	0	0	f	f	f
493	FUSAGASUGA	14	0	0	f	f	f
494	GACHALA	14	0	0	f	f	f
495	GACHANCIPA	14	0	0	f	f	f
496	GACHETA	14	0	0	f	f	f
497	GAMA	14	0	0	f	f	f
498	GIRARDOT	14	0	0	f	f	f
499	GUACHETA	14	0	0	f	f	f
500	GUADUAS	14	0	0	f	f	f
501	GUASCA	14	0	0	f	f	f
502	GUATAQUI	14	0	0	f	f	f
503	GUATAVITA	14	0	0	f	f	f
504	GUAYABAL DE SIQUIMA	14	0	0	f	f	f
505	GUAYABETAL	14	0	0	f	f	f
506	GUTIERREZ	14	0	0	f	f	f
507	JERUSALEN	14	0	0	f	f	f
508	JUNIN	14	0	0	f	f	f
509	LA CALERA	14	0	0	f	f	f
510	LA MESA	14	0	0	f	f	f
511	LA PALMA	14	0	0	f	f	f
512	LA PEÑA	14	0	0	f	f	f
513	LA VEGA	14	0	0	f	f	f
514	LENGUAZAQUE	14	0	0	f	f	f
515	MACHETA	14	0	0	f	f	f
516	MADRID	14	0	0	f	f	f
517	MANTA	14	0	0	f	f	f
518	MEDINA	14	0	0	f	f	f
519	MOSQUERA	14	0	0	f	f	f
520	NARIÑO	14	0	0	f	f	f
521	NEMOCON	14	0	0	f	f	f
522	NILO	14	0	0	f	f	f
523	NINAIMA	14	0	0	f	f	f
524	NOCAIMA	14	0	0	f	f	f
525	PACHO	14	0	0	f	f	f
526	PAIME	14	0	0	f	f	f
527	PANDI	14	0	0	f	f	f
528	PARATEBUENO	14	0	0	f	f	f
529	PASCA	14	0	0	f	f	f
530	PUERTO SALGAR	14	0	0	f	f	f
531	PULI	14	0	0	f	f	f
532	QUEBRADAGRANDE	14	0	0	f	f	f
533	QUETAME	14	0	0	f	f	f
534	QUIPILE	14	0	0	f	f	f
535	RICAURTE	14	0	0	f	f	f
536	SAN ANTONIO DEL TEQUENDAM	14	0	0	f	f	f
537	SAN BERNARDO	14	0	0	f	f	f
538	SAN CAYETANO	14	0	0	f	f	f
539	SAN FRANCISCO	14	0	0	f	f	f
540	SAN JUAN DE RIOSECO	14	0	0	f	f	f
541	SANTA FE DE BOGOTA D.C.	14	0	0	t	t	f
542	SASAIMA	14	0	0	f	f	f
543	SESQUILE	14	0	0	f	f	f
544	SIBATE	14	0	0	f	f	f
545	SILVANIA	14	0	0	f	f	f
546	SIMIJACA	14	0	0	f	f	f
547	SOACHA	14	0	0	f	f	f
548	SOPO	14	0	0	f	f	f
549	SUBACHOQUE	14	0	0	f	f	f
550	SUESCA	14	0	0	f	f	f
551	SUPATA	14	0	0	f	f	f
552	SUSA	14	0	0	f	f	f
553	SUTATAUSA	14	0	0	f	f	f
554	TABIO	14	0	0	f	f	f
555	TAUSA	14	0	0	f	f	f
556	TENA	14	0	0	f	f	f
557	TENJO	14	0	0	f	f	f
558	TIBACUY	14	0	0	f	f	f
559	TIBIRITA	14	0	0	f	f	f
560	TOCAIMA	14	0	0	f	f	f
561	TOCANCIPA	14	0	0	f	f	f
562	TOPAIPI	14	0	0	f	f	f
563	UBALA	14	0	0	f	f	f
564	UBAQUE	14	0	0	f	f	f
565	UBATE	14	0	0	f	f	f
566	UNE	14	0	0	f	f	f
567	UTICA	14	0	0	f	f	f
568	VENECIA	14	0	0	f	f	f
569	VERGARA	14	0	0	f	f	f
570	VIANI	14	0	0	f	f	f
571	VILLAGOMEZ	14	0	0	f	f	f
572	VILLAPINZON	14	0	0	f	f	f
573	VILLETA	14	0	0	f	f	f
574	VIOTA	14	0	0	f	f	f
575	YACOPI	14	0	0	f	f	f
576	ZIPACON	14	0	0	f	f	f
577	ZIPAQUIRA	14	0	0	f	f	f
578	ACANDI	15	0	0	f	f	f
579	ALTO BAUDO	15	0	0	f	f	f
580	BAGADO	15	0	0	f	f	f
581	BAHIA SOLANO	15	0	0	f	f	f
582	BAJO BAUDO	15	0	0	f	f	f
583	BOJAYA	15	0	0	f	f	f
584	CONDOTO	15	0	0	f	f	f
585	EL CARMEN DE ATRATO	15	0	0	f	f	f
586	ISTMINA	15	0	0	f	f	f
587	JURADO	15	0	0	f	f	f
588	LITORAL DE SAN JUAN	15	0	0	f	f	f
589	LLORO	15	0	0	f	f	f
590	NOVITA	15	0	0	f	f	f
591	NUQUI	15	0	0	f	f	f
592	QUIBDO	15	0	0	f	t	f
593	RIOSUCIO	15	0	0	f	f	f
594	SAN JOSE DE PALMAR	15	0	0	f	f	f
595	SIPI	15	0	0	f	f	f
596	TADO	15	0	0	f	f	f
597	UNGUIA	15	0	0	f	f	f
598	GUAVIARE	16	0	0	f	f	f
599	PUERTO INIRIDA	16	0	0	f	t	f
600	CALAMAR	17	0	0	f	f	f
601	EL RETORNO	17	0	0	f	f	f
602	MIRAFLORES	17	0	0	f	f	f
603	SAN JOSE DEL GUAVIARE	17	0	0	f	t	f
604	ACEVEDO	18	0	0	f	f	f
605	AGRADO	18	0	0	f	f	f
606	AIPE	18	0	0	f	f	f
607	ALGECIRAS	18	0	0	f	f	f
608	ALTAMIRA	18	0	0	f	f	f
609	BARAYA	18	0	0	f	f	f
610	CAMPOALEGRE	18	0	0	f	f	f
611	COLOMBIA	18	0	0	f	f	f
612	ELIAS	18	0	0	f	f	f
613	GARZON	18	0	0	f	f	f
614	GIGANTE	18	0	0	f	f	f
615	GUADALUPE	18	0	0	f	f	f
616	HOBO	18	0	0	f	f	f
617	IQUIRA	18	0	0	f	f	f
618	ISNOS	18	0	0	f	f	f
619	LA ARGENTINA	18	0	0	f	f	f
620	LA PLATA	18	0	0	f	f	f
621	NEIVA	18	0	0	f	t	f
622	NATAGA	18	0	0	f	f	f
623	OPORAPA	18	0	0	f	f	f
624	PAICOL	18	0	0	f	f	f
625	PALERMO	18	0	0	f	f	f
626	PALESTINA	18	0	0	f	f	f
627	PITAL	18	0	0	f	f	f
628	PITALITO	18	0	0	f	f	f
629	RIVERA	18	0	0	f	f	f
630	SALADOBLANCO	18	0	0	f	f	f
631	SAN AGUSTIN	18	0	0	f	f	f
632	SANTA MARIA	18	0	0	f	f	f
633	SUAZA	18	0	0	f	f	f
634	TARQUI	18	0	0	f	f	f
635	TELLO	18	0	0	f	f	f
636	TENUEL	18	0	0	f	f	f
637	TESALIA	18	0	0	f	f	f
638	TIMANA	18	0	0	f	f	f
639	VILLAVIEJA	18	0	0	f	f	f
640	YAGUARA	18	0	0	f	f	f
641	BARRANCAS	19	0	0	f	f	f
642	EL MOLINO	19	0	0	f	f	f
643	FONSECA	19	0	0	f	f	f
644	MAICAO	19	0	0	f	f	f
645	MANAURE	19	0	0	f	f	f
646	RIOHACHA	19	0	0	f	t	f
647	SAN JUAN DEL CESAR	19	0	0	f	f	f
648	URIBIA	19	0	0	f	f	f
649	URUMITA	19	0	0	f	f	f
650	VILLANUEVA	19	0	0	f	f	f
651	ARACATACA	20	0	0	f	f	f
652	ARIGUANI	20	0	0	f	f	f
653	CERRO DE SAN ANTONIO	20	0	0	f	f	f
654	CIENAGA	20	0	0	f	f	f
655	CHIVOLO	20	0	0	f	f	f
656	EL BANCO	20	0	0	f	f	f
657	EL PIÑON	20	0	0	f	f	f
658	FUNDACION	20	0	0	f	f	f
659	GUAMAL	20	0	0	f	f	f
660	PIVIJAY	20	0	0	f	f	f
661	PLATO	20	0	0	f	f	f
662	PUEBLOVIEJO	20	0	0	f	f	f
663	REMOLINO	20	0	0	f	f	f
664	SAN SEBASTIAN DE BUENAVIS	20	0	0	f	f	f
665	SAN ZENON	20	0	0	f	f	f
666	SANTA ANA	20	0	0	f	f	f
667	SANTA MARTA	20	0	0	f	t	f
668	SITIONUEVO	20	0	0	f	f	f
669	TENERIFE	20	0	0	f	f	f
670	ACACIAS	21	0	0	f	f	f
671	BARRANCA DE UPIA	21	0	0	f	f	f
672	CABUYARO	21	0	0	f	f	f
673	CASTILLA LA NUEVA	21	0	0	f	f	f
674	CUBURRAL	21	0	0	f	f	f
675	CUMURAL	21	0	0	f	f	f
676	EL CALVARIO	21	0	0	f	f	f
677	EL CASTILLO	21	0	0	f	f	f
678	FUENTE DE ORO	21	0	0	f	f	f
679	GRANADA	21	0	0	f	f	f
680	GUAMAL	21	0	0	f	f	f
681	LA MACARENA	21	0	0	f	f	f
682	LA URIBE	21	0	0	f	f	f
683	LEJANIAS	21	0	0	f	f	f
684	MAPIRIPAN	21	0	0	f	f	f
685	MESETAS	21	0	0	f	f	f
686	PUERTO CONCORDIA	21	0	0	f	f	f
687	PUERTO GAITAN	21	0	0	f	f	f
688	PUERTO LLERAS	21	0	0	f	f	f
689	PUERTO LOPEZ	21	0	0	f	f	f
690	PUERTO RICO	21	0	0	f	f	f
691	RESTREPO	21	0	0	f	f	f
692	SAN CARLOS DE GARAGOA	21	0	0	f	f	f
693	SAN JUAN DE ARAMA	21	0	0	f	f	f
694	SAN JUANITO	21	0	0	f	f	f
695	SAN MARTIN	21	0	0	f	f	f
696	VILLAVICENCIO	21	0	0	f	t	f
697	VISTA HERMOSA	21	0	0	f	f	f
698	ALBAN	22	0	0	f	f	f
699	ALDANA	22	0	0	f	f	f
700	ANCUYA	22	0	0	f	f	f
701	ARBOLEDA	22	0	0	f	f	f
702	BARBACOAS	22	0	0	f	f	f
703	BELEN	22	0	0	f	f	f
704	BUESACO	22	0	0	f	f	f
705	COLON	22	0	0	f	f	f
706	CONSACA	22	0	0	f	f	f
707	CONTADERO	22	0	0	f	f	f
708	CORDOBA	22	0	0	f	f	f
709	CUASPUD	22	0	0	f	f	f
710	CUMBAL	22	0	0	f	f	f
711	CUMBITARA	22	0	0	f	f	f
712	CHACHAGUI	22	0	0	f	f	f
713	EL CHARCO	22	0	0	f	f	f
714	EL ROSARIO	22	0	0	f	f	f
715	EL TABLON	22	0	0	f	f	f
716	EL TAMBO	22	0	0	f	f	f
717	FUNES	22	0	0	f	f	f
718	GUACHUCAL	22	0	0	f	f	f
719	GUAITANILLA	22	0	0	f	f	f
720	GUALMATAN	22	0	0	f	f	f
721	ILES	22	0	0	f	f	f
722	IMUES	22	0	0	f	f	f
723	IPIALES	22	0	0	f	f	f
724	LA CRUZ	22	0	0	f	f	f
725	LA FLORIDA	22	0	0	f	f	f
726	LA LLANADA	22	0	0	f	f	f
727	LA TOLA	22	0	0	f	f	f
728	LA UNION	22	0	0	f	f	f
729	LEIVA	22	0	0	f	f	f
730	LINARES	22	0	0	f	f	f
731	LOS ANDES	22	0	0	f	f	f
732	MAGUI	22	0	0	f	f	f
733	MALLAMA	22	0	0	f	f	f
734	MOSQUERA	22	0	0	f	f	f
735	OLAYA HERRERA	22	0	0	f	f	f
736	OSPINA	22	0	0	f	f	f
737	PASTO	22	0	0	f	t	f
738	PIZARRO	22	0	0	f	f	f
739	POLICARPA	22	0	0	f	f	f
740	POTOSI	22	0	0	f	f	f
741	PROVIDENCIA	22	0	0	f	f	f
742	PUERRES	22	0	0	f	f	f
743	PUPIALES	22	0	0	f	f	f
744	RICAURTE	22	0	0	f	f	f
745	ROBERTO PAYAN	22	0	0	f	f	f
746	SAMANIEGO	22	0	0	f	f	f
747	SAN BERNARDO	22	0	0	f	f	f
748	SAN LORENZO	22	0	0	f	f	f
749	SAN PABLO	22	0	0	f	f	f
750	SAN PEDRO DE CARTAGO	22	0	0	f	f	f
751	SANDONA	22	0	0	f	f	f
752	SANTA BARBARA	22	0	0	f	f	f
753	SANTACRUZ	22	0	0	f	f	f
754	SAPUYES	22	0	0	f	f	f
755	TAMINANGO	22	0	0	f	f	f
756	TANGUA	22	0	0	f	f	f
757	TUMACO	22	0	0	f	f	f
758	TUQUEMES	22	0	0	f	f	f
759	YACUANQUER	22	0	0	f	f	f
760	ABREGO	23	0	0	f	f	f
761	ARBOLEDAS	23	0	0	f	f	f
762	BOCHALEMA	23	0	0	f	f	f
763	BUCARASICA	23	0	0	f	f	f
764	CACHIRA	23	0	0	f	f	f
765	CACOTA	23	0	0	f	f	f
766	CONVENCION	23	0	0	f	f	f
767	CUCUTA	23	0	0	f	t	f
768	CUCUTILLA	23	0	0	f	f	f
769	CHINACOTA	23	0	0	f	f	f
770	CHITAGA	23	0	0	f	f	f
771	DURANIA	23	0	0	f	f	f
772	EL CARMEN	23	0	0	f	f	f
773	EL TARRA	23	0	0	f	f	f
774	EL ZULIA	23	0	0	f	f	f
775	GRAMOLETE	23	0	0	f	f	f
776	HACARI	23	0	0	f	f	f
777	HERRAN	23	0	0	f	f	f
778	LA PLAYA	23	0	0	f	f	f
779	LABATECA	23	0	0	f	f	f
780	LOS PATIOS	23	0	0	f	f	f
781	LOURDES	23	0	0	f	f	f
782	MUTISCUA	23	0	0	f	f	f
783	OCAÑA	23	0	0	f	f	f
784	PAMPLONA	23	0	0	f	f	f
785	RAGONVALIA	23	0	0	f	f	f
786	SALAZAR	23	0	0	f	f	f
787	SAN CALIXTO	23	0	0	f	f	f
788	SAN CAYETANO	23	0	0	f	f	f
789	SANTIAGO	23	0	0	f	f	f
790	SARDINATA	23	0	0	f	f	f
791	SILOS	23	0	0	f	f	f
792	TEORAMA	23	0	0	f	f	f
793	TIBU	23	0	0	f	f	f
794	TOLEDO	23	0	0	f	f	f
795	VILLA CARO	23	0	0	f	f	f
796	VILLA ROSARIO	23	0	0	f	f	f
797	COLON	24	0	0	f	f	f
798	MOCOA	24	0	0	f	t	f
799	ORITO	24	0	0	f	f	f
800	PUERTO ASIS	24	0	0	f	f	f
801	PUERTO CAICEDO	24	0	0	f	f	f
802	PUERTO GUZMAN	24	0	0	f	f	f
803	PUERTO LEGUIZAMO	24	0	0	f	f	f
804	SAN FRANCISCO	24	0	0	f	f	f
805	SANTIAGO	24	0	0	f	f	f
806	SIBUNDOY	24	0	0	f	f	f
807	VALLE DE GUAMEZ	24	0	0	f	f	f
808	VILLAGARZON	24	0	0	f	f	f
809	ARMENIA	25	0	0	f	t	f
810	BUENAVISTA	25	0	0	f	f	f
811	CALARCA	25	0	0	f	f	f
812	CIRCASIA	25	0	0	f	f	f
813	CORDOBA	25	0	0	f	f	f
814	FINLANDIA	25	0	0	f	f	f
815	GENOVA	25	0	0	f	f	f
816	LA TEBAIDA	25	0	0	f	f	f
817	MONTENEGRO	25	0	0	f	f	f
818	PIJAO	25	0	0	f	f	f
819	QUIMBAYA	25	0	0	f	f	f
820	SALENTO	25	0	0	f	f	f
821	APIA	26	0	0	f	f	f
822	BALBOA	26	0	0	f	f	f
823	BELEN DE UMBRIA	26	0	0	f	f	f
824	DOSQUEBRADAS	26	0	0	f	f	f
825	GUATICA	26	0	0	f	f	f
826	LA CELIA	26	0	0	f	f	f
827	LA VIRGINIA	26	0	0	f	f	f
828	MARSELLA	26	0	0	f	f	f
829	MISTRATO	26	0	0	f	f	f
830	PEREIRA	26	0	0	f	t	f
831	PUEBLO RICO	26	0	0	f	f	f
832	QUINCHIA	26	0	0	f	f	f
833	SANTA ROSA DE CABAL	26	0	0	f	f	f
834	SANTUARIO	26	0	0	f	f	f
835	AGUADA	27	0	0	f	f	f
836	ALBANIA	27	0	0	f	f	f
837	AROTACA	27	0	0	f	f	f
838	BARBOSA	27	0	0	f	f	f
839	BARICHARA	27	0	0	f	f	f
840	BARRANCABERMEJA	27	0	0	f	f	f
841	BETULIA	27	0	0	f	f	f
842	BOLIVAR	27	0	0	f	f	f
843	BUCARAMANGA	27	0	0	f	t	f
844	CABRERA	27	0	0	f	f	f
845	CALIFORNIA	27	0	0	f	f	f
846	CAPITANEJO	27	0	0	f	f	f
847	CARCASI	27	0	0	f	f	f
848	CEPITA	27	0	0	f	f	f
849	CERRITO	27	0	0	f	f	f
850	CIMITARRA	27	0	0	f	f	f
851	CONCEPCION	27	0	0	f	f	f
852	CONFINES	27	0	0	f	f	f
853	CONTRATACION	27	0	0	f	f	f
854	COROMORO	27	0	0	f	f	f
855	CURUTI	27	0	0	f	f	f
856	CHARALA	27	0	0	f	f	f
857	CHARTA	27	0	0	f	f	f
858	CHIMA	27	0	0	f	f	f
859	CHIPATA	27	0	0	f	f	f
860	EL CARMEN DE CHUCURI	27	0	0	f	f	f
861	EL GUACAMAYO	27	0	0	f	f	f
862	EL PEÑON	27	0	0	f	f	f
863	EL PLAYON	27	0	0	f	f	f
864	ENCINO	27	0	0	f	f	f
865	ENCISO	27	0	0	f	f	f
866	FLORIDABLANCA	27	0	0	f	f	f
867	FLORIAN	27	0	0	f	f	f
868	GALAN	27	0	0	f	f	f
869	GIRON	27	0	0	f	f	f
870	GUACA	27	0	0	f	f	f
871	GUADALUPE	27	0	0	f	f	f
872	GUAPOTA	27	0	0	f	f	f
873	GUAVATA	27	0	0	f	f	f
874	GUEPSA	27	0	0	f	f	f
875	GAMBITA	27	0	0	f	f	f
876	HATO	27	0	0	f	f	f
877	JESUS MARIA	27	0	0	f	f	f
878	JORDAN	27	0	0	f	f	f
879	LA BELLEZA	27	0	0	f	f	f
880	LA PAZ	27	0	0	f	f	f
881	LANDAZURI	27	0	0	f	f	f
882	LEBRIJA	27	0	0	f	f	f
883	LOS SANTOS	27	0	0	f	f	f
884	MACARAVITA	27	0	0	f	f	f
885	MALAGA	27	0	0	f	f	f
886	MATANZA	27	0	0	f	f	f
887	MOGOLES	27	0	0	f	f	f
888	MOLOGAVITA	27	0	0	f	f	f
889	OCAMONTE	27	0	0	f	f	f
890	OIBA	27	0	0	f	f	f
891	ONZAGA	27	0	0	f	f	f
892	PALMAR	27	0	0	f	f	f
893	PALMSA DEL SOCORRO	27	0	0	f	f	f
894	PIEDECUESTA	27	0	0	f	f	f
895	PINCHOTE	27	0	0	f	f	f
896	PUENTE NACIONAL	27	0	0	f	f	f
897	PUERTO PARRA	27	0	0	f	f	f
898	PUERTO WILCHES	27	0	0	f	f	f
899	PARAMO	27	0	0	f	f	f
900	RIONEGRO	27	0	0	f	f	f
901	SABANA DE TORRES	27	0	0	f	f	f
902	SAN ANDRES	27	0	0	f	f	f
903	SAN BENITO	27	0	0	f	f	f
904	SAN GIL	27	0	0	f	f	f
905	SAN JOAQUIN	27	0	0	f	f	f
906	SAN JOSE DE MIRANDA	27	0	0	f	f	f
907	SAN MIGUEL	27	0	0	f	f	f
908	SAN VICENTE DE CHUCURI	27	0	0	f	f	f
909	SANTA BARBARA	27	0	0	f	f	f
910	SANTA HELENA DEL OPON	27	0	0	f	f	f
911	SIMACOTA	27	0	0	f	f	f
912	SOCORRO	27	0	0	f	f	f
913	SUAITA	27	0	0	f	f	f
914	SUCRE	27	0	0	f	f	f
915	SURATA	27	0	0	f	f	f
916	TONA	27	0	0	f	f	f
917	VALLE DE SAN JOSE	27	0	0	f	f	f
918	VETAS	27	0	0	f	f	f
919	VILLANUEVA	27	0	0	f	f	f
920	VELEZ	27	0	0	f	f	f
921	ZAPATOCA	27	0	0	f	f	f
922	BUENAVISTA	28	0	0	f	f	f
923	CAIMITO	28	0	0	f	f	f
924	COLOSO	28	0	0	f	f	f
925	COROZAL	28	0	0	f	f	f
926	CHALAN	28	0	0	f	f	f
927	GALERAS	28	0	0	f	f	f
928	GUARANDA	28	0	0	f	f	f
929	LA UNION DE SUCRE	28	0	0	f	f	f
930	LOS PALMITOS	28	0	0	f	f	f
931	MAJAGUAL	28	0	0	f	f	f
932	MORROA	28	0	0	f	f	f
933	OVEJAS	28	0	0	f	f	f
934	PALMITO	28	0	0	f	f	f
935	SAMPUES	28	0	0	f	f	f
936	SAN BENITO ABAD	28	0	0	f	f	f
937	SAN JUAN DE BETULIA	28	0	0	f	f	f
938	SAN MARCOS	28	0	0	f	f	f
939	SAN ONOFRE	28	0	0	f	f	f
940	SAN PEDRO	28	0	0	f	f	f
941	SINCELEJO	28	0	0	f	t	f
943	SUCRE	28	0	0	f	f	f
944	TOLU	28	0	0	f	f	f
945	TOLUVIEJO	28	0	0	f	f	f
946	ALPUJARRA	29	0	0	f	f	f
947	ALVARADO	29	0	0	f	f	f
948	AMBALEMA	29	0	0	f	f	f
949	ANZOATEGUI	29	0	0	f	f	f
950	ARMERO	29	0	0	f	f	f
951	ATACO	29	0	0	f	f	f
952	CAJAMARCA	29	0	0	f	f	f
953	CARMEN DE APICALA	29	0	0	f	f	f
954	CASABLANCA	29	0	0	f	f	f
955	COELLO	29	0	0	f	f	f
956	COYAIMA	29	0	0	f	f	f
957	CUNDAY	29	0	0	f	f	f
958	CHAPARRAL	29	0	0	f	f	f
959	DOLORES	29	0	0	f	f	f
960	ESPINAL	29	0	0	f	f	f
961	FALAN	29	0	0	f	f	f
962	FLANDES	29	0	0	f	f	f
963	FRESNO	29	0	0	f	f	f
964	GUAMO	29	0	0	f	f	f
965	HERVEO	29	0	0	f	f	f
966	HONDA	29	0	0	f	f	f
967	IBAGUE	29	0	0	f	t	f
968	ICONONZO	29	0	0	f	f	f
969	LERIDA	29	0	0	f	f	f
970	LIBANO	29	0	0	f	f	f
971	MARIQUITA	29	0	0	f	f	f
972	MELGAR	29	0	0	f	f	f
973	MURILLO	29	0	0	f	f	f
974	NATAGAIMA	29	0	0	f	f	f
975	ORTEGA	29	0	0	f	f	f
976	PIEDRAS	29	0	0	f	f	f
977	PLANADAS	29	0	0	f	f	f
978	PRADO	29	0	0	f	f	f
979	PURIFICACION	29	0	0	f	f	f
980	RIOBLANCO	29	0	0	f	f	f
981	RONCESVALLES	29	0	0	f	f	f
982	ROVIRA	29	0	0	f	f	f
983	SALDAÑA	29	0	0	f	f	f
984	SAN ANTONIO	29	0	0	f	f	f
985	SAN LUIS	29	0	0	f	f	f
986	SANTA ISABEL	29	0	0	f	f	f
987	SUAREZ	29	0	0	f	f	f
988	VALLE DE SAN JUAN	29	0	0	f	f	f
989	VENADILLO	29	0	0	f	f	f
990	VILLAHERMOSA	29	0	0	f	f	f
991	VILLARRICA	29	0	0	f	f	f
992	ALCALA	30	0	0	f	f	f
993	ANDALUCIA	30	0	0	f	f	f
994	ANSERMANUEVO	30	0	0	f	f	f
995	ARGELIA	30	0	0	f	f	f
996	BOLIVAR	30	0	0	f	f	f
997	BUENAVENTURA	30	0	0	f	f	f
998	BUGA	30	0	0	f	f	f
999	BUGALAGRANDE	30	0	0	f	f	f
1000	CAICEDONIA	30	0	0	f	f	f
1001	CALI	30	0	0	f	t	f
1002	CALIMA	30	0	0	f	f	f
1003	CANDELARIA	30	0	0	f	f	f
1004	CARTAGO	30	0	0	f	f	f
1005	DAGUA	30	0	0	f	f	f
1006	EL AGUILA	30	0	0	f	f	f
1007	EL CAIRO	30	0	0	f	f	f
1008	EL CERRITO	30	0	0	f	f	f
1009	EL DOVIO	30	0	0	f	f	f
1010	FLORIDA	30	0	0	f	f	f
1011	GINEBRA	30	0	0	f	f	f
1012	GUACARI	30	0	0	f	f	f
1013	JAMUNDI	30	0	0	f	f	f
1014	LA CUMBRE	30	0	0	f	f	f
1015	LA UNION	30	0	0	f	f	f
1016	LA VICTORIA	30	0	0	f	f	f
1017	OBANDO	30	0	0	f	f	f
1018	PALMIRA	30	0	0	f	f	f
1019	PRADERA	30	0	0	f	f	f
1020	RESTREPO	30	0	0	f	f	f
1021	RIOFRIO	30	0	0	f	f	f
1022	ROLDANILLO	30	0	0	f	f	f
1023	SAN PEDRO	30	0	0	f	f	f
1024	SEVILLA	30	0	0	f	f	f
1025	TORO	30	0	0	f	f	f
1026	TRUJILLO	30	0	0	f	f	f
1027	TULUA	30	0	0	f	f	f
1028	ULLOA	30	0	0	f	f	f
1029	VERSALLES	30	0	0	f	f	f
1030	VIJES	30	0	0	f	f	f
1031	YOTOCO	30	0	0	f	f	f
1032	YUMBO	30	0	0	f	f	f
1033	ZARZAL	30	0	0	f	f	f
1034	CARURU	31	0	0	f	f	f
1035	MITU	31	0	0	f	t	f
1036	PACOA	31	0	0	f	f	f
1037	YARAVATE	31	0	0	f	f	f
1038	LA PRIMAVERA	32	0	0	f	f	f
1039	NUEVA ANTIOQUIA	32	0	0	f	f	f
1040	PUERTO CARREÑO	32	0	0	f	t	f
1041	SAN JOSE DE OCUNE	32	0	0	f	f	f
1042	SANTA RITA	32	0	0	f	f	f
1043	SANTA ROSALIA	32	0	0	f	f	f
1044	YALI	2	0	0	f	f	f
1078	ABEJORRAL	2	0	0	f	f	f
1099	La Plata	33	0	0	f	t	f
1100	COrdoba	34	0	0	f	t	f
1101	Santa Fe de la Vera Cruz	35	0	0	f	t	f
1102	Mendoza	36	0	0	f	t	f
1103	San Miguel de TucumAn	37	0	0	f	t	f
1104	Parana	38	0	0	f	t	f
1105	Salta	39	0	0	f	t	f
1106	Posadas	40	0	0	f	t	f
1107	Resistencia	41	0	0	f	t	f
1108	Corrientes	42	0	0	f	t	f
1109	Santiago del Estero	43	0	0	f	t	f
1110	San Salvador de Jujuy	44	0	0	f	t	f
1111	San Juan	45	0	0	f	t	f
1112	Viedma	46	0	0	f	t	f
1113	Formosa	47	0	0	f	t	f
1114	Neuquen	48	0	0	f	t	f
1115	Rawson	49	0	0	f	t	f
1116	San Luis	50	0	0	f	t	f
1117	San Fernando del Valle de Catamarca	51	0	0	f	t	f
1118	La Rioja	52	0	0	f	t	f
1119	Santa Rosa	53	0	0	f	t	f
1120	RIo Gallegos	54	0	0	f	t	f
1121	Ushuaia	55	0	0	f	t	f
1122	San Fernando de Apure	56	0	0	f	t	f
1123	Maracay	57	0	0	f	t	f
1124	Barinas	58	0	0	f	t	f
1125	Ciudad BolIvar	59	0	0	f	t	f
1126	Valencia	60	0	0	f	t	f
1127	San Carlos	61	0	0	f	t	f
1128	Tucupita	62	0	0	f	t	f
1129	Los Roques	63	0	0	f	t	f
1130	Caracas	64	0	0	t	t	f
1131	Coro	65	0	0	f	t	f
1132	San Juan De Los Morros	66	0	0	f	t	f
1133	Barquisimeto	67	0	0	f	t	f
1134	Merida	68	0	0	f	t	f
1135	Los Teques	69	0	0	f	t	f
1136	Maturin	70	0	0	f	t	f
1137	La AsunciOn	71	0	0	f	t	f
1138	Guanare	72	0	0	f	t	f
1139	Cumana	73	0	0	f	t	f
1140	San CristObal	74	0	0	f	t	f
1141	Trujillo	75	0	0	f	t	f
1142	La Guaira	76	0	0	f	t	f
1143	San Felipe	77	0	0	f	t	f
1144	Maracaibo	78	0	0	f	t	f
1145	WhiteHorse	79	0	0	f	t	f
1146	Saint Jhonn´s	80	0	0	f	t	f
1147	Victoria	81	0	0	f	t	f
1148	Edmonton	82	0	0	f	t	f
1149	Regina	83	0	0	f	t	f
1150	Winnipeg	84	0	0	f	t	f
1151	Toronto	85	0	0	f	t	f
1152	Quebec	86	0	0	f	t	f
1153	Baker Lake	87	0	0	f	t	f
1154	YellowKnife	88	0	0	f	t	f
1155	Fredericton	89	0	0	f	t	f
1156	Halifax	90	0	0	f	t	f
1157	Charlottetown	91	0	0	f	t	f
1158	Aguascalientes	92	0	0	f	t	f
1159	Mexicali	93	0	0	f	t	f
1160	La Paz	94	0	0	f	t	f
1161	San Francisco de Campeche	95	0	0	f	t	f
1162	Tuxtla Gutierrez	96	0	0	f	t	f
1163	Chihuahua	97	0	0	f	t	f
1164	Saltillo	98	0	0	f	t	f
1165	Colima	99	0	0	f	t	f
1166	Victoria de Durango	100	0	0	f	t	f
1167	Guanajuato	101	0	0	f	t	f
1168	Chilpancingo de los Bravo	102	0	0	f	t	f
1169	Pachuca de Soto	103	0	0	f	t	f
1170	Guadalajara	104	0	0	f	t	f
1171	Toluca de Lerdo	105	0	0	f	t	f
1172	Morelia	106	0	0	f	t	f
1173	Cuernavaca	107	0	0	f	t	f
1174	Tepic	108	0	0	f	t	f
1175	Monterrey	109	0	0	f	t	f
1176	Oaxaca de Juarez	110	0	0	f	t	f
1177	Puebla de Zaragoza	111	0	0	f	t	f
1178	Santiago de Queretaro	112	0	0	f	t	f
1179	Chetumal	113	0	0	f	t	f
1180	San Luis Potosi	114	0	0	f	t	f
1181	Culiacan	115	0	0	f	t	f
1182	Hermosillo	116	0	0	f	t	f
1183	Villahermosa	117	0	0	f	t	f
1184	Ciudad Victoria	118	0	0	f	t	f
1185	Tlaxcala de Xicohtencatl	119	0	0	f	t	f
1186	Xalapa-EnrIquez	120	0	0	f	t	f
1187	Merida	121	0	0	f	t	f
1188	Zacatecas	122	0	0	f	t	f
1189	Ciudad de MExico	123	0	0	t	t	f
1190	Rio Branco	124	0	0	f	t	f
1191	Maceio	125	0	0	f	t	f
1192	Macapa	126	0	0	f	t	f
1193	Manaus	127	0	0	f	t	f
1194	Salvador	128	0	0	f	t	f
1195	Fortaleza	129	0	0	f	t	f
1196	Brasilia	130	0	0	t	t	f
1197	VitOria	131	0	0	f	t	f
1198	Goiania	132	0	0	f	t	f
1199	Sao LuIs	133	0	0	f	t	f
1200	CuiabA	134	0	0	f	t	f
1201	Campo Grande	135	0	0	f	t	f
1202	Belo Horizonte	136	0	0	f	t	f
1203	Belem	137	0	0	f	t	f
1204	Joao Pessoa	138	0	0	f	t	f
1205	Curitiba	139	0	0	f	t	f
1206	Recife	140	0	0	f	t	f
1207	Teresina	141	0	0	f	t	f
1208	Rio de Janeiro	142	0	0	f	t	f
1209	Natal	143	0	0	f	t	f
1210	Porto Alegre	144	0	0	f	t	f
1211	Porto Velho	145	0	0	f	t	f
1212	Boa Vista	146	0	0	f	t	f
1213	FlorianOpolis	147	0	0	f	t	f
1214	Sao Paulo	148	0	0	f	t	f
1215	Aracaju	149	0	0	f	t	f
1216	Palmas	150	0	0	f	t	f
1218	Montreal	86	0	0	t	f	f
1219	Buenos Aires	151	0	0	t	t	f
\.


--
-- TOC entry 4902 (class 0 OID 16843)
-- Dependencies: 218
-- Data for Name: continente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.continente (id, nombre) FROM stdin;
1	AMERICA
2	EUROPA
3	AFRICA
4	ASIA
5	OCEANIA
\.


--
-- TOC entry 4906 (class 0 OID 16859)
-- Dependencies: 222
-- Data for Name: moneda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moneda (id, moneda, sigla, imagen) FROM stdin;
1	PESO COLOMBIANO		
2	PESO ARGENTINO		
3	PESO BOLIVIANO		
4	REAL		
5	DOLAR CANADIENSE		
6	COLON		
7	PESO DOMINICANO		
8	DOLAR		
9	PESO CHILENO		
10	QUETZAL		
11	PESO		
12	PESO MEXICANO		
13	BALBOA		
14	GUARANI		
15	NUEVO SOL		
16	PESO URUGUAYO		
17	NUEVO BOLIVAR		
18	LIBRA		
19	EURO		
20	DOLAR AUSTRALIANO		
\.


--
-- TOC entry 4908 (class 0 OID 16866)
-- Dependencies: 224
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pais (id, nombre, idcontinente, idtiporegion, idmoneda, mapa, bandera, monedanombre, monedasigla, monedaimagen) FROM stdin;
1	COLOMBIA	1	1	1	\N	\N	PESO COLOMBIANO		
2	ARGENTINA	1	1	2	\N	\N	PESO ARGENTINO		
3	BOLIVIA	1	1	3	\N	\N	PESO BOLIVIANO		
4	BRASIL	1	1	4	\N	\N	REAL		
5	CANADA	1	1	5	\N	\N	DOLAR CANADIENSE		
6	COSTA RICA	1	1	6	\N	\N	COLON		
7	REPUBLICA DOMINICANA	1	1	7	\N	\N	PESO DOMINICANO		
8	CUBA	1	1	8	\N	\N	DOLAR		
9	CHILE	1	1	9	\N	\N	PESO CHILENO		
10	ECUADOR	1	1	8	\N	\N	DOLAR		
11	ESTADOS UNIDOS DE AMÉRICA	1	1	8	\N	\N	DOLAR		
12	GUATEMALA	1	1	10	\N	\N	QUETZAL		
13	HONDURAS	1	1	11	\N	\N	PESO		
14	MÉXICO	1	1	12	\N	\N	PESO MEXICANO		
15	NICARAGUA	1	1	11	\N	\N	PESO		
16	PANAMA	1	1	13	\N	\N	BALBOA		
17	PARAGUAY	1	1	14	\N	\N	GUARANI		
18	PERU	1	1	15	\N	\N	NUEVO SOL		
19	URUGUAY	1	1	16	\N	\N	PESO URUGUAYO		
20	VENEZUELA	1	1	17	\N	\N	NUEVO BOLIVAR		
21	REINO UNIDO	2	1	18	\N	\N	LIBRA		
22	ESPAÑA	2	1	19	\N	\N	EURO		
23	ITALIA	3	1	19	\N	\N	EURO		
24	FRANCIA	3	1	19	\N	\N	EURO		
25	AUSTRALIA	5	1	20	\N	\N	DOLAR AUSTRALIANO		
\.


--
-- TOC entry 4910 (class 0 OID 16891)
-- Dependencies: 226
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.region (id, nombre, idpais, area, poblacion) FROM stdin;
1	Amazonas	1	0	0
2	Antioquia	1	0	0
3	Arauca	1	0	0
4	Archipielago San Andres y Providencia	1	0	0
5	Atlantico	1	0	0
6	Bolivar	1	0	0
7	Boyaca	1	0	0
8	Caldas	1	0	0
9	Caqueta	1	0	0
10	Casanare	1	0	0
11	Cauca	1	0	0
12	Cesar	1	0	0
13	Cordova	1	0	0
14	Cundinamarca	1	0	0
15	Choco	1	0	0
16	Guainia	1	0	0
17	Guaviare	1	0	0
18	Huila	1	0	0
19	La Guajira	1	0	0
20	Magdalena	1	0	0
21	Meta	1	0	0
22	Nariño	1	0	0
23	Norte de Santander	1	0	0
24	Putumayo	1	0	0
25	Quindio	1	0	0
26	Risaralda	1	0	0
27	Santander	1	0	0
28	Sucre	1	0	0
29	Tolima	1	0	0
30	Valle del Cauca	1	0	0
31	Vaupes	1	0	0
32	Vichada	1	0	0
33	Buenos Aires	2	307804	15052177
34	Cordoba	2	168766	3340041
35	Santa Fe	2	133007	3242551
36	Mendoza	2	150839	1729660
37	Tucuman	2	22524	1475384
38	Entre Rios	2	78781	1255787
39	Salta	2	154775	1224022
40	Misiones	2	29801	1077987
41	Chaco	2	99633	1052185
42	Corrientes	2	88199	1013443
43	Santiago del Estero	2	135254	865546
44	Jujuy	2	53219	679975
45	San Juan	2	89651	695640
46	Rio Negro	2	203013	597476
47	Formosa	2	72066	539883
48	Neuquen	2	94078	547742
49	Chubut	2	224686	460684
50	San Luis	2	76748	437544
51	Catamarca	2	99818	388416
52	La Rioja	2	89680	341207
53	La Pampa	2	143440	333550
54	Santa Cruz	2	243943	225920
55	Tierra del Fuego, Antartida e Islas del Atlantico 	2	1002352	126212
56	Apure	20	76500	485470
57	Aragua	20	7014	1689056
58	Barinas	20	35200	772734
59	Bolivar	20	238000	1563600
60	Carabobo	20	4650	2262070
61	Cojedes	20	14800	306273
62	Delta Amacuro	20	40200	156233
63	Dependencias Federales	20	342	1791
64	Distrito Capital	20	433	2091452
65	Falcon	20	24800	917696
66	Guarico	20	64986	759508
67	Lara	20	19800	1824087
68	Merida	20	11300	859924
69	Miranda	20	7950	2902235
70	Monagas	20	28930	882996
71	Nueva Esparta	20	1150	443648
72	Portuguesa	20	15200	880503
73	Sucre	20	11800	930989
74	Tachira	20	11100	1198892
75	Trujillo	20	7400	724839
76	Vargas	20	1496	335368
77	Yaracuy	20	7100	609861
78	Zulia	20	63100	3687332
79	Yukon Territory	5	0	0
80	Terranova and Labrador	5	0	0
81	British Columbia	5	0	0
82	Alberta	5	0	0
83	Saskatchewan	5	0	0
84	Manitoba	5	0	0
85	Ontario	5	0	0
86	Quebec	5	0	0
87	Nunavut	5	0	0
88	Northwest Territories	5	0	0
89	New Brunswick	5	0	0
90	Nova Scotia	5	0	0
91	Prince Edward Island	5	0	0
92	Aguascalientes	14	5625	1051000
93	Baja California	14	71546	3200000
94	Baja California Sur	14	73943	517000
95	Campeche	14	57727	754730
96	Chiapas	14	73681	4256000
97	Chihuahua	14	247487	3238000
98	Coahuila de Zaragoza	14	151445	2475000
99	Colima	14	5627	562000
100	Durango	14	123367	1489000
101	Guanajuato	14	30621	4893000
102	Guerrero	14	63618	3116000
103	Hidalgo	14	20856	2334000
104	Jalisco	14	78630	6652000
105	Mexico	14	22333	14161000
106	Michoacan de Ocampo	14	58667	3988000
107	Morelos	14	4892	1605000
108	Nayarit	14	27862	943000
109	Nuevo Leon	14	64203	4164000
110	Oaxaca	14	93343	3522000
111	Puebla	14	34251	5391000
112	Queretaro	14	11658	1593000
113	Quintana Roo	14	42535	1134000
114	San Luis Potosi	14	61165	2412000
115	Sinaloa	14	57331	2610000
116	Sonora	14	184946	2384000
117	Tabasco	14	24747	2013000
118	Tamaulipas	14	80148	3020000
119	Tlaxcala	14	3997	1061000
120	Veracruz	14	71856	7081000
121	Yucatan	14	39671	1803000
122	Zacatecas	14	75416	1357000
123	Distrito Federal	14	0	8670000
124	Acre	4	0	557526
125	Alagoas	4	0	2822621
126	Amapa	4	0	477032
127	Amazonas	4	0	2812557
128	Bahia	4	0	13070250
129	Ceara	4	0	7430661
130	Distrito Federal	4	0	2051146
131	Espirito Santo	4	0	3097232
132	Goias	4	0	5003228
133	Maranhão	4	0	5651475
134	Mato Grosso	4	0	2504353
135	Mato Grosso do Sul	4	0	2078001
136	Minas Gerais	4	0	17891494
137	Para	4	0	6192307
138	Paraiba	4	0	3443825
139	Parana	4	0	9563458
140	Pernambuco	4	0	7918344
141	Piaui	4	0	2843278
142	Rio de Janeiro	4	0	14391282
143	Rio Grande do Norte	4	0	2776782
144	Rio Grande do Sul	4	0	10187798
145	Rondonia	4	0	1379787
146	Roraima	4	0	324397
147	Santa Catarina	4	0	5356360
148	Sao Paulo	4	0	37032403
149	Sergipe	4	0	1784475
150	Tocantins	4	0	1157098
151	Distrito Autonomo	2	0	3000000
152	Beni	3	0	0
\.


--
-- TOC entry 4904 (class 0 OID 16851)
-- Dependencies: 220
-- Data for Name: tiporegion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tiporegion (id, tiporegion) FROM stdin;
1	ESTADO
2	PROVINCIA
3	DEPARTAMENTO
\.


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 227
-- Name: ciudad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ciudad_id_seq', 1, false);


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 217
-- Name: continente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.continente_id_seq', 1, false);


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 221
-- Name: moneda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moneda_id_seq', 1, false);


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 223
-- Name: pais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pais_id_seq', 1, false);


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 225
-- Name: region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.region_id_seq', 1, false);


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 219
-- Name: tiporegion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tiporegion_id_seq', 1, false);


--
-- TOC entry 4748 (class 2606 OID 16912)
-- Name: ciudad ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (id);


--
-- TOC entry 4734 (class 2606 OID 16848)
-- Name: continente continente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.continente
    ADD CONSTRAINT continente_pkey PRIMARY KEY (id);


--
-- TOC entry 4740 (class 2606 OID 16864)
-- Name: moneda moneda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moneda
    ADD CONSTRAINT moneda_pkey PRIMARY KEY (id);


--
-- TOC entry 4743 (class 2606 OID 16873)
-- Name: pais pais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (id);


--
-- TOC entry 4746 (class 2606 OID 16896)
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);


--
-- TOC entry 4738 (class 2606 OID 16856)
-- Name: tiporegion tiporegion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiporegion
    ADD CONSTRAINT tiporegion_pkey PRIMARY KEY (id);


--
-- TOC entry 4749 (class 1259 OID 16918)
-- Name: ixciudad_idregion_nombre; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ixciudad_idregion_nombre ON public.ciudad USING btree (idregion, nombre);


--
-- TOC entry 4735 (class 1259 OID 16849)
-- Name: ixcontinente_nombre; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ixcontinente_nombre ON public.continente USING btree (nombre);


--
-- TOC entry 4741 (class 1259 OID 16889)
-- Name: ixpais_nombre; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ixpais_nombre ON public.pais USING btree (nombre);


--
-- TOC entry 4744 (class 1259 OID 16902)
-- Name: ixregion_idpais_nombre; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ixregion_idpais_nombre ON public.region USING btree (idpais, nombre);


--
-- TOC entry 4736 (class 1259 OID 16857)
-- Name: ixtiporegion_tiporegion; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ixtiporegion_tiporegion ON public.tiporegion USING btree (tiporegion);


--
-- TOC entry 4754 (class 2606 OID 16913)
-- Name: ciudad fkciudad_idregion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT fkciudad_idregion FOREIGN KEY (idregion) REFERENCES public.region(id);


--
-- TOC entry 4750 (class 2606 OID 16874)
-- Name: pais fkpais_idcontinente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pais
    ADD CONSTRAINT fkpais_idcontinente FOREIGN KEY (idcontinente) REFERENCES public.continente(id);


--
-- TOC entry 4751 (class 2606 OID 16884)
-- Name: pais fkpais_idmoneda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pais
    ADD CONSTRAINT fkpais_idmoneda FOREIGN KEY (idmoneda) REFERENCES public.moneda(id);


--
-- TOC entry 4752 (class 2606 OID 16879)
-- Name: pais fkpais_idtiporegion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pais
    ADD CONSTRAINT fkpais_idtiporegion FOREIGN KEY (idtiporegion) REFERENCES public.tiporegion(id);


--
-- TOC entry 4753 (class 2606 OID 16897)
-- Name: region fkregion_idpais; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT fkregion_idpais FOREIGN KEY (idpais) REFERENCES public.pais(id);


-- Completed on 2025-05-25 12:36:32

--
-- PostgreSQL database dump complete
--


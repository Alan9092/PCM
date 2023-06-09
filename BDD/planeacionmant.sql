PGDMP     :    5                {            planeacionmant    15.2    15.2 ,    C           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            D           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            E           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            F           1262    24762    planeacionmant    DATABASE     �   CREATE DATABASE planeacionmant WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE planeacionmant;
                postgres    false            �            1259    24763    bitacora    TABLE     ]  CREATE TABLE public.bitacora (
    tdescripcion character varying(600),
    fhfecha date,
    tdisponibilidad character varying(30),
    tefectosfalla character varying(300),
    tunidad character varying(100),
    tunidadnegocios character varying(100),
    tcaptura character varying(100),
    ttiporeporte character varying(100),
    tpiezasutilizadas character varying(100),
    ttecnico character varying(100),
    tsupervisor character varying(100),
    tsistema character varying(100),
    tsubsistema character varying(100),
    tturno character varying(100),
    ecodbitacora integer NOT NULL
);
    DROP TABLE public.bitacora;
       public         heap    postgres    false            �            1259    24863    bitacora_ecodbitacora_seq    SEQUENCE     �   CREATE SEQUENCE public.bitacora_ecodbitacora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.bitacora_ecodbitacora_seq;
       public          postgres    false    214            G           0    0    bitacora_ecodbitacora_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.bitacora_ecodbitacora_seq OWNED BY public.bitacora.ecodbitacora;
          public          postgres    false    225            �            1259    24768    mantenimiento    TABLE     i   CREATE TABLE public.mantenimiento (
    ecodtipomantenimiento numeric NOT NULL,
    ecantidad numeric
);
 !   DROP TABLE public.mantenimiento;
       public         heap    postgres    false            �            1259    24773    mantpreventivo    TABLE     	  CREATE TABLE public.mantpreventivo (
    ecodmantprev numeric NOT NULL,
    bestado boolean,
    fk_eunidadnegocios numeric,
    fk_eunidad numeric,
    fhultimomantenimiento date,
    ehorometro numeric,
    eodometro numeric,
    fk_etipomantenimiento numeric
);
 "   DROP TABLE public.mantpreventivo;
       public         heap    postgres    false            �            1259    24778    piezas    TABLE     [   CREATE TABLE public.piezas (
    ecodpiezas numeric NOT NULL,
    ecodigo numeric(30,0)
);
    DROP TABLE public.piezas;
       public         heap    postgres    false            �            1259    24783    sistema    TABLE     f   CREATE TABLE public.sistema (
    ecodsistema numeric NOT NULL,
    tnombre character varying(100)
);
    DROP TABLE public.sistema;
       public         heap    postgres    false            �            1259    24788 
   subsistema    TABLE     l   CREATE TABLE public.subsistema (
    ecodsubsistema numeric NOT NULL,
    tnombre character varying(100)
);
    DROP TABLE public.subsistema;
       public         heap    postgres    false            �            1259    24793    tiporeporte    TABLE     n   CREATE TABLE public.tiporeporte (
    ecodtiporeporte numeric NOT NULL,
    tnombre character varying(100)
);
    DROP TABLE public.tiporeporte;
       public         heap    postgres    false            �            1259    24798    tipousuario    TABLE     �   CREATE TABLE public.tipousuario (
    ecodtipousuario numeric NOT NULL,
    tdescripcionusuario character varying(100),
    bestado boolean
);
    DROP TABLE public.tipousuario;
       public         heap    postgres    false            �            1259    24803    unidad    TABLE     d   CREATE TABLE public.unidad (
    ecodunidad numeric NOT NULL,
    tnombre character varying(100)
);
    DROP TABLE public.unidad;
       public         heap    postgres    false            �            1259    24808    unidadnegocios    TABLE     t   CREATE TABLE public.unidadnegocios (
    ecodunidadnegocios numeric NOT NULL,
    tnombre character varying(100)
);
 "   DROP TABLE public.unidadnegocios;
       public         heap    postgres    false            �            1259    24813    usuario    TABLE     �   CREATE TABLE public.usuario (
    ecodusuario numeric NOT NULL,
    bstatus text,
    tnombre text,
    tapellidopaterno text,
    tapellidomaterno text,
    ttipousuario text,
    enumtrabajador numeric(10,0),
    tcontra text
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �           2604    24864    bitacora ecodbitacora    DEFAULT     ~   ALTER TABLE ONLY public.bitacora ALTER COLUMN ecodbitacora SET DEFAULT nextval('public.bitacora_ecodbitacora_seq'::regclass);
 D   ALTER TABLE public.bitacora ALTER COLUMN ecodbitacora DROP DEFAULT;
       public          postgres    false    225    214            5          0    24763    bitacora 
   TABLE DATA           �   COPY public.bitacora (tdescripcion, fhfecha, tdisponibilidad, tefectosfalla, tunidad, tunidadnegocios, tcaptura, ttiporeporte, tpiezasutilizadas, ttecnico, tsupervisor, tsistema, tsubsistema, tturno, ecodbitacora) FROM stdin;
    public          postgres    false    214   4       6          0    24768    mantenimiento 
   TABLE DATA           I   COPY public.mantenimiento (ecodtipomantenimiento, ecantidad) FROM stdin;
    public          postgres    false    215   �4       7          0    24773    mantpreventivo 
   TABLE DATA           �   COPY public.mantpreventivo (ecodmantprev, bestado, fk_eunidadnegocios, fk_eunidad, fhultimomantenimiento, ehorometro, eodometro, fk_etipomantenimiento) FROM stdin;
    public          postgres    false    216   �4       8          0    24778    piezas 
   TABLE DATA           5   COPY public.piezas (ecodpiezas, ecodigo) FROM stdin;
    public          postgres    false    217   O5       9          0    24783    sistema 
   TABLE DATA           7   COPY public.sistema (ecodsistema, tnombre) FROM stdin;
    public          postgres    false    218   �5       :          0    24788 
   subsistema 
   TABLE DATA           =   COPY public.subsistema (ecodsubsistema, tnombre) FROM stdin;
    public          postgres    false    219   �5       ;          0    24793    tiporeporte 
   TABLE DATA           ?   COPY public.tiporeporte (ecodtiporeporte, tnombre) FROM stdin;
    public          postgres    false    220   �5       <          0    24798    tipousuario 
   TABLE DATA           T   COPY public.tipousuario (ecodtipousuario, tdescripcionusuario, bestado) FROM stdin;
    public          postgres    false    221   (6       =          0    24803    unidad 
   TABLE DATA           5   COPY public.unidad (ecodunidad, tnombre) FROM stdin;
    public          postgres    false    222   e6       >          0    24808    unidadnegocios 
   TABLE DATA           E   COPY public.unidadnegocios (ecodunidadnegocios, tnombre) FROM stdin;
    public          postgres    false    223   �6       ?          0    24813    usuario 
   TABLE DATA           �   COPY public.usuario (ecodusuario, bstatus, tnombre, tapellidopaterno, tapellidomaterno, ttipousuario, enumtrabajador, tcontra) FROM stdin;
    public          postgres    false    224   �6       H           0    0    bitacora_ecodbitacora_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.bitacora_ecodbitacora_seq', 4, true);
          public          postgres    false    225            �           2606    24871    bitacora bitacora_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_pkey PRIMARY KEY (ecodbitacora);
 @   ALTER TABLE ONLY public.bitacora DROP CONSTRAINT bitacora_pkey;
       public            postgres    false    214            �           2606    24821    unidad fk_eunidad_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.unidad
    ADD CONSTRAINT fk_eunidad_pkey PRIMARY KEY (ecodunidad);
 @   ALTER TABLE ONLY public.unidad DROP CONSTRAINT fk_eunidad_pkey;
       public            postgres    false    222            �           2606    24823     mantenimiento mantenimiento_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.mantenimiento
    ADD CONSTRAINT mantenimiento_pkey PRIMARY KEY (ecodtipomantenimiento);
 J   ALTER TABLE ONLY public.mantenimiento DROP CONSTRAINT mantenimiento_pkey;
       public            postgres    false    215            �           2606    24825 "   mantpreventivo mantpreventivo_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.mantpreventivo
    ADD CONSTRAINT mantpreventivo_pkey PRIMARY KEY (ecodmantprev);
 L   ALTER TABLE ONLY public.mantpreventivo DROP CONSTRAINT mantpreventivo_pkey;
       public            postgres    false    216            �           2606    24827    piezas piezas_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.piezas
    ADD CONSTRAINT piezas_pkey PRIMARY KEY (ecodpiezas);
 <   ALTER TABLE ONLY public.piezas DROP CONSTRAINT piezas_pkey;
       public            postgres    false    217            �           2606    24829    sistema sistema_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.sistema
    ADD CONSTRAINT sistema_pkey PRIMARY KEY (ecodsistema);
 >   ALTER TABLE ONLY public.sistema DROP CONSTRAINT sistema_pkey;
       public            postgres    false    218            �           2606    24831    subsistema subsistema_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.subsistema
    ADD CONSTRAINT subsistema_pkey PRIMARY KEY (ecodsubsistema);
 D   ALTER TABLE ONLY public.subsistema DROP CONSTRAINT subsistema_pkey;
       public            postgres    false    219            �           2606    24833    tiporeporte tiporeporte_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.tiporeporte
    ADD CONSTRAINT tiporeporte_pkey PRIMARY KEY (ecodtiporeporte);
 F   ALTER TABLE ONLY public.tiporeporte DROP CONSTRAINT tiporeporte_pkey;
       public            postgres    false    220            �           2606    24835    tipousuario tipousuario_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.tipousuario
    ADD CONSTRAINT tipousuario_pkey PRIMARY KEY (ecodtipousuario);
 F   ALTER TABLE ONLY public.tipousuario DROP CONSTRAINT tipousuario_pkey;
       public            postgres    false    221            �           2606    24837 $   unidadnegocios unidaddenegocios_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.unidadnegocios
    ADD CONSTRAINT unidaddenegocios_pkey PRIMARY KEY (ecodunidadnegocios);
 N   ALTER TABLE ONLY public.unidadnegocios DROP CONSTRAINT unidaddenegocios_pkey;
       public            postgres    false    223            �           2606    24839    usuario usuario_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (ecodusuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    224            �           2606    24840 $   mantpreventivo fk_etipomantenimiento    FK CONSTRAINT     �   ALTER TABLE ONLY public.mantpreventivo
    ADD CONSTRAINT fk_etipomantenimiento FOREIGN KEY (fk_etipomantenimiento) REFERENCES public.mantpreventivo(ecodmantprev) NOT VALID;
 N   ALTER TABLE ONLY public.mantpreventivo DROP CONSTRAINT fk_etipomantenimiento;
       public          postgres    false    216    3219    216            �           2606    24845    mantpreventivo fk_eunidad    FK CONSTRAINT     �   ALTER TABLE ONLY public.mantpreventivo
    ADD CONSTRAINT fk_eunidad FOREIGN KEY (fk_eunidad) REFERENCES public.unidad(ecodunidad) NOT VALID;
 C   ALTER TABLE ONLY public.mantpreventivo DROP CONSTRAINT fk_eunidad;
       public          postgres    false    3231    216    222            �           2606    24850 !   mantpreventivo fk_eunidadnegocios    FK CONSTRAINT     �   ALTER TABLE ONLY public.mantpreventivo
    ADD CONSTRAINT fk_eunidadnegocios FOREIGN KEY (fk_eunidadnegocios) REFERENCES public.unidadnegocios(ecodunidadnegocios) NOT VALID;
 K   ALTER TABLE ONLY public.mantpreventivo DROP CONSTRAINT fk_eunidadnegocios;
       public          postgres    false    216    3233    223            5   �   x���=
�@��z����"���?AC��Y� ������2���4����cF)(��`��B��!5�oڧe��#e��)�%tm��ZOO�yj�VnlG)l��$)��rj�N�T?��{)Wһx�kt�>�ʵ�������y��!d���*Ɂ��||�ͅ_�����G;����9�1o��~      6   "   x�3�450�2�44 RƜ� �	�1����� N;�      7   B   x�m��	�0���.)g_�F'�ݟ�*D}$�Pt�Gy�q�誂�����Î؇�aG��?��.�+q�      8   %   x�3�4�0�0�2�4.cNc0�2�4�=... ��c      9   *   x�3�,NM/-�LIL�2�,I-.1�2��\&`ڄ+F��� �P      :   $   x�3�L��+)-���2�,I-.1�2��\1z\\\ �"�      ;   &   x�3�L�/*JM.�,��2�,I-.1�2��\1z\\\ �-	�      <   -   x�3�LL����,.)JL�/�,�2�,I-.�\�`������ -�E      =   !   x�3�41w�4r�2�4.cNc0������ [6      >   #   x�3��vrw�2�,I-.1�2��\1z\\\ |�k      ?   �   x�eͽ
A�:�0�?����p 
V6�M�K ����8��3|���US875�0��XNuf�>��S���R.!o�N,ت�EgZ}��>��@�e���	(�f��[���ν!�/'67C     
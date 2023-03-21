PGDMP     %    !                {            planeacionmant    15.2    15.2 (    @           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            A           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            B           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            C           1262    16426    planeacionmant    DATABASE     �   CREATE DATABASE planeacionmant WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE planeacionmant;
                postgres    false            �            1259    16427    bitacora    TABLE     �  CREATE TABLE public.bitacora (
    ecodbitacora numeric NOT NULL,
    tdescripcion character varying(600),
    fhfecha date,
    hhorainicial time without time zone,
    hhorafinal time without time zone,
    tdisponibilidad boolean,
    tturno numeric,
    tefectosfalla character varying(300),
    tunidad character varying(100),
    tunidadnegocios character varying(100),
    tcaptura character varying(100),
    ttiporeporte character varying(100),
    tpiezasutilizadas character varying(100),
    ttecnico character varying(100),
    tsupervisor character varying(100),
    tsistema character varying(100),
    tsubsistema character varying(100)
);
    DROP TABLE public.bitacora;
       public         heap    postgres    false            �            1259    16432    mantenimiento    TABLE     i   CREATE TABLE public.mantenimiento (
    ecodtipomantenimiento numeric NOT NULL,
    ecantidad numeric
);
 !   DROP TABLE public.mantenimiento;
       public         heap    postgres    false            �            1259    16437    mantpreventivo    TABLE     	  CREATE TABLE public.mantpreventivo (
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
       public         heap    postgres    false            �            1259    16442    piezas    TABLE     [   CREATE TABLE public.piezas (
    ecodpiezas numeric NOT NULL,
    ecodigo numeric(30,0)
);
    DROP TABLE public.piezas;
       public         heap    postgres    false            �            1259    16447    sistema    TABLE     f   CREATE TABLE public.sistema (
    ecodsistema numeric NOT NULL,
    tnombre character varying(100)
);
    DROP TABLE public.sistema;
       public         heap    postgres    false            �            1259    16452 
   subsistema    TABLE     l   CREATE TABLE public.subsistema (
    ecodsubsistema numeric NOT NULL,
    tnombre character varying(100)
);
    DROP TABLE public.subsistema;
       public         heap    postgres    false            �            1259    16457    tiporeporte    TABLE     n   CREATE TABLE public.tiporeporte (
    ecodtiporeporte numeric NOT NULL,
    tnombre character varying(100)
);
    DROP TABLE public.tiporeporte;
       public         heap    postgres    false            �            1259    16462    tipousuario    TABLE     �   CREATE TABLE public.tipousuario (
    ecodtipousuario numeric NOT NULL,
    tdescripcionusuario character varying(100),
    bestado boolean
);
    DROP TABLE public.tipousuario;
       public         heap    postgres    false            �            1259    16467    unidad    TABLE     d   CREATE TABLE public.unidad (
    ecodunidad numeric NOT NULL,
    tnombre character varying(100)
);
    DROP TABLE public.unidad;
       public         heap    postgres    false            �            1259    16472    unidadnegocios    TABLE     t   CREATE TABLE public.unidadnegocios (
    ecodunidadnegocios numeric NOT NULL,
    tnombre character varying(100)
);
 "   DROP TABLE public.unidadnegocios;
       public         heap    postgres    false            �            1259    16477    usuario    TABLE     �   CREATE TABLE public.usuario (
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
       public         heap    postgres    false            3          0    16427    bitacora 
   TABLE DATA           �   COPY public.bitacora (ecodbitacora, tdescripcion, fhfecha, hhorainicial, hhorafinal, tdisponibilidad, tturno, tefectosfalla, tunidad, tunidadnegocios, tcaptura, ttiporeporte, tpiezasutilizadas, ttecnico, tsupervisor, tsistema, tsubsistema) FROM stdin;
    public          postgres    false    214   �/       4          0    16432    mantenimiento 
   TABLE DATA           I   COPY public.mantenimiento (ecodtipomantenimiento, ecantidad) FROM stdin;
    public          postgres    false    215   .0       5          0    16437    mantpreventivo 
   TABLE DATA           �   COPY public.mantpreventivo (ecodmantprev, bestado, fk_eunidadnegocios, fk_eunidad, fhultimomantenimiento, ehorometro, eodometro, fk_etipomantenimiento) FROM stdin;
    public          postgres    false    216   `0       6          0    16442    piezas 
   TABLE DATA           5   COPY public.piezas (ecodpiezas, ecodigo) FROM stdin;
    public          postgres    false    217   �0       7          0    16447    sistema 
   TABLE DATA           7   COPY public.sistema (ecodsistema, tnombre) FROM stdin;
    public          postgres    false    218   �0       8          0    16452 
   subsistema 
   TABLE DATA           =   COPY public.subsistema (ecodsubsistema, tnombre) FROM stdin;
    public          postgres    false    219   !1       9          0    16457    tiporeporte 
   TABLE DATA           ?   COPY public.tiporeporte (ecodtiporeporte, tnombre) FROM stdin;
    public          postgres    false    220   U1       :          0    16462    tipousuario 
   TABLE DATA           T   COPY public.tipousuario (ecodtipousuario, tdescripcionusuario, bestado) FROM stdin;
    public          postgres    false    221   �1       ;          0    16467    unidad 
   TABLE DATA           5   COPY public.unidad (ecodunidad, tnombre) FROM stdin;
    public          postgres    false    222   �1       <          0    16472    unidadnegocios 
   TABLE DATA           E   COPY public.unidadnegocios (ecodunidadnegocios, tnombre) FROM stdin;
    public          postgres    false    223   �1       =          0    16477    usuario 
   TABLE DATA           �   COPY public.usuario (ecodusuario, bstatus, tnombre, tapellidopaterno, tapellidomaterno, ttipousuario, enumtrabajador, tcontra) FROM stdin;
    public          postgres    false    224   ,2       �           2606    16483    bitacora bitacora_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_pkey PRIMARY KEY (ecodbitacora);
 @   ALTER TABLE ONLY public.bitacora DROP CONSTRAINT bitacora_pkey;
       public            postgres    false    214            �           2606    16485    unidad fk_eunidad_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.unidad
    ADD CONSTRAINT fk_eunidad_pkey PRIMARY KEY (ecodunidad);
 @   ALTER TABLE ONLY public.unidad DROP CONSTRAINT fk_eunidad_pkey;
       public            postgres    false    222            �           2606    16487     mantenimiento mantenimiento_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.mantenimiento
    ADD CONSTRAINT mantenimiento_pkey PRIMARY KEY (ecodtipomantenimiento);
 J   ALTER TABLE ONLY public.mantenimiento DROP CONSTRAINT mantenimiento_pkey;
       public            postgres    false    215            �           2606    16489 "   mantpreventivo mantpreventivo_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.mantpreventivo
    ADD CONSTRAINT mantpreventivo_pkey PRIMARY KEY (ecodmantprev);
 L   ALTER TABLE ONLY public.mantpreventivo DROP CONSTRAINT mantpreventivo_pkey;
       public            postgres    false    216            �           2606    16491    piezas piezas_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.piezas
    ADD CONSTRAINT piezas_pkey PRIMARY KEY (ecodpiezas);
 <   ALTER TABLE ONLY public.piezas DROP CONSTRAINT piezas_pkey;
       public            postgres    false    217            �           2606    16493    sistema sistema_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.sistema
    ADD CONSTRAINT sistema_pkey PRIMARY KEY (ecodsistema);
 >   ALTER TABLE ONLY public.sistema DROP CONSTRAINT sistema_pkey;
       public            postgres    false    218            �           2606    16495    subsistema subsistema_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.subsistema
    ADD CONSTRAINT subsistema_pkey PRIMARY KEY (ecodsubsistema);
 D   ALTER TABLE ONLY public.subsistema DROP CONSTRAINT subsistema_pkey;
       public            postgres    false    219            �           2606    16497    tiporeporte tiporeporte_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.tiporeporte
    ADD CONSTRAINT tiporeporte_pkey PRIMARY KEY (ecodtiporeporte);
 F   ALTER TABLE ONLY public.tiporeporte DROP CONSTRAINT tiporeporte_pkey;
       public            postgres    false    220            �           2606    16499    tipousuario tipousuario_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.tipousuario
    ADD CONSTRAINT tipousuario_pkey PRIMARY KEY (ecodtipousuario);
 F   ALTER TABLE ONLY public.tipousuario DROP CONSTRAINT tipousuario_pkey;
       public            postgres    false    221            �           2606    16501 $   unidadnegocios unidaddenegocios_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.unidadnegocios
    ADD CONSTRAINT unidaddenegocios_pkey PRIMARY KEY (ecodunidadnegocios);
 N   ALTER TABLE ONLY public.unidadnegocios DROP CONSTRAINT unidaddenegocios_pkey;
       public            postgres    false    223            �           2606    16503    usuario usuario_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (ecodusuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    224            �           2606    16534 $   mantpreventivo fk_etipomantenimiento    FK CONSTRAINT     �   ALTER TABLE ONLY public.mantpreventivo
    ADD CONSTRAINT fk_etipomantenimiento FOREIGN KEY (fk_etipomantenimiento) REFERENCES public.mantpreventivo(ecodmantprev) NOT VALID;
 N   ALTER TABLE ONLY public.mantpreventivo DROP CONSTRAINT fk_etipomantenimiento;
       public          postgres    false    3217    216    216            �           2606    16549    mantpreventivo fk_eunidad    FK CONSTRAINT     �   ALTER TABLE ONLY public.mantpreventivo
    ADD CONSTRAINT fk_eunidad FOREIGN KEY (fk_eunidad) REFERENCES public.unidad(ecodunidad) NOT VALID;
 C   ALTER TABLE ONLY public.mantpreventivo DROP CONSTRAINT fk_eunidad;
       public          postgres    false    216    222    3229            �           2606    16559 !   mantpreventivo fk_eunidadnegocios    FK CONSTRAINT     �   ALTER TABLE ONLY public.mantpreventivo
    ADD CONSTRAINT fk_eunidadnegocios FOREIGN KEY (fk_eunidadnegocios) REFERENCES public.unidadnegocios(ecodunidadnegocios) NOT VALID;
 K   ALTER TABLE ONLY public.mantpreventivo DROP CONSTRAINT fk_eunidadnegocios;
       public          postgres    false    216    3231    223            3   k   x�3�,NU(��-��WH�QH��+)-���4202�50�52�44�20 "NCs(����-#�
�)17	�=Y�.�e�Y�Z\bddD��B<��g�1>�b���� j�B      4   "   x�3�450�2�44 RƜ� �	�1����� N;�      5   B   x�m��	�0���.)g_�F'�ݟ�*D}$�Pt�Gy�q�誂�����Î؇�aG��?��.�+q�      6   %   x�3�4�0�0�2�4.cNc0�2�4�=... ��c      7   *   x�3�,NM/-�LIL�2�,I-.1�2��\&`ڄ+F��� �P      8   $   x�3�L��+)-���2�,I-.1�2��\1z\\\ �"�      9   &   x�3�L�/*JM.�,��2�,I-.1�2��\1z\\\ �-	�      :   -   x�3�LL����,.)JL�/�,�2�,I-.�\�`������ -�E      ;   !   x�3�41w�4r�2�4.cNc0������ [6      <   #   x�3��vrw�2�,I-.1�2��\1z\\\ |�k      =   �   x�eͽ
A�:�0�?����p 
V6�M�K ����8��3|���US875�0��XNuf�>��S���R.!o�N,ت�EgZ}��>��@�e���	(�f��[���ν!�/'67C     
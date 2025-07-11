PGDMP      -                }         
   partners_demo    16.2    16.2 ,    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    73646 
   partners_demo    DATABASE     �   CREATE DATABASE partners_demo WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE partners_demo;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0 
   SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    73925 
   material_type    TABLE     �   CREATE TABLE public.material_type (
    material_type character varying(50),
    lose_percent numeric(3,2),
    id integer NOT NULL
);
 !   DROP TABLE public.material_type;
       public         heap    postgres    false    4            �            1259    73924    material_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.material_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.material_type_id_seq;
       public          postgres    false    216    4            �           0    0    material_type_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.material_type_id_seq OWNED BY public.material_type.id;
          public          postgres    false    215            �            1259    73960    partner_products    TABLE     �   CREATE TABLE public.partner_products (
    id integer NOT NULL,
    partner integer,
    product integer,
    product_count integer,
    sale_date date
);
 $   DROP TABLE public.partner_products;
       public         heap    postgres    false    4            �            1259    73959    partner_products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.partner_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.partner_products_id_seq;
       public          postgres    false    224    4            �           0    0    partner_products_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.partner_products_id_seq OWNED BY public.partner_products.id;
          public          postgres    false    223            �            1259    73951    partners    TABLE     �  CREATE TABLE public.partners (
    partner_type character varying(10),
    name character varying(250),
    director_name character varying(50),
    director_last_name character varying(50),
    director_surname character varying(50),
    e_mail character varying(100),
    phone character varying(50),
    address character varying(250),
    inn bigint,
    rating integer,
    id integer NOT NULL
);
    DROP TABLE public.partners;
       public         heap    postgres    false    4            �            1259    73950    partners_id_seq    SEQUENCE     �   CREATE SEQUENCE public.partners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.partners_id_seq;
       public          postgres    false    4    222            �           0    0    partners_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.partners_id_seq OWNED BY public.partners.id;
          public          postgres    false    221            �            1259    73932    product_type    TABLE     �   CREATE TABLE public.product_type (
    product_type character varying(50),
    coefficient numeric(4,2),
    id integer NOT NULL
);
     DROP TABLE public.product_type;
       public         heap    postgres    false    4            �            1259    73931    product_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_type_id_seq;
       public          postgres    false    4    218            �           0    0    product_type_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_type_id_seq OWNED BY public.product_type.id;
          public          postgres    false    217            �            1259    73939    products    TABLE     �   CREATE TABLE public.products (
    product_type integer,
    product_name character varying(250),
    artukul bigint,
    min_cost numeric(7,2),
    id integer NOT NULL
);
    DROP TABLE public.products;
       public         heap    postgres    false    4            �            1259    73938    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    220    4            �           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    219            .           2604    73928    material_type id    DEFAULT     t   ALTER TABLE ONLY public.material_type ALTER COLUMN id SET DEFAULT nextval('public.material_type_id_seq'::regclass);
 ?   ALTER TABLE public.material_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            2           2604    73963    partner_products id    DEFAULT     z   ALTER TABLE ONLY public.partner_products ALTER COLUMN id SET DEFAULT nextval('public.partner_products_id_seq'::regclass);
 B   ALTER TABLE public.partner_products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            1           2604    73954    partners id    DEFAULT     j   ALTER TABLE ONLY public.partners ALTER COLUMN id SET DEFAULT nextval('public.partners_id_seq'::regclass);
 :   ALTER TABLE public.partners ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            /           2604    73935    product_type id    DEFAULT     r   ALTER TABLE ONLY public.product_type ALTER COLUMN id SET DEFAULT nextval('public.product_type_id_seq'::regclass);
 >   ALTER TABLE public.product_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            0           2604    73942    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            �          0    73925 
   material_type 
   TABLE DATA           H   COPY public.material_type (material_type, lose_percent, id) FROM stdin;
    public          postgres    false    216   �1       �          0    73960    partner_products 
   TABLE DATA           Z   COPY public.partner_products (id, partner, product, product_count, sale_date) FROM stdin;
    public          postgres    false    224   -2       �          0    73951    partners 
   TABLE DATA           �   COPY public.partners (partner_type, name, director_name, director_last_name, director_surname, e_mail, phone, address, inn, rating, id) FROM stdin;
    public          postgres    false    222   �2       �          0    73932    product_type 
   TABLE DATA           E   COPY public.product_type (product_type, coefficient, id) FROM stdin;
    public          postgres    false    218   ^5       �          0    73939    products 
   TABLE DATA           U   COPY public.products (product_type, product_name, artukul, min_cost, id) FROM stdin;
    public          postgres    false    220   �5       �           0    0    material_type_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.material_type_id_seq', 1, false);
          public          postgres    false    215            �           0    0    partner_products_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.partner_products_id_seq', 1, false);
          public          postgres    false    223            �           0    0    partners_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.partners_id_seq', 1, false);
          public          postgres    false    221            �           0    0    product_type_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.product_type_id_seq', 1, false);
          public          postgres    false    217            �           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 1, false);
          public          postgres    false    219            4           2606    73930     material_type material_type_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.material_type
    ADD CONSTRAINT material_type_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.material_type DROP CONSTRAINT material_type_pkey;
       public            postgres    false    216            <           2606    73965 &   partner_products partner_products_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.partner_products
    ADD CONSTRAINT partner_products_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.partner_products DROP CONSTRAINT partner_products_pkey;
       public            postgres    false    224            :           2606    73958    partners partners_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.partners DROP CONSTRAINT partners_pkey;
       public            postgres    false    222            6           2606    73937    product_type product_type_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.product_type
    ADD CONSTRAINT product_type_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.product_type DROP CONSTRAINT product_type_pkey;
       public            postgres    false    218            8           2606    73944    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    220            >           2606    73966 .   partner_products partner_products_partner_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.partner_products
    ADD CONSTRAINT partner_products_partner_fkey FOREIGN KEY (partner) REFERENCES public.partners(id);
 X   ALTER TABLE ONLY public.partner_products DROP CONSTRAINT partner_products_partner_fkey;
       public          postgres    false    4666    222    224            ?           2606    73971 .   partner_products partner_products_product_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.partner_products
    ADD CONSTRAINT partner_products_product_fkey FOREIGN KEY (product) REFERENCES public.products(id);
 X   ALTER TABLE ONLY public.partner_products DROP CONSTRAINT partner_products_product_fkey;
       public          postgres    false    224    4664    220            =           2606    73945 #   products products_product_type_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_type_fkey FOREIGN KEY (product_type) REFERENCES public.product_type(id);
 M   ALTER TABLE ONLY public.products DROP CONSTRAINT products_product_type_fkey;
       public          postgres    false    4662    220    218            �   X   x�����.칰�bӅ���
v_ؠ`�i�g`�i�u�#�KSN#<J��J�,8��(1*15�4�����؄Ӕ+F��� �:ah      �   �   x�U�K�0C�p:��ܥ�?G����x#$C0��]£�7��A�	��%#�R��6�Ӽ�M	�S�I{hQ,��^��}���2O��[��m�2�,Bw�<X�bK጖R�׫�+��?�(bҒˆ�R�(�??�v�Kk�_��jO�40O��b��������c;�      �   f  x��S�n�@]��b> !��ҍ�z%��ׁ��"��Vm��T.�����?�cBDW!���=�;����N�5���JI�~�OhM��RE+!����E�
���d�'�8Gw���Bv�����avPd�A������M�T�H�d�+:N�.nI����
�3L^R�/%��X�' u��'Z�����y��%�)�ڒ���	C�˖TNh\�9�MEW����#�
'_���)��6�g�n�j@ִ�y;�Dq|�����W)i�
R\Gv�:��,�ʟ���������<�w�1`�x���m����L���$	|�L�s��}�!<�LPFi,�`<βI�b�߁�e`Ú��hp4(�7��Di�!�h�B%I�X4�Ǥ�E�>`�>��qS#wvľ����JXkc0� �p�A�CX�5ܚJ�����%����g#�K��i���ʹ��`�tq1?���𠟵��p�6�`kဖ����&��@�4�����4��2��4��t��&�+��mN�m���!qp��rw
|�K�
v4Ώ�`��������ʌ&N���vn���L~��B��Ƙ�V�XA�?�W��sN[���V��Eo�Q�Ʀ��      �   v   x�e��
�0�wUP�	c���y�� т�Bര�QV��u����'v\(��`1KP�L���_s��F#8P$[�2(6I��_J�DJT�d��j���߸�Q%X�%�h��D(Q�      �   &  x�u�MN�0���S�DNlc�.&)Tb���MQ
�I��7�ى*��"G�y���ؚ�����cZ��I�ԡ�Kޠ�<���y@���L#��X�b���F�4�w�ko�{]E���/0}�8��`�閷��!� ���kֲ1Tl�������i���5�+"����a�!=�OW�͐2����.u�d�j|C��Қ���|l�����Q�$A��.� M| �\g<iTej2��jp~*[>��̐y�.g��gqd���i��_�r=VՍ5����������?�(�     
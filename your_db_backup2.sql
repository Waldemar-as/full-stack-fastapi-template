PGDMP     *                    |            app     12.22 (Debian 12.22-1.pgdg120+1)     12.22 (Debian 12.22-1.pgdg120+1)     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16384    app    DATABASE     s   CREATE DATABASE app WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';
    DROP DATABASE app;
                postgres    false                        3079    16449 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            �           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            �            1259    16385    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap    postgres    false            �            1259    16404    item    TABLE     �   CREATE TABLE public.item (
    description character varying(255),
    title character varying(255) NOT NULL,
    id uuid NOT NULL,
    owner_id uuid NOT NULL
);
    DROP TABLE public.item;
       public         heap    postgres    false            �            1259    16392    user    TABLE     �   CREATE TABLE public."user" (
    email character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    full_name character varying(255),
    hashed_password character varying NOT NULL,
    id uuid NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres    false            �          0    16385    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public          postgres    false    203   k       �          0    16404    item 
   TABLE DATA           @   COPY public.item (description, title, id, owner_id) FROM stdin;
    public          postgres    false    205   �       �          0    16392    user 
   TABLE DATA           `   COPY public."user" (email, is_active, is_superuser, full_name, hashed_password, id) FROM stdin;
    public          postgres    false    204   �       6           2606    16389 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public            postgres    false    203            ;           2606    16463    item item_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.item DROP CONSTRAINT item_pkey;
       public            postgres    false    205            9           2606    16461    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    204            7           1259    16418    ix_user_email    INDEX     H   CREATE UNIQUE INDEX ix_user_email ON public."user" USING btree (email);
 !   DROP INDEX public.ix_user_email;
       public            postgres    false    204            <           2606    16469    item item_owner_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public."user"(id) ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.item DROP CONSTRAINT item_owner_id_fkey;
       public          postgres    false    205    204    2873            �      x�3L46LN53�066����� )0�      �      x������ � �      �   �   x��M�0 ���nns�u�E�%����Ya���y�09!QX��y�0N��l��s��Xm�Z\�k޿���8?�2�~��)=4�����:�l����dZi�KYe�$R0  ��Y̂�ڠ�"�~�X'     
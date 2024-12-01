-- Create extension for UUID support
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- User table
CREATE TABLE public."user" (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(255) NOT NULL UNIQUE,
    is_active BOOLEAN NOT NULL DEFAULT true,
    is_superuser BOOLEAN NOT NULL DEFAULT false,
    full_name VARCHAR(255),
    hashed_password VARCHAR NOT NULL
);

-- Create index on email for faster lookups
CREATE UNIQUE INDEX ix_user_email ON public."user" (email);

-- Item table
CREATE TABLE public.item (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    owner_id uuid NOT NULL REFERENCES public."user"(id) ON DELETE CASCADE
);

-- Add comments
COMMENT ON TABLE public."user" IS 'Stores user account information';
COMMENT ON TABLE public.item IS 'Stores items owned by users';

-- Grant appropriate permissions
ALTER TABLE public."user" OWNER TO postgres;
ALTER TABLE public.item OWNER TO postgres;

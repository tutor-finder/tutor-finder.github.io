CREATE TABLE if not exists public.profiles (
id UUID NOT NULL PRIMARY KEY REFERENCES auth.users ON DELETE CASCADE,
first_name TEXT NULL,
last_name TEXT NULL,
username TEXT NULL UNIQUE,
email TEXT NULL
);

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public read access" ON public.profiles
FOR SELECT USING (TRUE);

CREATE POLICY "Allow authenticated users to insert" ON public.profiles
FOR INSERT WITH CHECK (auth.uid() = id);

CREATE POLICY "Allow authenticated users to update their own profile" ON public.profiles
FOR UPDATE USING (auth.uid() = id);

CREATE POLICY "Allow authenticated users to delete their own profile" ON public.profiles
FOR DELETE USING (auth.uid() = id);

-- Step 1: Create the function that will be called by the trigger.
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
-- Insert a new row into the 'profiles' table using the new user's ID
-- and metadata from the 'auth.users' table.
INSERT INTO public.profiles (id, first_name, last_name, username, email)
VALUES (
NEW.id,
NEW.raw_user_meta_data ->> 'first_name',
NEW.raw_user_meta_data ->> 'last_name',
NEW.raw_user_meta_data ->> 'username',
NEW.email
);
RETURN NEW;
END;

$$
LANGUAGE plpgsql SECURITY DEFINER;

-- Step 2: Create the trigger.
-- This trigger will automatically fire AFTER a new user is inserted into 'auth.users'.
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW
  EXECUTE FUNCTION public.handle_new_user();
$$

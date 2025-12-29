CREATE TABLE users(
    id bigint NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    -- TODO apply foreign keys
    user_id uuid REFERENCES auth.users(id),
    name text,
    created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE users ENABLE ROW LEVEL SECURITY;

-- TODO apply policies
CREATE POLICY "Users manage their own records" ON users TO authenticated
    USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);

-- TODO throttle vscode extension activations

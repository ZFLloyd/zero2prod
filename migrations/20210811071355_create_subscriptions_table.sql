-- Add migration script here
CREATE TABLE subscriptions (
    id uuid PRIMARY KEY,
    email text UNIQUE NOT NULL,
    name text NOT NULL,
    subscribed_at timestamptz NOT NULL
);
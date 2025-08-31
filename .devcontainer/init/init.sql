-- Create Keycloak DB and keycloak user
CREATE USER keycloak WITH PASSWORD 'jajnav5@';
CREATE DATABASE keycloak OWNER keycloak;
GRANT ALL PRIVILEGES ON DATABASE keycloak TO keycloak;

-- (Optional) Give each user SUPERUSER privileges (Admin rights)
ALTER USER keycloak WITH SUPERUSER;
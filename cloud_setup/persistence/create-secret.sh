# Replace with your desired username and password
USER="admin"
PASSWORD=$(op read op://vandelay/longhorn/password)

# Generate the basic auth string (username:hashed_password)
AUTH_STRING="${USER}:$(openssl passwd -stdin -apr1 <<< "${PASSWORD}")"

kubectl -n longhorn-system create secret generic basic-auth --from-literal=auth="${AUTH_STRING}"
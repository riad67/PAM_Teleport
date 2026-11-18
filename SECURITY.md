# Security model

This project demonstrates an SSH session on a developer workstation. Docker publishes the HTTPS proxy on loopback. Auth and SSH listen inside the container. The example assigns the Teleport roles `editor` and `access` to a user permitted to log in as Linux `root`.

A user with a root shell in this container can read and modify the cluster's stored credentials and audit state. Keep this lab restricted to trusted local users and disposable data. A deployment requiring independent audit records or workload isolation needs separate services and protected storage.

Keep raw recordings, MFA enrollment QR codes, one-time account URLs, keys, and Docker volumes private. The published demo contains selected SSH and audit views. If you find exposed credentials, contact the repository owner privately and identify the affected file without reposting the secret.

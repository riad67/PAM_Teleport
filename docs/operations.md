# Operating the lab

Run Docker commands from the project folder. If you selected an alternate web port, set `PAM_WEB_PORT` to the same value in each new CMD window before running Compose.

| Task | Windows CMD command |
| --- | --- |
| See container health and published port | `docker compose ps` |
| Inspect recent startup errors | `docker compose logs --tail=100 teleport` |
| List registered SSH nodes | `docker compose exec teleport tctl nodes ls` |
| Stop and resume the service | `docker compose stop`, then `docker compose start` |
| Remove the container and keep the cluster volume | `docker compose down` |
| Start again using that volume | `docker compose up -d --wait` |

### Recover an existing admin account

If setup reports `user "admin" already registered`, the account exists. Use the original invitation if it is still valid. If you have lost the link or need to replace the credentials, run:

```cmd
docker compose exec teleport tctl users reset admin
```

This resets the existing password and second-factor enrollment. Open the new one-time link on your workstation, set the password, and enroll MFA again. The recorded lab run issued a reset link valid for eight hours. Use the expiry printed by your own command. Keep invitations, reset links and authenticator setup codes private.

### Resolve common errors

| Symptom | Action |
| --- | --- |
| Docker reports that port 3080 is in use | In CMD run `set PAM_WEB_PORT=13080`, then `docker compose up -d --wait`. Open the URL using port 13080. |
| Login works on one port but fails on another | Check `docker compose ps`. Each cluster has its own users and MFA enrollment. |
| SSH disconnects with `fork/exec /sbin/nologin` | Check the browser port and run `docker compose up -d --build --wait` in this repository. The supplied Dockerfile assigns `/busybox/sh` as the root login shell. |
| The web page loads before a server appears | Check `tctl nodes ls` using the command above. Refresh Resources after the node registers. |
| Build fails while pulling the Teleport image | Check Docker Desktop's network access to `public.ecr.aws` and retry. |

The named volume contains the cluster identity and audit data. Keep the same Compose project name when reusing it. Deleting the volume permanently removes that cluster's accounts, certificates, and recordings.

# Security Policy

This repository documents an isolated SOC lab. It must not contain live credentials or private keys.

## Never commit

- MISP API keys
- MISP administrator passwords
- TLS private keys
- Real production alerts containing sensitive data
- Copies of `/var/ossec/etc/ossec.conf` that contain secrets
- The active MISP `.env` file

Use the example files in `configs/` and replace placeholders only on the lab machines.

If a secret is accidentally committed, rotate it immediately and remove it from Git history. For repository security reports, use a private GitHub security advisory instead of a public issue.

The `verify=False` certificate setting described in the lab is only for an isolated self-signed test environment. Production deployments should use a trusted certificate or install the MISP certificate authority in the Wazuh server trust store.

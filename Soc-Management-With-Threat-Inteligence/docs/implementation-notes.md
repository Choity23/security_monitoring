# Implementation Notes

## Monitoring path

The real-time FIM path used in this lab is:

```text
C:\SOC-Lab\Monitored
```

The quarantine folder is created for future incident-response workflows:

```text
C:\SOC-Lab\Quarantine
```

The current implementation detects activity but does not automatically move files to quarantine.

## Centralized configuration

The Windows endpoint is assigned to the `windows-soc` group. Its shared configuration is stored on the Wazuh Manager at:

```text
/var/ossec/etc/shared/windows-soc/agent.conf
```

A temporary file is validated before activation to reduce the risk of distributing malformed XML:

```text
/var/ossec/etc/shared/windows-soc/agent.conf.tmp
```

## FIM event sequence

1. The analyst creates `demo.txt`.
2. Wazuh detects an added file event.
3. The analyst appends a second line.
4. Wazuh detects a checksum or content change.
5. The analyst deletes the file.
6. Wazuh detects a deleted file event.

## SCA interpretation

The SCA score in this lab is a security-hardening indicator, not proof of compromise. Every failed control should be reviewed for applicability, operational impact, and remediation priority.

## Evidence handling

For a clean lab report, capture:

- Service status
- Agent ID and connectivity
- Agent group membership
- Configuration validation
- Synchronization status
- File creation, modification, and deletion alerts
- Alert document fields
- SCA summary and compliance score

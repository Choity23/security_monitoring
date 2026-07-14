# Troubleshooting

## Agent is not synchronized

**Possible causes**

- Incorrect Agent ID
- The agent was not added to `windows-soc`
- The shared configuration has not been distributed yet

**Checks**

```bash
sudo /var/ossec/bin/agent_control -l
sudo /var/ossec/bin/agent_groups -s -i 001
sudo /var/ossec/bin/agent_groups -S -i 001
```

Wait about 30 seconds and restart the manager when needed:

```bash
sudo systemctl restart wazuh-manager
```

## `verify-agent-conf` reports an error

Open the temporary file, correct malformed XML, and validate again:

```bash
sudo nano /var/ossec/etc/shared/windows-soc/agent.conf.tmp
sudo /var/ossec/bin/verify-agent-conf \
  -f /var/ossec/etc/shared/windows-soc/agent.conf.tmp
```

Do not replace the active configuration until validation succeeds.

## FIM alerts do not appear

- Confirm `C:\SOC-Lab\Monitored` existed before the configuration was applied.
- Confirm the Windows Wazuh service is running.
- Restart the service from Administrator PowerShell.
- Confirm the centralized configuration is synchronized.

```powershell
Get-Service *wazuh*
Restart-Service -Name WazuhSvc
```

## Events are missing from the Dashboard

- Set the time range to the last 24 hours.
- Open the File Integrity Monitoring events view.
- Filter by rule IDs `550`, `553`, and `554`.
- Confirm the selected agent is the expected Windows endpoint.

## Windows service does not restart

Open PowerShell with **Run as administrator** and retry.

## A network path is not monitored

Use a local path on the Windows system drive for this lab. Do not use a UNC path or mapped drive for the monitored directory.

## Group creation script asks for confirmation

The Wazuh `agent_groups` command can be interactive. Read the prompt and enter `y` only after checking the group name and Agent ID.

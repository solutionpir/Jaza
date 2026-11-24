# Security Policy

## Scope

Jaza is a small local diagnostic utility. Its intended behavior is read-only: inspect a local TCP listener and test a connection to `127.0.0.1`.

## Reporting a vulnerability

Please do not publish secrets, API keys, access tokens, session cookies, or private gateway configuration in a public issue. For a suspected security issue, contact the repository maintainer privately through the contact method listed on the maintainer's GitHub profile.

## Security expectations

- Jaza must not collect or transmit telemetry by default.
- Jaza must not read or print credentials or environment-variable values.
- Jaza must not make remote network requests.
- Jaza must not change gateway configuration, firewall rules, or running processes.

These expectations describe the project's intended behavior, not a guarantee that every future contribution is secure. Review code before execution.

Security Policy
Scope
Jaza is a small local diagnostic utility. Its intended behavior is to ask the user for a TCP port, inspect local listener information, and test a connection to the computer's loopback address.
Reporting a vulnerability
Please do not publish passwords, API keys, access tokens, session cookies, private files, or other sensitive information in a public issue. Report suspected security issues privately through the contact method listed on the repository maintainer's GitHub profile.
Security expectations
Jaza must not collect or transmit telemetry.
Jaza must not read or print credentials or environment-variable values.
Jaza must not make remote network requests.
Jaza must not modify system settings, firewall rules, services, or running processes.
Changes to these expectations must be discussed and documented before implementation.
These expectations describe the project's intended behavior, not a guarantee that every future contribution is secure. Review code before execution.

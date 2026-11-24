# Jaza — Local TCP Port Diagnostics

Jaza is a small, read-only Windows utility for checking whether a user-selected TCP port is accepting connections on the same computer.

## Purpose

When a local development service is not responding, a simple port check can help distinguish a listening service from one that is not accepting local connections. Jaza provides a focused check without changing system settings.

## Features

- Prompts the user to enter a TCP port number at runtime; no port is preconfigured.
- Checks whether Windows reports a local listener on the selected port.
- Tests a connection to the computer's loopback address (`127.0.0.1`) only.
- Does not contact remote hosts or external services.
- Does not read credentials, environment-variable values, application configuration, or private files.
- Does not start, stop, or change processes, services, firewall rules, or system settings.
- Uses built-in Windows PowerShell and .NET functionality; no third-party modules are required.

## Requirements

- Windows 10 or Windows 11.
- Windows PowerShell 5.1 or later.
- Permission to run a local PowerShell script under your existing execution policy.

## Quick start

1. Download or clone this repository.
2. Open PowerShell in the repository folder.
3. Run:

   ```powershell
   .\scripts\Test-LocalTcpPort.ps1
   ```

4. When prompted, enter the local TCP port you want to check (a number from 1 to 65535).

The utility has no default port. You choose the value each time you run it.

## What the result means

- **Listener found:** Windows reports a local TCP listener on the selected port.
- **Local connection succeeded:** A TCP connection to `127.0.0.1` on the selected port succeeded.
- **No listener / connection failed:** The selected port may not be in use, the service may not be ready, or the service may not accept loopback connections.

See [the troubleshooting guide](docs/troubleshooting.md) for general next steps.

## Safety and privacy

Jaza is designed for local checks only. It asks for the port interactively and does not store the value. Its connection test is limited to `127.0.0.1`; it does not make internet requests or send diagnostic data anywhere. It does not inspect application files or credentials. Review code before running any script downloaded from the internet.

For security concerns, see [SECURITY.md](SECURITY.md).

## Project status and reach

Jaza is an early-stage, single-maintainer utility. It does not currently claim established download, adoption, dependency, or external-contributor metrics. The initial goal is to provide a small, understandable local troubleshooting tool and improve it through genuine user feedback and contributions.

## Contributing

Bug reports, documentation improvements, and focused pull requests are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md) before contributing.

## License

Jaza is released under the MIT License. See [LICENSE](LICENSE).

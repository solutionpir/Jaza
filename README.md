# Jaza — Local AI Gateway Diagnostics

Jaza is a small, Windows-first, read-only diagnostic helper for developers running a local AI assistant or agent gateway.

The first version focuses on a simple but common troubleshooting question: **is the expected local TCP port listening, and can this computer reach it over loopback?** It also reports whether Node.js is available, because many local agent projects use Node-based runtimes.

> **Project status:** Early-stage draft (0.1.0). The script still needs execution testing on supported Windows/PowerShell versions before being treated as stable. Jaza is a small utility, not a complete gateway manager or an official OpenClaw tool.

## Why this exists

When a self-hosted AI assistant does not respond, it is easy to start changing configuration or restarting processes before checking the basics. Jaza provides a repeatable first-pass check and explains what it does—and does not—prove.

## Features

- Checks whether `node` is available and reports its version (informational only).
- Checks whether a process is listening on the selected local TCP port.
- Tests a TCP connection to `127.0.0.1` on that port.
- Warns when the listener appears to bind to all network interfaces (`0.0.0.0` or `::`).
- Makes no configuration changes, does not stop or start processes, and does not read or print credentials, tokens, or environment variables.
- Uses Windows PowerShell built-in commands; no third-party modules are required.

## Requirements

- Windows 10 or Windows 11.
- Windows PowerShell 5.1 or later.
- Permission to run a local PowerShell script under your machine's existing execution policy.
- Node.js is optional; Jaza reports its presence but does not require it.

## Quick start

1. Download or clone this repository.
2. Open PowerShell in the repository folder.
3. Run the script using the port configured by your local gateway:

```powershell
.\scripts\Test-LocalAgentGateway.ps1 -Port 18789
```

The default port is `18789`. Change it when your gateway uses a different port. Jaza only probes `127.0.0.1`; it does not connect to a remote host.

## Example output

The precise output depends on your computer and the selected port. A typical successful check looks like this:

```text
Jaza — Local AI Gateway Diagnostics
Target: 127.0.0.1:18789
[INFO] Node.js: vXX.XX.X
[PASS] Listener: A listener was found on TCP port 18789.
[PASS] Loopback: 127.0.0.1:18789 accepted a TCP connection.
[INFO] Scope: Read-only checks completed; no settings or processes were changed.
```

The example is illustrative, not a claim that a particular gateway or port is running on your system.

## Understanding the result

- **Listener PASS:** Windows reports a process listening on the selected port.
- **Loopback PASS:** A local TCP connection to `127.0.0.1:<port>` succeeded.
- **Listener WARN/FAIL:** The port may be wrong, the gateway may not have started, or the gateway may be listening on a different address.
- **Wildcard bind warning:** A service listening on all interfaces may be reachable beyond the local machine depending on firewall and service authentication settings. Review the gateway's official security guidance before exposing it to a network.

See [the troubleshooting guide](docs/troubleshooting.md) for next steps.

## What Jaza does not verify

A successful TCP connection does **not** prove that the application-level API, authentication, model provider, RPC endpoint, or agent workflow is healthy. Jaza does not inspect gateway configuration, make authenticated requests, read logs, modify firewall rules, change execution policy, or restart services. Use the gateway's official status command and documentation for application-level checks.

## Safety and privacy

Jaza is designed to be read-only. It does not collect telemetry or send data over the internet. Its only network probe is a TCP connection to `127.0.0.1` on the port you specify. Please review the script before running it, as you should with any downloaded code.

For security concerns, see [SECURITY.md](SECURITY.md).

## Project reach and current status

Jaza is currently an early-stage, single-maintainer project. At this initial publication, it has no established download, adoption, dependent-repository, or external-contributor metrics. Those figures will only be reported if they become measurable. The initial goal is to publish a small, understandable diagnostic utility and improve it through genuine user feedback and code contributions.

## Contributing

Bug reports, documentation improvements, and focused pull requests are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a pull request.

## License

Jaza is released under the MIT License. See [LICENSE](LICENSE).

# Contributing to Jaza

Thank you for considering a contribution.

## Good first contributions

- Clarify setup or troubleshooting instructions.
- Report a reproducible bug with Windows and PowerShell version details.
- Improve error handling without adding telemetry or collecting sensitive information.
- Add tests or compatibility notes for supported Windows versions.

## Before opening a pull request

1. Open an issue for substantial changes so the scope can be discussed.
2. Keep changes focused and explain the problem they solve.
3. Do not add code that uploads diagnostics, secrets, environment variables, or configuration files.
4. Do not add commands that start, stop, or modify a user's gateway unless the project scope is explicitly discussed and the safety implications are documented.
5. Test locally and include the PowerShell version and Windows version in the pull request description.

## Pull request checklist

- [ ] The change has a clear purpose.
- [ ] Documentation is updated where needed.
- [ ] No credentials, tokens, private logs, or personal data are included.
- [ ] The script remains read-only unless an explicitly discussed change says otherwise.
- [ ] Any limitations are documented.

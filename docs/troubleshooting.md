# Troubleshooting

## The script says the input is invalid

Enter a whole-number TCP port between 1 and 65535. Do not include a service name or punctuation.

## No local listener is reported

The selected port may not currently be in use. Check the documentation for the local application you intended to test and confirm which port it uses. Jaza does not discover or read application configuration.

## The local connection test fails

The service may not be running, may still be starting, or may not accept connections through the local loopback interface. Jaza does not start or restart services.

## Listener information is unavailable

Some Windows installations may not expose the listener-inspection cmdlet. The script will still attempt its local TCP connection test.

## Safety scope

Jaza checks only the user-entered port on the same computer. It does not scan other computers, contact external hosts, read private files, or modify system settings.

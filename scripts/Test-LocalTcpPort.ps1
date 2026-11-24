<#
.SYNOPSIS
    Checks a user-selected TCP port on the local computer.
.DESCRIPTION
    Prompts for a TCP port, checks local listener information when the
    Windows cmdlet is available, and tests a connection to 127.0.0.1.
    The script has no preset port and makes no remote network requests.
#>

$ErrorActionPreference = 'Stop'

Write-Host ''
Write-Host 'Jaza - Local TCP Port Check' -ForegroundColor Cyan
Write-Host 'This check only tests the local computer.'
Write-Host ''

$portText = Read-Host 'Enter a TCP port number (1-65535)'
[int]$port = 0

if (-not [int]::TryParse($portText, [ref]$port) -or $port -lt 1 -or $port -gt 65535) {
    Write-Host 'Invalid input. Enter a whole number from 1 to 65535.' -ForegroundColor Red
    exit 2
}

Write-Host ''
Write-Host ("Checking local TCP port {0}..." -f $port) -ForegroundColor Cyan

$listenerFound = $false
try {
    if (Get-Command -Name Get-NetTCPConnection -ErrorAction SilentlyContinue) {
        $listeners = @(Get-NetTCPConnection -State Listen -LocalPort $port -ErrorAction SilentlyContinue)
        $listenerFound = ($listeners.Count -gt 0)
    }
    else {
        Write-Host 'Listener inventory is unavailable on this Windows installation; performing the local connection test only.' -ForegroundColor Yellow
    }
}
catch {
    Write-Host 'Listener inventory could not be read; performing the local connection test only.' -ForegroundColor Yellow
}

if ($listenerFound) {
    Write-Host 'PASS: Windows reports a local listener on this port.' -ForegroundColor Green
}
elseif (Get-Command -Name Get-NetTCPConnection -ErrorAction SilentlyContinue) {
    Write-Host 'INFO: No local listening socket was reported for this port.' -ForegroundColor Yellow
}

$client = New-Object System.Net.Sockets.TcpClient
try {
    $asyncResult = $client.BeginConnect('127.0.0.1', $port, $null, $null)
    $completed = $asyncResult.AsyncWaitHandle.WaitOne(1500, $false)

    if (-not $completed) {
        throw 'The local connection attempt timed out.'
    }

    $client.EndConnect($asyncResult)
    Write-Host 'PASS: A TCP connection to the local computer succeeded.' -ForegroundColor Green
}
catch {
    Write-Host 'INFO: A TCP connection to the local computer could not be established.' -ForegroundColor Yellow
    Write-Host 'The selected port may not be in use or may not accept local connections.' -ForegroundColor Yellow
}
finally {
    if ($null -ne $client) {
        $client.Close()
    }
}

Write-Host ''
Write-Host 'Finished. No settings or processes were changed.'

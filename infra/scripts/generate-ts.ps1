<#
    .SYNOPSIS
        Generates TypeScript files from the OpenAPI specification.
    usage:
         .\generate-ts.ps1
#>
param(
    [int]    $Port = 3951
)
$ScriptFolder = Split-Path -Parent $MyInvocation.MyCommand.Path
$InfraFolder   = Split-Path -Parent $ScriptFolder
$Root          = Split-Path -Parent $InfraFolder
# Resolve paths
$ApiProject      = Join-Path $Root 'src\BracketWatch.API'
$FrontendProject = Join-Path $Root 'src\BracketWatch.Frontend'
$ApiCsProj   = Join-Path $ApiProject 'BracketWatch.API.csproj'
$OutSwagger = Join-Path $PSScriptRoot "swagger_$PID.json"


# Kill Any existing process
Get-NetTCPConnection -LocalPort $Port -State Listen -ErrorAction SilentlyContinue |
ForEach-Object {
    Write-Host "⏹ Stopping PID $($_.OwningProcess) on port $Port"
    Stop-Process -Id $_.OwningProcess -Force -ErrorAction SilentlyContinue
}

# …build & launch API (same as before)…
$proc = Start-Process dotnet `
    -ArgumentList "run --project `"$ApiCsProj`" --urls=http://localhost:$Port" `
    -WorkingDirectory $ApiProject -NoNewWindow -PassThru

#  ──> dynamic wait for the swagger endpoint
$SwaggerUrl  = "http://localhost:$Port/swagger/v1/swagger.json"
$maxRetries  = 15
for ($i = 0; $i -lt $maxRetries; $i++) {
    try {
        # HEAD is slightly cheaper than GET
        Invoke-WebRequest -Uri $SwaggerUrl -Method Head -UseBasicParsing -TimeoutSec 2 | Out-Null
        Write-Host "✅ API is up after $($i+1) second(s)."
        break
    }
    catch {
        Start-Sleep -Seconds 1
    }
}

#  ──> generate client as soon as it’s ready
Push-Location $FrontendProject
Write-Host "Generating Vue TS client from $SwaggerUrl…"
npx nswag openapi2tsclient `
  /input:$SwaggerUrl `
  /output:src/models/ApiClient.ts `
  /generateDtoTypes:true `
  /typeStyle:Class
Pop-Location

#  ──> tear down
Stop-Process -Id $proc.Id -Force


Write-Host "Greenmove - preparacion inicial" -ForegroundColor Cyan

$requiredCommands = @("git", "docker", "java")

foreach ($command in $requiredCommands) {
    if (-not (Get-Command $command -ErrorAction SilentlyContinue)) {
        Write-Host "$command no esta disponible en PATH." -ForegroundColor Yellow
    } else {
        Write-Host "$command disponible." -ForegroundColor DarkGray
    }
}

if (-not (Test-Path ".git")) {
    git init
    Write-Host "Repositorio Git inicializado." -ForegroundColor Green
} else {
    Write-Host "Git ya estaba inicializado." -ForegroundColor DarkGray
}

if (-not (Test-Path ".env")) {
    Copy-Item ".env.example" ".env"
    Write-Host "Se creo .env desde .env.example." -ForegroundColor Green
} else {
    Write-Host ".env ya existe; no se sobreescribio." -ForegroundColor DarkGray
}

Write-Host ""
Write-Host "Siguiente validacion recomendada:"
Write-Host "  docker compose config"
Write-Host "  docker compose run --rm backend mvn clean test"
Write-Host ""
Write-Host "Lee README.md, AGENTS.md y docs/PRODUCT.md antes de implementar features."

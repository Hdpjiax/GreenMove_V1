Write-Host "RAITE Campus - preparación inicial" -ForegroundColor Cyan

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Git no está instalado." -ForegroundColor Yellow
} else {
    if (-not (Test-Path ".git")) {
        git init
        Write-Host "Repositorio Git inicializado." -ForegroundColor Green
    } else {
        Write-Host "Git ya estaba inicializado." -ForegroundColor DarkGray
    }
}

Write-Host ""
Write-Host "Revisa README.md y docs/TAREAS.md antes del primer commit."
Write-Host 'Commit sugerido: git add . ; git commit -m "chore: crea estructura inicial de RAITE Campus"'

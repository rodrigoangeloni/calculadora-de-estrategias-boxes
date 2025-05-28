# Script para crear releases automáticamente
# Uso: .\release.ps1 -Version "1.0.2" -Message "Descripción del release"

param(
    [Parameter(Mandatory=$true)]
    [string]$Version,
    
    [Parameter(Mandatory=$true)]
    [string]$Message
)

Write-Host "🏁 Creando release v$Version para Calculadora de Estrategias SimRacing..." -ForegroundColor Green

# Verificar que estamos en el directorio correcto
if (!(Test-Path "package.json")) {
    Write-Error "❌ No se encontró package.json. Ejecuta desde la raíz del proyecto."
    exit 1
}

# Actualizar version en package.json
Write-Host "📦 Actualizando package.json..." -ForegroundColor Yellow
$packageJson = Get-Content "package.json" | ConvertFrom-Json
$packageJson.version = $Version
$packageJson | ConvertTo-Json -Depth 10 | Set-Content "package.json"

# Actualizar version en calculadora.js
Write-Host "⚙️ Actualizando calculadora.js..." -ForegroundColor Yellow
$jsContent = Get-Content "calculadora.js" -Raw
$jsContent = $jsContent -replace "v\d+\.\d+\.\d+", "v$Version"
Set-Content "calculadora.js" -Value $jsContent

# Actualizar version en calculadora.html
Write-Host "🌐 Actualizando calculadora.html..." -ForegroundColor Yellow
$htmlContent = Get-Content "calculadora.html" -Raw
$htmlContent = $htmlContent -replace 'content="[\d\.]+', "content=`"$Version`""
$htmlContent = $htmlContent -replace "v\d+\.\d+\.\d+", "v$Version"
Set-Content "calculadora.html" -Value $htmlContent

# Actualizar README.md
Write-Host "📖 Actualizando README.md..." -ForegroundColor Yellow
$readmeContent = Get-Content "README.md" -Raw
$readmeContent = $readmeContent -replace "v\d+\.\d+\.\d+", "v$Version"
Set-Content "README.md" -Value $readmeContent

# Commit de los cambios
Write-Host "💾 Haciendo commit de los cambios..." -ForegroundColor Yellow
git add .
git commit -m "Release v$Version - $Message"

# Crear tag
Write-Host "🏷️ Creando tag v$Version..." -ForegroundColor Yellow
git tag -a "v$Version" -m "Release v$Version - $Message"

# Push a main y tags
Write-Host "🚀 Subiendo cambios y tags a GitHub..." -ForegroundColor Yellow
git push origin main
git push origin "v$Version"

Write-Host "✅ Release v$Version creado exitosamente!" -ForegroundColor Green
Write-Host "🌐 Ve a GitHub para crear el release oficial: https://github.com/rodrigoangeloni/calculadora-de-estrategias-boxes/releases/new" -ForegroundColor Cyan
Write-Host "🎯 Selecciona el tag v$Version y agrega las notas del release" -ForegroundColor Cyan

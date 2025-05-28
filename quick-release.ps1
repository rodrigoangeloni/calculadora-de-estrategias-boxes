# Quick Release - Script ultra-rápido para releases automáticos
# Uso: .\quick-release.ps1 [patch|minor|major]

param(
    [ValidateSet("patch", "minor", "major")]
    [string]$Type = "auto"  # Auto-detectar por defecto
)

Write-Host "⚡ Quick Release - Calculadora de Estrategias SimRacing" -ForegroundColor Yellow

# Verificar directorio
if (!(Test-Path "package.json")) {
    Write-Error "❌ Ejecuta desde la raíz del proyecto."
    exit 1
}

# Obtener versión actual
$currentVersion = (Get-Content "package.json" | ConvertFrom-Json).version

# Auto-detectar tipo si no se especifica
if ($Type -eq "auto") {
    $commits = git log --oneline -10 --no-merges
    
    if ($commits -match "(BREAKING|major:|!:)") {
        $Type = "major"
    } elseif ($commits -match "(feat:|feature:|add:|new:|minor:)") {
        $Type = "minor"
    } else {
        $Type = "patch"
    }
}

# Calcular nueva versión
$parts = $currentVersion.Split('.')
$major = [int]$parts[0]
$minor = [int]$parts[1] 
$patch = [int]$parts[2]

$newVersion = switch ($Type) {
    "patch" { "$major.$minor.$($patch + 1)" }
    "minor" { "$major.$($minor + 1).0" }
    "major" { "$($major + 1).0.0" }
}

# Mensaje automático
$emoji = switch ($Type) {
    "patch" { "🔧" }
    "minor" { "✨" }
    "major" { "💥" }
}

$message = "$emoji Release $Type con mejoras y actualizaciones"

Write-Host "🚀 $currentVersion → $newVersion ($Type)" -ForegroundColor Green

# Ejecutar release
& .\release.ps1 -Version $newVersion -Message $message

Write-Host "✅ Quick release completado!" -ForegroundColor Green

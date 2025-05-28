# Script de Auto-Release Inteligente
# Analiza los cambios y sugiere automáticamente el tipo de release
# Uso: .\auto-release.ps1 [-Force] [-AutoConfirm]

param(
    [switch]$Force,        # Forzar release sin confirmación
    [switch]$AutoConfirm,  # Confirmar automáticamente la versión sugerida
    [string]$CustomMessage = ""  # Mensaje personalizado opcional
)

Write-Host "🤖 Auto-Release Inteligente - Calculadora de Estrategias SimRacing" -ForegroundColor Cyan
Write-Host "=" * 70 -ForegroundColor Gray

# Verificar que estamos en el directorio correcto
if (!(Test-Path "package.json")) {
    Write-Error "❌ No se encontró package.json. Ejecuta desde la raíz del proyecto."
    exit 1
}

# Obtener la versión actual
$packageJson = Get-Content "package.json" | ConvertFrom-Json
$currentVersion = $packageJson.version
Write-Host "📦 Versión actual: v$currentVersion" -ForegroundColor Yellow

# Función para incrementar versión
function Get-NextVersion {
    param(
        [string]$current,
        [string]$type  # "patch", "minor", "major"
    )
    
    $parts = $current.Split('.')
    $major = [int]$parts[0]
    $minor = [int]$parts[1] 
    $patch = [int]$parts[2]
    
    switch ($type) {
        "patch" { return "$major.$minor.$($patch + 1)" }
        "minor" { return "$major.$($minor + 1).0" }
        "major" { return "$($major + 1).0.0" }
    }
}

# Analizar cambios desde el último tag
Write-Host "🔍 Analizando cambios desde el último release..." -ForegroundColor Blue

try {
    $lastTag = git describe --tags --abbrev=0 2>$null
    if (!$lastTag) {
        $lastTag = "HEAD~10"  # Si no hay tags, usar los últimos 10 commits
        Write-Host "⚠️  No se encontraron tags previos, analizando últimos commits" -ForegroundColor Yellow
    } else {
        Write-Host "🏷️  Último tag: $lastTag" -ForegroundColor Green
    }
} catch {
    $lastTag = "HEAD~10"
    Write-Host "⚠️  Error obteniendo tags, analizando últimos commits" -ForegroundColor Yellow
}

# Obtener commits desde el último tag
$commits = git log "$lastTag..HEAD" --oneline --no-merges 2>$null

if (!$commits) {
    Write-Host "❌ No hay cambios desde el último release." -ForegroundColor Red
    Write-Host "💡 Tip: Haz algunos commits antes de crear un release." -ForegroundColor Cyan
    exit 1
}

Write-Host "📋 Cambios detectados:" -ForegroundColor Green
$commits | ForEach-Object { Write-Host "  • $_" -ForegroundColor White }

# Analizar tipo de cambios
$hasBreakingChanges = $false
$hasNewFeatures = $false  
$hasBugFixes = $false
$hasDocChanges = $false
$hasInfraChanges = $false

$breakingKeywords = @("BREAKING", "breaking change", "major:", "!:")
$featureKeywords = @("feat:", "feature:", "add:", "new:", "minor:")
$bugfixKeywords = @("fix:", "bug:", "patch:", "hotfix:", "correct:")
$docKeywords = @("docs:", "doc:", "readme:", "documentation:")
$infraKeywords = @("chore:", "build:", "ci:", "test:", "refactor:", "style:")

foreach ($commit in $commits) {
    $commitLower = $commit.ToLower()
    
    # Detectar cambios breaking
    foreach ($keyword in $breakingKeywords) {
        if ($commitLower -match $keyword.ToLower()) {
            $hasBreakingChanges = $true
            break
        }
    }
    
    # Detectar nuevas features
    foreach ($keyword in $featureKeywords) {
        if ($commitLower -match $keyword.ToLower()) {
            $hasNewFeatures = $true
            break
        }
    }
    
    # Detectar bug fixes
    foreach ($keyword in $bugfixKeywords) {
        if ($commitLower -match $keyword.ToLower()) {
            $hasBugFixes = $true
            break
        }
    }
    
    # Detectar cambios de documentación
    foreach ($keyword in $docKeywords) {
        if ($commitLower -match $keyword.ToLower()) {
            $hasDocChanges = $true
            break
        }
    }
    
    # Detectar cambios de infraestructura
    foreach ($keyword in $infraKeywords) {
        if ($commitLower -match $keyword.ToLower()) {
            $hasInfraChanges = $true
            break
        }
    }
}

# Determinar tipo de release
$releaseType = "patch"  # Default
$releaseEmoji = "🔧"
$releaseDescription = "Correcciones y mejoras menores"

if ($hasBreakingChanges) {
    $releaseType = "major"
    $releaseEmoji = "💥"
    $releaseDescription = "Cambios importantes con posibles incompatibilidades"
} elseif ($hasNewFeatures) {
    $releaseType = "minor" 
    $releaseEmoji = "✨"
    $releaseDescription = "Nuevas funcionalidades"
} elseif ($hasBugFixes) {
    $releaseType = "patch"
    $releaseEmoji = "🐛"
    $releaseDescription = "Correcciones de bugs"
} elseif ($hasDocChanges) {
    $releaseType = "patch"
    $releaseEmoji = "📚"
    $releaseDescription = "Actualizaciones de documentación"
} elseif ($hasInfraChanges) {
    $releaseType = "patch"
    $releaseEmoji = "⚙️"
    $releaseDescription = "Mejoras de infraestructura"
}

$suggestedVersion = Get-NextVersion -current $currentVersion -type $releaseType

# Mostrar análisis
Write-Host ""
Write-Host "🧠 Análisis Inteligente de Cambios:" -ForegroundColor Cyan
Write-Host "  💥 Cambios Breaking: $(if($hasBreakingChanges){'✅ SÍ'}else{'❌ NO'})" -ForegroundColor $(if($hasBreakingChanges){'Red'}else{'Gray'})
Write-Host "  ✨ Nuevas Features: $(if($hasNewFeatures){'✅ SÍ'}else{'❌ NO'})" -ForegroundColor $(if($hasNewFeatures){'Green'}else{'Gray'})
Write-Host "  🐛 Bug Fixes: $(if($hasBugFixes){'✅ SÍ'}else{'❌ NO'})" -ForegroundColor $(if($hasBugFixes){'Yellow'}else{'Gray'})
Write-Host "  📚 Documentación: $(if($hasDocChanges){'✅ SÍ'}else{'❌ NO'})" -ForegroundColor $(if($hasDocChanges){'Blue'}else{'Gray'})
Write-Host "  ⚙️  Infraestructura: $(if($hasInfraChanges){'✅ SÍ'}else{'❌ NO'})" -ForegroundColor $(if($hasInfraChanges){'Cyan'}else{'Gray'})

Write-Host ""
Write-Host "🎯 Recomendación Automática:" -ForegroundColor Green
Write-Host "  📦 Tipo de Release: $releaseType ($releaseEmoji)" -ForegroundColor White
Write-Host "  🏷️  Versión Sugerida: v$currentVersion → v$suggestedVersion" -ForegroundColor White  
Write-Host "  📝 Descripción: $releaseDescription" -ForegroundColor White

# Generar mensaje automático del release
$autoMessage = if ($CustomMessage) { 
    $CustomMessage 
} else {
    switch ($releaseType) {
        "major" { "$releaseEmoji Actualización mayor con cambios importantes" }
        "minor" { "$releaseEmoji Nuevas funcionalidades y mejoras" }
        "patch" { "$releaseEmoji Correcciones de bugs y mejoras menores" }
    }
}

Write-Host "  💬 Mensaje: $autoMessage" -ForegroundColor White

# Confirmación (si no está en modo AutoConfirm)
if (!$AutoConfirm -and !$Force) {
    Write-Host ""
    Write-Host "❓ ¿Proceder con este release? [Y/n/c(ustom)]: " -NoNewline -ForegroundColor Yellow
    $response = Read-Host
    
    switch ($response.ToLower()) {
        "n" { 
            Write-Host "❌ Release cancelado por el usuario." -ForegroundColor Red
            exit 0 
        }
        "c" {
            Write-Host "Ingresa la versión personalizada (formato: X.Y.Z): " -NoNewline -ForegroundColor Cyan
            $customVersion = Read-Host
            if ($customVersion -match '^\d+\.\d+\.\d+$') {
                $suggestedVersion = $customVersion
                Write-Host "✅ Usando versión personalizada: v$suggestedVersion" -ForegroundColor Green
            } else {
                Write-Host "❌ Formato de versión inválido. Usando versión sugerida." -ForegroundColor Red
            }
            
            Write-Host "Ingresa un mensaje personalizado (Enter para usar automático): " -NoNewline -ForegroundColor Cyan
            $customMsg = Read-Host
            if ($customMsg.Trim()) {
                $autoMessage = $customMsg
            }
        }
        default { 
            Write-Host "✅ Continuando con la configuración sugerida..." -ForegroundColor Green
        }
    }
}

Write-Host ""
Write-Host "🚀 Iniciando release automático..." -ForegroundColor Green
Write-Host "=" * 50 -ForegroundColor Gray

# Verificar estado limpio del repositorio
$gitStatus = git status --porcelain
if ($gitStatus -and !$Force) {
    Write-Host "⚠️  Hay archivos modificados sin commitear:" -ForegroundColor Yellow
    $gitStatus | ForEach-Object { Write-Host "  $_" -ForegroundColor White }
    Write-Host ""
    Write-Host "❓ ¿Agregar cambios pendientes al release? [Y/n]: " -NoNewline -ForegroundColor Yellow
    $addChanges = Read-Host
    
    if ($addChanges.ToLower() -ne "n") {
        Write-Host "📝 Agregando cambios pendientes..." -ForegroundColor Blue
        git add .
        git commit -m "chore: preparar archivos para release v$suggestedVersion"
    }
}

# Ejecutar el release usando el script existente
Write-Host "⚙️  Ejecutando script de release..." -ForegroundColor Blue
try {
    & .\release.ps1 -Version $suggestedVersion -Message $autoMessage
    
    Write-Host ""
    Write-Host "🎉 ¡Release v$suggestedVersion creado exitosamente!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📋 Resumen del Release:" -ForegroundColor Cyan
    Write-Host "  🏷️  Tag: v$suggestedVersion" -ForegroundColor White
    Write-Host "  📦 Tipo: $releaseType ($releaseEmoji)" -ForegroundColor White
    Write-Host "  💬 Mensaje: $autoMessage" -ForegroundColor White
    Write-Host "  📊 Commits incluidos: $($commits.Count)" -ForegroundColor White
    
    Write-Host ""
    Write-Host "🌐 Próximos pasos:" -ForegroundColor Yellow
    Write-Host "  1. Ve a GitHub y crea el release oficial" -ForegroundColor White
    Write-Host "  2. Copia las notas desde RELEASE_TEMPLATE.md" -ForegroundColor White
    Write-Host "  3. Actualiza CHANGELOG.md si es necesario" -ForegroundColor White
    
    # Abrir automáticamente la página de releases si está disponible
    $repoUrl = "https://github.com/rodrigoangeloni/calculadora-de-estrategias-boxes/releases/new"
    Write-Host ""
    Write-Host "🔗 Abriendo página de releases..." -ForegroundColor Cyan
    Start-Process $repoUrl
    
} catch {
    Write-Error "❌ Error durante el release: $_"
    exit 1
}

Write-Host ""
Write-Host "🏁 ¡Auto-Release completado! Gracias por usar el sistema inteligente." -ForegroundColor Green

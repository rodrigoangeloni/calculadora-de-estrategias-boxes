# 🚀 Scripts de Release Automático

Este directorio contiene 3 scripts PowerShell para automatizar completamente el proceso de releases.

## 📁 Scripts Disponibles

### 🤖 `auto-release.ps1` - Release Inteligente (RECOMENDADO)
**Script más avanzado que analiza automáticamente tus cambios y sugiere la versión correcta.**

```powershell
# Modo interactivo - analiza y pregunta
.\auto-release.ps1

# Modo automático - sin preguntas
.\auto-release.ps1 -AutoConfirm

# Con mensaje personalizado
.\auto-release.ps1 -CustomMessage "Mi descripción específica"

# Forzar sin validaciones
.\auto-release.ps1 -Force
```

**✨ Características:**
- 🧠 **Análisis inteligente** de commits desde el último tag
- 🏷️ **Auto-detección** del tipo de release (PATCH/MINOR/MAJOR)
- 📝 **Mensajes automáticos** basados en el tipo de cambios
- ✅ **Validaciones** de estado del repositorio
- 🌐 **Apertura automática** de la página de GitHub releases

### ⚡ `quick-release.ps1` - Release Rápido
**Script súper rápido para releases sin ceremonias.**

```powershell
# Auto-detecta el tipo basado en commits recientes
.\quick-release.ps1

# Especificar tipo manualmente
.\quick-release.ps1 patch   # Bug fixes
.\quick-release.ps1 minor   # Nuevas features
.\quick-release.ps1 major   # Cambios breaking
```

**⚡ Características:**
- 💨 **Ultra-rápido** - mínima interacción
- 🎯 **Auto-detección** simple del tipo de release
- 📦 **Ejecución directa** del release

### 🔧 `release.ps1` - Release Manual
**Script original con control total manual.**

```powershell
.\release.ps1 -Version "1.0.2" -Message "Descripción del release"
```

**🎛️ Características:**
- 🎮 **Control total** sobre versión y mensaje
- 📋 **Parámetros obligatorios** - sin auto-detección
- ✅ **Validaciones** básicas

## 🧠 Detección Inteligente de Cambios

El `auto-release.ps1` analiza tus commits buscando estas palabras clave:

### 💥 **MAJOR** (cambios breaking)
- `BREAKING`, `breaking change`, `major:`, `!:`

### ✨ **MINOR** (nuevas features)
- `feat:`, `feature:`, `add:`, `new:`, `minor:`

### 🔧 **PATCH** (bug fixes)
- `fix:`, `bug:`, `patch:`, `hotfix:`, `correct:`

### 📚 **DOCUMENTACIÓN**
- `docs:`, `doc:`, `readme:`, `documentation:`

### ⚙️ **INFRAESTRUCTURA** 
- `chore:`, `build:`, `ci:`, `test:`, `refactor:`, `style:`

## 📋 Flujo Recomendado

### 🎯 **Para Desarrollo Diario (SÚPER RÁPIDO):**
```powershell
# 1. Haces tus commits normales con prefijos
git commit -m "feat: agregar nueva funcionalidad X"
git commit -m "fix: corregir bug en función Y"

# 2. Un solo comando para release automático
.\auto-release.ps1 -AutoConfirm
```

### 🔍 **Para Releases Importantes (CON REVISIÓN):**
```powershell
# 1. Analizar y revisar antes de confirmar
.\auto-release.ps1

# 2. El script muestra:
#    - Análisis de cambios
#    - Versión sugerida  
#    - Mensaje automático
#    - Opción de confirmar o personalizar
```

### ⚡ **Para Hotfixes Urgentes:**
```powershell
# Release inmediato tipo PATCH
.\quick-release.ps1 patch
```

## 🏷️ Convenciones de Semantic Versioning

Los scripts siguen automáticamente estas reglas:

- **X.Y.Z** (Ejemplo: 1.2.3)
- **MAJOR (X)**: Cambios incompatibles/breaking
- **MINOR (Y)**: Nuevas funcionalidades compatibles  
- **PATCH (Z)**: Correcciones de bugs compatibles

## ✅ Lo que Hacen TODOS los Scripts

Independientemente del script que uses, todos:

1. ✅ **Validan** el directorio correcto (`package.json`)
2. ✅ **Actualizan versión** en todos los archivos:
   - `package.json`
   - `calculadora.js` 
   - `calculadora.html`
   - `README.md`
3. ✅ **Hacen commit** con mensaje descriptivo
4. ✅ **Crean tag** de versión Git
5. ✅ **Suben** cambios y tag a GitHub
6. ✅ **Proporcionan** link para crear release oficial

## 🎯 Ejemplos Prácticos

### Escenario 1: Acabas de corregir algunos bugs
```powershell
# Commits recientes:
# - "fix: corregir error en validación"
# - "fix: mejorar manejo de errores"

.\auto-release.ps1
# 🤖 Detecta: PATCH release
# 📦 Sugiere: 1.0.1 → 1.0.2
# 💬 Mensaje: "🔧 Correcciones de bugs y mejoras menores"
```

### Escenario 2: Agregaste una nueva funcionalidad
```powershell
# Commits recientes:
# - "feat: agregar exportación PDF"
# - "feat: nuevo tema oscuro"

.\auto-release.ps1
# 🤖 Detecta: MINOR release  
# 📦 Sugiere: 1.0.2 → 1.1.0
# 💬 Mensaje: "✨ Nuevas funcionalidades y mejoras"
```

### Escenario 3: Cambios importantes en la API
```powershell
# Commits recientes:
# - "feat!: nueva API incompatible"
# - "BREAKING: cambiar estructura de datos"

.\auto-release.ps1
# 🤖 Detecta: MAJOR release
# 📦 Sugiere: 1.1.0 → 2.0.0  
# 💬 Mensaje: "💥 Actualización mayor con cambios importantes"
```

## 🚨 Troubleshooting

### ❌ "No se encontró package.json"
```powershell
# Asegúrate de estar en el directorio correcto
cd "c:\Users\profesor\Documents\Proyectos\calculadora"
```

### ❌ "No hay cambios desde el último release"
```powershell
# Haz algunos commits primero
git add .
git commit -m "feat: mi nueva funcionalidad"
```

### ❌ "Hay archivos sin commitear"  
```powershell
# El auto-release.ps1 te preguntará si quieres incluirlos
# O haz commit manual primero:
git add .
git commit -m "chore: preparar release"
```

## 💡 Tips Pro

1. **Usa prefijos en tus commits** para mejor auto-detección:
   ```
   feat: nueva funcionalidad
   fix: corrección de bug
   docs: actualizar documentación
   chore: tareas de mantenimiento
   ```

2. **Para máxima velocidad**, usa el modo AutoConfirm:
   ```powershell
   .\auto-release.ps1 -AutoConfirm
   ```

3. **Para hotfixes críticos**, quick-release es tu amigo:
   ```powershell
   .\quick-release.ps1 patch
   ```

4. **Siempre revisa** el link de GitHub que te proporcionan para completar el release oficial.

---

**🏁 ¡Con estos scripts, hacer releases es súper fácil y automático!**

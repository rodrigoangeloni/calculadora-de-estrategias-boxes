# 🚀 Guía de Desarrollo y Release - Calculadora de Estrategias SimRacing

## 📋 Checklist Completo para Actualizaciones

### 🔧 **Workflow de Desarrollo Diario**

#### 1. **Antes de Empezar a Programar**
```powershell
# Verificar estado del repositorio
git status

# Crear rama para nueva feature (opcional)
git checkout -b feature/nueva-funcionalidad

# Actualizar desde remoto
git pull origin main
```

#### 2. **Durante el Desarrollo**
- ✅ Realizar cambios en los archivos
- ✅ Probar la funcionalidad en el navegador
- ✅ Verificar que no hay errores en la consola
- ✅ Commits frecuentes con mensajes descriptivos:

```powershell
git add .
git commit -m "feat: agregar nueva funcionalidad X"
# o
git commit -m "fix: corregir error en función Y"
# o  
git commit -m "docs: actualizar documentación Z"
```

#### 3. **Antes de Hacer Push**
```powershell
# Verificar que todo funciona
# Abrir calculadora.html en el navegador y probar

# Push de la rama
git push origin feature/nueva-funcionalidad
# o si trabajas directo en main:
git push origin main
```

---

## 🏁 **Proceso de Release (Nuevas Versiones)**

### **Paso 1: Preparar el Release**

#### A. **Decidir el Tipo de Versión**
- **PATCH (1.0.1 → 1.0.2)**: Correcciones de bugs, mejoras menores
- **MINOR (1.0.2 → 1.1.0)**: Nuevas funcionalidades, compatibilidad mantenida  
- **MAJOR (1.1.0 → 2.0.0)**: Cambios grandes, posibles incompatibilidades

#### B. **Actualizar CHANGELOG.md**
```markdown
## [1.0.2] - 2025-05-28

### 🔧 Corregido
- Lista de bugs corregidos

### ✨ Agregado  
- Lista de nuevas funcionalidades

### 🚀 Mejorado
- Lista de mejoras

### 🗑️ Removido
- Lista de funcionalidades removidas (si aplica)
```

### **Paso 2: Ejecutar Script de Release**

```powershell
# Desde la raíz del proyecto (donde está package.json)
cd "c:\Users\profesor\Documents\Proyectos\calculadora"

# Ejecutar script automatizado
.\release.ps1 -Version "1.0.2" -Message "Descripción breve del release"

# Ejemplo real:
.\release.ps1 -Version "1.0.2" -Message "Mejoras en algoritmo de cálculo y corrección de bugs"
```

**El script automáticamente:**
- ✅ Actualiza la versión en `package.json`
- ✅ Actualiza la versión en `calculadora.js`  
- ✅ Actualiza la versión en `calculadora.html`
- ✅ Actualiza la versión en `README.md`
- ✅ Hace commit de todos los cambios
- ✅ Crea el tag de versión
- ✅ Sube todo a GitHub

### **Paso 3: Crear Release en GitHub** 

1. **Ir a GitHub:**
   ```
   https://github.com/rodrigoangeloni/calculadora-de-estrategias-boxes/releases
   ```

2. **Hacer clic en "Create a new release"**

3. **Configurar el Release:**
   - **Tag:** Seleccionar el tag recién creado (ej: `v1.0.2`)
   - **Title:** `🏁 Calculadora de Estrategias SimRacing v1.0.2`
   - **Description:** Copiar el contenido de `RELEASE_TEMPLATE.md` y adaptarlo

4. **Marcar como "Latest release"** ✅

5. **Hacer clic en "Publish release"** 🚀

---

## 🐛 **Workflow para Hotfixes Urgentes**

### **Para Correcciones Críticas:**

```powershell
# 1. Hacer los cambios necesarios
# 2. Commit rápido
git add .
git commit -m "hotfix: corregir error crítico en función X"

# 3. Release inmediato (versión PATCH)
.\release.ps1 -Version "1.0.3" -Message "Hotfix: corrección crítica"

# 4. Crear release en GitHub inmediatamente
```

---

## 📁 **Estructura de Archivos a Mantener**

### **Archivos que SIEMPRE deben estar actualizados:**

```
calculadora/
├── calculadora.html     # ← Versión en footer
├── calculadora.js       # ← Versión en header JSDoc  
├── package.json         # ← Versión principal del proyecto
├── README.md           # ← Versión en título y badges
├── CHANGELOG.md        # ← Historial de todas las versiones
├── LICENSE             # ← Copyright actualizado
├── RELEASE_TEMPLATE.md # ← Template para releases de GitHub
├── release.ps1         # ← Script de automatización
└── .gitignore          # ← Exclusiones de Git
```

### **Verificaciones Post-Release:**

- ✅ **GitHub:** Release visible y descargable
- ✅ **Badges:** Versión actualizada en README.md
- ✅ **Local:** Todo sincronizado con remoto
- ✅ **Funcionalidad:** Probar la versión nueva

```powershell
# Verificar sincronización
git status
git log --oneline -5
```

---

## 🎯 **Tips y Mejores Prácticas**

### **🔍 Antes de cada Release:**
- [ ] Probar todas las funcionalidades principales
- [ ] Verificar que no hay errores en consola del navegador  
- [ ] Revisar que todas las validaciones funcionan
- [ ] Comprobar compatibilidad en diferentes navegadores
- [ ] Actualizar ejemplos en README.md si es necesario

### **📝 Convenciones de Commit:**
- `feat:` Nueva funcionalidad
- `fix:` Corrección de bug
- `docs:` Cambios en documentación
- `style:` Cambios de formato (sin afectar lógica)
- `refactor:` Refactoring de código
- `test:` Agregar o modificar tests
- `chore:` Tareas de mantenimiento

### **🏷️ Convenciones de Tags:**
- Siempre usar `v` + número de versión: `v1.0.2`
- Seguir Semantic Versioning: `MAJOR.MINOR.PATCH`
- Tags anotados con mensaje descriptivo

### **📋 Template de Commit para Releases:**
```
Release v1.0.2 - [Descripción breve]

- Nuevas funcionalidades: X, Y, Z
- Correcciones: A, B, C  
- Mejoras: D, E, F

Closes #123, #124 (si hay issues relacionados)
```

---

## 🚨 **Troubleshooting Común**

### **❌ Error: "No se encontró package.json"**
```powershell
# Verificar directorio actual
pwd
# Navegar al directorio correcto
cd "c:\Users\profesor\Documents\Proyectos\calculadora"
```

### **❌ Error al hacer push del tag**
```powershell
# El tag ya existe, eliminarlo primero
git tag -d v1.0.2
git push origin --delete v1.0.2
# Crear nuevamente
git tag -a v1.0.2 -m "Release v1.0.2"
git push origin v1.0.2
```

### **❌ Conflictos de merge**
```powershell
# Resolver conflictos manualmente, luego:
git add .
git commit -m "resolve: conflictos de merge resueltos"
```

---

## 📞 **Referencias Rápidas**

### **🌐 Enlaces Importantes:**
- **Repositorio:** https://github.com/rodrigoangeloni/calculadora-de-estrategias-boxes
- **Releases:** https://github.com/rodrigoangeloni/calculadora-de-estrategias-boxes/releases  
- **Issues:** https://github.com/rodrigoangeloni/calculadora-de-estrategias-boxes/issues
- **Demo Live:** https://friendspartyserver.duckdns.org

### **⚡ Comandos de Emergencia:**
```powershell
# Estado rápido
git status && git log --oneline -3

# Reset suave (deshacer último commit pero mantener cambios)
git reset --soft HEAD~1

# Reset duro (PELIGRO: pierde cambios no comiteados)
git reset --hard HEAD~1

# Ver diferencias
git diff
```

---

**💡 Consejo:** Guarda este archivo como bookmark y consúltalo antes de cada actualización importante.

**🏁 Recuerda:** La consistencia en el proceso es clave para mantener un proyecto profesional.

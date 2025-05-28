# 📋 Changelog

Todos los cambios notables de este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
y este proyecto adhiere a [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2025-05-28

### ✨ Agregado
- **Sistema completo de auto-release inteligente** con detección automática de tipo de cambio
- Script `auto-release.ps1` para análisis inteligente de cambios y sugerencia de versión
- Script `quick-release.ps1` para releases rápidos con incremento automático
- Documentación especializada en `RELEASE_SCRIPTS_README.md`
- Detección automática de tipo de release basada en archivos modificados:
  - **PATCH**: Solo correcciones de bugs y documentación
  - **MINOR**: Nuevas funcionalidades y mejoras
  - **MAJOR**: Cambios en la estructura del proyecto
- Validación completa de formato Semantic Versioning
- Interfaz colorizada con emojis para mejor experiencia de usuario
- Sistema de confirmación interactivo antes de crear releases

### 🚀 Mejorado
- **Workflow de desarrollo completamente automatizado**
- Proceso de releases unificado con un solo comando
- Mejor detección de errores en el proceso de release
- Scripts más robustos con validación exhaustiva
- Documentación técnica mejorada para desarrolladores

### 📚 Documentación
- Guía completa de uso de scripts automatizados
- Actualización de `DEVELOPMENT_GUIDE.md` con workflows modernos
- Ejemplos prácticos para todos los tipos de releases
- Mejores prácticas para versionado automático y gestión de releases

### 🔧 Técnico
- Integración completa con Git para automatización de tags y pushes
- Sistema de backup automático antes de realizar cambios
- Validación de conectividad con repositorio remoto
- Manejo inteligente de conflictos de versiones existentes

## [1.0.1] - 2024-12-27

### 🔧 Corregido
- Corrección de caracteres mal codificados UTF-8 en `calculadora.js`
  - `Ã³` → `ó` (caracteres especiales en español)
  - `â†'` → `→` (flechas y símbolos)
- Validación de entrada mejorada para evitar errores de cálculo
- Eliminación de función `mostrarResultados()` no utilizada

### ✨ Agregado
- Función `guardarDatos()` para persistencia con localStorage
- Validación anti-duplicados en `guardarCompuestos()`
- Autoguardado automático al calcular estrategias
- Scroll suave a resultados después del cálculo
- Meta tags de versión en HTML
- Documentación completa en README.md con emojis temáticos
- Archivo `package.json` para gestión de proyecto
- Badge de versión y estado en README.md
- Actualización de autoría del proyecto

### 🚀 Mejorado
- Función `calcular()` con mejor manejo de errores
- Formato mejorado de resultados en pantalla
- Interfaz más responsive y moderna
- Mejor integración con el ecosistema Friends Party Server

### 📚 Documentación
- README.md completo con:
  - Guía de instalación y uso
  - Ejemplos prácticos de estrategias
  - Documentación técnica
  - Roadmap de features futuras
  - Información de la comunidad SimRacing
  - Links a recursos adicionales

## [1.0.0] - 2024-12-26

### ✨ Inicial
- Lanzamiento inicial de la Calculadora de Estrategias SimRacing
- Cálculo básico de combustible y neumáticos
- Interfaz web responsive con Tailwind CSS
- Integración con Friends Party Server SimRacing
- Soporte para múltiples compuestos de neumáticos
- Validación básica de entrada de datos

---

**🏁 Para más información sobre versiones futuras, visita nuestro [roadmap](README.md#-roadmap-futuras-funcionalidades) en el README.**

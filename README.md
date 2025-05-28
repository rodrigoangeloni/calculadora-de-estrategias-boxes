# 🏁 Calculadora de Estrategias SimRacing v1.0.1

**Parte oficial del ecosistema [Friends Party Server SimRacing](https://friendspartyserver.duckdns.org) 🎮**

[![Versión](https://img.shields.io/badge/versión-1.0.1-brightgreen.svg)](https://github.com/friendspartyserver/calculadora-estrategias)
[![Estado](https://img.shields.io/badge/estado-estable-success.svg)]()
[![Licencia](https://img.shields.io/badge/licencia-MIT-blue.svg)]()
[![Plataforma](https://img.shields.io/badge/plataforma-web-orange.svg)]()

Una herramienta web interactiva diseñada específicamente para la comunidad sudamericana de SimRacing, que te permite calcular estrategias óptimas de combustible y neumáticos para carreras de simuladores como Assetto Corsa.

> 🌟 **¡Forma parte de la mayor comunidad de SimRacing en Sudamérica!** Únete a nuestros servidores de Assetto Corsa y lleva tus carreras al siguiente nivel con estrategias profesionales.

## 🏆 Características Principales

### ⚡ Funcionalidades de Carrera
- 🛢️ **Cálculo de combustible**: Determina el combustible exacto necesario para completar cualquier carrera
- 🏎️ **Estrategia de neumáticos**: Optimiza la selección de compuestos para maximizar el rendimiento en pista
- 🔍 **Validación inteligente**: Sistema avanzado que detecta errores y configuraciones inválidas
- 💾 **Persistencia automática**: Guarda tus configuraciones favoritas para reutilizar en futuras carreras
- 📱 **Interfaz de piloto**: Diseño moderno y responsive optimizado para uso durante las carreras
- 📢 **Mensajes de pit**: Notificaciones claras que te guían como un ingeniero de carrera

### 🔧 Stack Tecnológico
- 🌐 **HTML5**: Estructura semántica optimizada para velocidad
- 🎨 **Tailwind CSS**: Diseño profesional que refleja la estética del SimRacing
- ⚙️ **JavaScript ES6+**: Algoritmos de cálculo precisos y interactividad fluida
- 💿 **LocalStorage**: Persistencia local sin necesidad de conexión

## 🏁 Guía del Piloto: Cómo Usar la Calculadora

### 1. 🏎️ Configuración de Carrera
```
⏱️ Duración de la carrera (minutos)
🔄 Tiempo promedio por vuelta (minutos) 
⛽ Consumo de combustible por vuelta (litros)
🏃‍♂️ ¿Hay vuelta extra? (Sí/No)
```

### 2. 🛞 Setup de Neumáticos
```
📊 Número de compuestos disponibles (1-4)
🔴 Tipo de cada compuesto (SS, S, M, H)
📈 Duración de cada compuesto (ej: SS=5, S=10, M=15, H=20 vueltas)
🚦 Compuesto inicial para salir de parrilla
```

### 3. 🔧 Estrategia de Pit-Stops
```
🏁 ¿Habrá paradas en boxes? (Sí/No)
🤖 La calculadora optimiza automáticamente tus paradas
```

### 4. 📊 Análisis de Resultados
Tu ingeniero virtual te proporciona:
- 🔢 **Total de vueltas** que completarás en carrera
- ⛽ **Combustible total** necesario para la victoria
- 🧠 **Estrategia óptima** con timing perfecto de paradas
- 📋 **Detalles de cada pit-stop** con combustible exacto por stint

## 🚀 Instalación y Puesta en Marcha

### 📋 Requisitos Mínimos
- 🌐 Navegador web moderno (Chrome, Firefox, Safari, Edge)
- 📶 Conexión a internet (solo para carga inicial)
- 🚫 No requiere instalación adicional ni registros

### 💻 Uso Local (Offline)
1. 📥 Descarga los archivos desde la web oficial:
   ```
   🌐 https://friendspartyserver.duckdns.org/calculadora.html
   ⚙️ calculadora.js
   📖 README.md
   ```

2. 🔓 Abre `calculadora.html` en tu navegador

3. 🏁 ¡Comienza a planificar estrategias ganadoras!

### 🌐 Uso Online (Recomendado)
1. 🌍 Visita [Friends Party Server SimRacing](https://friendspartyserver.duckdns.org)
2. 🎯 Navega a la sección "CALCULADORA"
3. 🏎️ ¡Empieza a calcular estrategias en tiempo real!

## 🏆 Casos de Uso Reales en SimRacing

### 🥇 Ejemplo 1: Sprint Race (30 minutos)
```
⏱️ Duración: 30 minutos
🔄 Tiempo por vuelta: 1.5 minutos (Monaco GP)
⛽ Consumo por vuelta: 2.5 litros
🛞 Compuestos: SS (5 vueltas), S (10 vueltas), M (15 vueltas)
```
**🎯 Resultado**: Estrategia sin paradas - Compuesto Medium para máxima consistencia

### 🏁 Ejemplo 2: Endurance Race (90 minutos)
```
⏱️ Duración: 90 minutos  
🔄 Tiempo por vuelta: 1.8 minutos (Silverstone)
⛽ Consumo por vuelta: 3.2 litros
🛞 Compuestos: SS (5 vueltas), S (10 vueltas), M (15 vueltas), H (20 vueltas)
```
**🎯 Resultado**: Estrategia de 2 paradas optimizadas - SS → M → H

### 🏎️ Ejemplo 3: Carrera SimRacing Clásica (67 vueltas)
```
🏁 Circuito: Monza (Assetto Corsa)
🔄 Tiempo por vuelta: 1:21.500
⛽ Consumo por vuelta: 2.8 litros
🛞 Compuestos disponibles: Soft (10 vueltas), Medium (15 vueltas), Hard (20 vueltas)
```
**🎯 Resultado**: Estrategia de 3 paradas - Soft → Medium → Hard → Medium

## ⚙️ Motor de Cálculo y Algoritmos

### 🧠 Algoritmo de Optimización Avanzado
```javascript
// 🏎️ El cerebro de la calculadora utiliza:
1. 📊 Cálcula vueltas totales basado en duración/tiempo de vuelta
2. 🔍 Evalúa todos los compuestos disponibles en el garage
3. 🎯 Encuentra la combinación que minimiza tiempo total de carrera
4. ⛽ Calcula combustible exacto necesario para cada stint
5. 📋 Genera estrategia detallada vuelta por vuelta como un ingeniero real
```

### 🛡️ Sistema de Validaciones Pro
- ✅ **Verificación de campos**: No más errores por datos faltantes
- ✅ **Validación numérica**: Solo acepta valores realistas de carrera  
- ✅ **Anti-duplicados**: Evita configuraciones erróneas de compuestos
- ✅ **Verificación de durabilidad**: Confirma que las duraciones sean viables
- ✅ **Análisis de viabilidad**: Verifica que la estrategia sea completable

### 💾 Persistencia Inteligente
```javascript
// 🔄 Sistema de guardado automático:
- 🏎️ Configuración completa de carrera
- 🛞 Setup personalizado de neumáticos  
- ⚙️ Preferencias del piloto
- 📊 Histórial de estrategias exitosas
```

## 🎮 Compatibilidad Total con Simuladores

### 🏁 Assetto Corsa / Assetto Corsa Competizione
- ⛽ Datos precisos de consumo por vuelta
- 🛞 Duraciones realistas basadas en telemetría
- 🏆 Estrategias probadas en carreras endurance
- 🌟 **Optimizado para servidores Friends Party Server**

### 🏎️ Juegos de Simulación (EA Sports / Codemasters)
- 🎯 Configuraciones de carrera personalizada
- 🔴🟡⚫ Compuestos oficiales de neumáticos
- 🏆 Estrategias de Gran Premio y Sprint Race
- 📈 Compatible con modos Carrera y Mi Equipo

### 🏁 Otros Simuladores Compatibles
- 🔵 **iRacing**: Carreras oficiales y leagues
- 🟢 **rFactor 2**: Endurance y Open Wheel  
- 🟡 **Project CARS 3**: Modo Carrera
- 🔴 **Automobilista 2**: Fórmula y Stock Car
- ⚫ **Gran Turismo 7**: Sport Mode y Custom Race

> 🌟 **Tip Pro**: Los datos más precisos vienen de telemetría real. ¡Haz varias vueltas de práctica para obtener tiempos y consumos exactos!

## 🌟 Características Avanzadas

### Mensajes Inteligentes
```javascript
// Tipos de notificaciones:
- Info: Información general y confirmaciones
- Warning: Advertencias y errores de validación
- Tip: Consejos y datos cargados automáticamente
```

### Interfaz Responsive
- ✅ Diseño adaptable a móviles y tablets
- ✅ Navegación táctil optimizada
- ✅ Scroll suave hacia resultados
- ✅ Iconografía intuitiva

### Experiencia de Usuario
- **Autoguardado**: Los datos se guardan automáticamente
- **Carga automática**: Restaura la última configuración
- **Validación en tiempo real**: Feedback inmediato
- **Scroll inteligente**: Navegación automática a resultados

## 🚨 Notas del Ingeniero de Carrera

### 📊 Precisión de Telemetría
> 🔥 **¡IMPORTANTE!**: Para estrategias ganadoras, usa datos reales de tu simulador. Cuantas más vueltas de práctica realices con diferentes configuraciones (combustible y neumáticos), más precisa será tu estrategia de carrera.

### ⚠️ Limitaciones del Sistema
- 🌤️ Los cálculos asumen condiciones ideales de pista seca
- 🚫 No considera factores externos como clima o incidentes de carrera
- ⏱️ Basado en tiempos promedio constantes (sin degradación de neumáticos)
- ⏱️ No incluye tiempo perdido en pit-stops (añade ~20-25 segundos por parada)
- 🏁 No considera estrategias de safety car o banderas amarillas

### 🎯 Tips para Máxima Precisión
- 🔄 Realiza al menos 10 vueltas consecutivas para promediar tiempos
- ⛽ Mide consumo real en condiciones de carrera (no práctica libre)
- 🛞 Testa degradación de neumáticos en stints largos
- 📊 Considera factores de tráfico en carreras online
- 🌡️ Ajusta para temperatura de pista y combustible

## 🚀 Roadmap de Desarrollo

### 🏆 Próximas Features V2.0
- [ ] 📉 **Factor de degradación**: Algoritmo avanzado de desgaste de neumáticos
- [ ] ⏱️ **Timing de pit-stops**: Cálculo real de tiempo perdido en boxes
- [ ] 🔄 **Comparador de estrategias**: Múltiples opciones lado a lado
- [ ] 📄 **Exportación PDF**: Lleva tu estrategia impresa al paddock
- [ ] 🌐 **API Integration**: Conexión directa con simuladores
- [ ] 🏁 **Base de datos de circuitos**: Configuraciones pre-cargadas
- [ ] 🌧️ **Análisis climático**: Estrategias para lluvia y mixto

### ⚙️ Mejoras Técnicas V3.0
- [ ] 📱 **PWA**: App instalable sin tienda
- [ ] 🔄 **Modo offline**: Funciona sin internet
- [ ] ☁️ **Sync en la nube**: Comparte estrategias entre dispositivos
- [ ] 🎨 **Temas personalizables**: UI adaptada a tu equipo favorito
- [ ] 🌍 **Multi-idioma**: Español, Português, English
- [ ] 📊 **Análisis avanzado**: Machine Learning para predicciones

## 📊 Estructura del Proyecto

```
calculadora/
├── calculadora.html    # Interfaz principal
├── calculadora.js      # Lógica de cálculo
└── README.md          # Documentación
```

### Archivos Principales

#### `calculadora.html`
- Estructura HTML5 semántica
- Formulario interactivo
- Sección de resultados
- Meta tags para SEO

#### `calculadora.js`
- Funciones de cálculo
- Validaciones
- Persistencia de datos
- Event listeners

## 🤝 Contribuye a la Comunidad

### 🏁 Cómo Ser Parte del Proyecto
1. 🍴 Fork del repositorio en GitHub
2. 🌿 Crea una rama para tu nueva feature
3. ⚙️ Implementa mejoras o correcciones de bugs
4. 📤 Envía un pull request con descripción detallada

### 🐛 Reportar Problemas
- 📊 Incluye datos específicos del simulador usado
- 🔄 Pasos exactos para reproducir el problema
- 📋 Configuración completa de la carrera problemática
- 🖼️ Screenshots de errores (si aplica)

### 💡 Sugerencias de Mejora
- 🏎️ Nuevas funcionalidades para estrategias
- 🎮 Soporte para simuladores adicionales
- 🌐 Mejoras de interfaz y experiencia
- 📈 Algoritmos más precisos de cálculo

## 🌐 Friends Party Server SimRacing

### 🏁 Nuestra Comunidad
- 🌍 **Web Oficial**: [friendspartyserver.duckdns.org](https://friendspartyserver.duckdns.org)
- 🎮 **Servidores**: Assetto Corsa premium en Sudamérica
- 🌎 **Región**: Argentina, Paraguay y toda Latinoamérica
- 👥 **Comunidad**: +1000 pilotos activos
- 📱 **Discord**: Liga oficial y eventos semanales

### 🏆 Servicios Disponibles
- 🏁 **Calculadora de Estrategias** (esta herramienta)
- 📊 **Servidores de Carrera**: 24/7 online
- 🎯 **Eventos Especiales**: Campeonatos y torneos
- 📋 **Reglamentos**: Normas profesionales de carrera
- 🌐 **Redes Sociales**: Conecta con otros pilotos

### ☕ Apoya el Proyecto
¿Te ayudó la calculadora a ganar carreras? 

🎁 **[Apoya al Server](https://www.buymeacoffee.com/friendspartyserver)**

Tu contribución nos ayuda a mantener los servidores activos y desarrollar nuevas herramientas para la comunidad de SimRacing sudamericana.

## 👨‍💻 Autor

**Rodrigo Angeloni** - *Desarrollador y entusiasta del SimRacing*

- 🏁 Creador de la Calculadora de Estrategias SimRacing
- 🎮 Miembro activo de Friends Party Server SimRacing
- 🌎 Apasionado por la comunidad de SimRacing sudamericana

## 📄 Licencia y Derechos

© 2025 **Rodrigo Angeloni**. Todos los derechos reservados.

---

### 🏁 ¡A por la victoria con estrategias profesionales!

🎮 *Desarrollado por **Rodrigo Angeloni** para la comunidad de SimRacing sudamericana*

🏆 *"En la pista, cada segundo cuenta. En los boxes, cada estrategia puede ser la diferencia entre el podio y el olvido."*

---

**🌟 ¿Listo para dominar la pista? ¡Únete a [Friends Party Server](https://friendspartyserver.duckdns.org) y lleva tu SimRacing al siguiente nivel!**

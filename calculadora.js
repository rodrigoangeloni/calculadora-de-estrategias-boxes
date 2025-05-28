// Duración de los compuestos de neumáticos (en vueltas)
let duracionNeumaticos = {};

// Mostrar mensaje temporal con estilos personalizados
function mostrarMensajeTemporal(mensaje, tipo = 'info') {
    const colores = {
        info: { background: '#d4edda', color: '#155724' }, // Éxito/Información
        warning: { background: '#fff3cd', color: '#856404' }, // Advertencia
        tip: { background: '#f8f9fa', color: '#000000' } // Consejo
    };

    const mensajeTemporal = document.createElement('div');
    mensajeTemporal.textContent = mensaje;
    mensajeTemporal.style.backgroundColor = colores[tipo].background;
    mensajeTemporal.style.color = colores[tipo].color;
    mensajeTemporal.style.padding = '10px';
    mensajeTemporal.style.borderRadius = '4px';
    mensajeTemporal.style.position = 'fixed';
    mensajeTemporal.style.top = '50%';
    mensajeTemporal.style.left = '50%';
    mensajeTemporal.style.transform = 'translate(-50%, -50%)';
    mensajeTemporal.style.zIndex = '1000';

    document.body.appendChild(mensajeTemporal);

    setTimeout(() => {
        mensajeTemporal.remove();
    }, 3000); // Tiempo de visualización en milisegundos
}

//Mensaje de bienvenida al cargar la página
window.onload = function() {
    mostrarMensajeTemporal("¡Bienvenido a la calculadora de estrategias! Ingresa tus datos de carrera para empezar.", 'info');
    cargarDatosGuardados();
};

// Función para cargar datos guardados del localStorage
function cargarDatosGuardados() {
    const datosGuardados = localStorage.getItem('calculadoraF1Datos');
    if (datosGuardados) {
        try {
            const datos = JSON.parse(datosGuardados);
            
            // Restaurar campos básicos
            if (datos.duracionCarrera) document.getElementById('duracionCarrera').value = datos.duracionCarrera;
            if (datos.tiempoVuelta) document.getElementById('tiempoVuelta').value = datos.tiempoVuelta;
            if (datos.consumoVuelta) document.getElementById('consumoVuelta').value = datos.consumoVuelta;
            if (datos.vueltaExtra) document.getElementById('vueltaExtra').value = datos.vueltaExtra;
            if (datos.paradasBoxes) document.getElementById('paradasBoxes').value = datos.paradasBoxes;
            
            mostrarMensajeTemporal("Datos anteriores cargados automáticamente", 'tip');
        } catch (e) {
            console.log('Error cargando datos guardados:', e);
        }
    }
}

// Función para guardar datos en localStorage
function guardarDatos() {
    const datos = {
        duracionCarrera: document.getElementById('duracionCarrera').value,
        tiempoVuelta: document.getElementById('tiempoVuelta').value,
        consumoVuelta: document.getElementById('consumoVuelta').value,
        vueltaExtra: document.getElementById('vueltaExtra').value,
        paradasBoxes: document.getElementById('paradasBoxes').value,
        compuestos: duracionNeumaticos
    };
    
    localStorage.setItem('calculadoraF1Datos', JSON.stringify(datos));
}

// Limpiar el formulario con un mensaje adicional
function limpiarFormulario() {
    document.getElementById('calculadoraForm').reset();
    document.getElementById('compuestosContainer').innerHTML = '';
    document.getElementById('resultados').style.display = 'none';
    document.getElementById('detallesParadas').innerHTML = '';
    document.getElementById('paradasContainer').style.display = 'none';
    
    //Mensaje de limpieza
    mostrarMensajeTemporal("Formulario limpiado correctamente. Ingresa nuevos datos para comenzar.", 'tip');
}

// Guardar compuestos y actualizar opciones de compuesto inicial
function guardarCompuestos() {
    const numCompuestos = parseInt(document.getElementById('numCompuestos').value);
    duracionNeumaticos = {};
    const compuestoInicialSelect = document.getElementById('compuestoInicial');
    compuestoInicialSelect.innerHTML = ''; // Limpiar opciones existentes

    let compuestosGuardados = []; // Array para guardar los compuestos
    let compuestosUsados = new Set(); // Set para evitar duplicados

    for (let i = 1; i <= numCompuestos; i++) {
        const tipo = document.getElementById(`tipoCompuesto${i}`).value;
        const duracion = parseInt(document.getElementById(`duracionCompuesto${i}`).value);
        
        // Validar que la duración sea válida
        if (isNaN(duracion) || duracion <= 0) {
            mostrarMensajeTemporal(`Error: Duración inválida para el compuesto ${i}`, 'warning');
            return;
        }
        
        // Verificar duplicados
        if (compuestosUsados.has(tipo)) {
            mostrarMensajeTemporal(`Error: El compuesto ${tipo} está duplicado`, 'warning');
            return;
        }
        
        compuestosUsados.add(tipo);
        duracionNeumaticos[tipo] = duracion;
        compuestosGuardados.push(tipo);

        // Agregar opción al select de compuesto inicial
        const option = document.createElement('option');
        option.value = tipo;
        option.textContent = `${tipo} (${duracion} vueltas)`;
        compuestoInicialSelect.appendChild(option);
    }

    mostrarMensajeTemporal("Compuestos guardados. Ahora puedes calcular la estrategia.", 'info');
}

// Calcular estrategia
function calcular() {
    // Validación de campos
    const duracionCarrera = parseFloat(document.getElementById('duracionCarrera').value);
    const tiempoVuelta = parseFloat(document.getElementById('tiempoVuelta').value);
    const consumoVuelta = parseFloat(document.getElementById('consumoVuelta').value);
    const vueltaExtra = parseInt(document.getElementById('vueltaExtra').value);
    const compuestoInicial = document.getElementById('compuestoInicial').value;
    const paradasBoxes = parseInt(document.getElementById('paradasBoxes').value);

    // Verificar campos obligatorios
    if (isNaN(duracionCarrera) || duracionCarrera <= 0) {
        mostrarMensajeTemporal("Por favor, ingrese una duración de carrera válida", 'warning');
        return;
    }
    if (isNaN(tiempoVuelta) || tiempoVuelta <= 0) {
        mostrarMensajeTemporal("Por favor, ingrese un tiempo por vuelta válido", 'warning');
        return;
    }
    if (isNaN(consumoVuelta) || consumoVuelta <= 0) {
        mostrarMensajeTemporal("Por favor, ingrese un consumo por vuelta válido", 'warning');
        return;
    }
    if (isNaN(vueltaExtra)) {
        mostrarMensajeTemporal("Por favor, seleccione si hay vuelta extra", 'warning');
        return;
    }
    if (!compuestoInicial) {
        mostrarMensajeTemporal("Por favor, seleccione un compuesto inicial", 'warning');
        return;
    }
    if (Object.keys(duracionNeumaticos).length === 0) {
        mostrarMensajeTemporal("Por favor, guarde los compuestos antes de calcular", 'warning');
        return;
    }    // Si todas las validaciones pasan, continuar con los cálculos
    const totalVueltas = Math.floor(duracionCarrera / tiempoVuelta) + vueltaExtra;
    const combustibleTotal = totalVueltas * consumoVuelta;
    const duracionInicial = duracionNeumaticos[compuestoInicial];

    // Guardar datos para la próxima sesión
    guardarDatos();

    let estrategiaSugerida = "";
    let detallesParadas = "";

    // Lógica para calcular la estrategia de paradas en boxes
    if (paradasBoxes === 1) {
        const compuestosDisponibles = Object.entries(duracionNeumaticos)
            .sort((a, b) => a[1] - b[1]); // Ordenar por duración ascendente (más rápidos primero)
        let vueltasRestantes = totalVueltas;
        let estrategia = [];
        let detalles = [];
        let vueltaActual = 0;

        // Calcular estrategia inicial con combustible óptimo
        const vueltasInicial = Math.min(duracionInicial, vueltasRestantes);
        const combustibleInicial = vueltasInicial * consumoVuelta;
        estrategia.push(`Inicio: ${compuestoInicial} (${vueltasInicial} vueltas)`);
        detalles.push(`Inicio:
            Combustible inicial: ${combustibleInicial.toFixed(1)}L para ${vueltasInicial} vueltas`);
        vueltasRestantes -= vueltasInicial;
        vueltaActual += vueltasInicial;

        let paradaNum = 1;
        while (vueltasRestantes > 0) {
            // Encontrar el mejor compuesto que se ajuste mejor a las vueltas restantes
            let mejorCompuesto = null;
            let mejorDuracion = 0;
            let vueltasOptimas = 0;
            let menorDiferencia = Infinity;

            // Evaluar cada compuesto para encontrar el que mejor se ajuste a las vueltas restantes
            for (const [compuesto, duracion] of compuestosDisponibles) {
                const diferencia = Math.abs(duracion - vueltasRestantes);
                
                // Si encontramos un compuesto que se ajusta mejor a las vueltas restantes
                if (diferencia < menorDiferencia) {
                    mejorCompuesto = compuesto;
                    mejorDuracion = duracion;
                    vueltasOptimas = Math.min(duracion, vueltasRestantes);
                    menorDiferencia = diferencia;
                }
            }

            if (mejorCompuesto) {
                // Calcular combustible exacto necesario para este stint
                const combustibleNecesario = vueltasOptimas * consumoVuelta;

                estrategia.push(`Parada ${paradaNum}: ${mejorCompuesto} (${vueltasOptimas} vueltas)`);
                detalles.push(`Parada ${paradaNum}:
                    Vuelta ${vueltaActual}
                    Cambio a ${mejorCompuesto}
                    Combustible: ${combustibleNecesario.toFixed(1)}L para ${vueltasOptimas} vueltas`);

                vueltasRestantes -= vueltasOptimas;
                vueltaActual += vueltasOptimas;
                paradaNum++;
            } else {
                estrategiaSugerida = "Error: No se puede completar la carrera con los compuestos disponibles.";
                break;
            }
        }

        if (vueltasRestantes === 0) {
            estrategiaSugerida = `Estrategia óptima (${paradaNum-1} paradas):\n${estrategia.join(" → ")}`;
            detallesParadas = detalles.join("\n");
            mostrarMensajeTemporal(`Estrategia calculada con ${paradaNum-1} paradas optimizando combustible`, 'info');
        }
    } else {
        // Si no se permiten paradas, verificar si es posible completar la carrera
        if (duracionInicial < totalVueltas) {
            estrategiaSugerida = `Advertencia: Se necesitan ${Math.ceil(totalVueltas/duracionInicial)} paradas mínimas para completar la carrera con el compuesto.`;
            mostrarMensajeTemporal("Se requieren paradas adicionales", 'warning');
        } else {
            estrategiaSugerida = `Estrategia sin paradas: ${compuestoInicial} para ${totalVueltas} vueltas`;
        }
    }    // Mostrar resultados con formato mejorado
    document.getElementById('totalVueltas').textContent = totalVueltas;
    document.getElementById('combustibleTotal').textContent = combustibleTotal.toFixed(2);
    document.getElementById('neumaticosIniciales').textContent = `Compuesto: ${compuestoInicial}, Duración: ${duracionInicial} vueltas`;
    document.getElementById('detallesParadasResultado').innerHTML = detallesParadas.replace(/\n/g, '<br>');
    document.getElementById('estrategiaSugerida').innerHTML = estrategiaSugerida.replace(/\n/g, '<br>');
    document.getElementById('resultados').style.display = 'block';
    
    // Scroll suave hacia los resultados
    document.getElementById('resultados').scrollIntoView({ behavior: 'smooth' });
}

// Event Listeners
document.getElementById('paradasBoxes').addEventListener('change', function() {
    const paradasContainer = document.getElementById('paradasContainer');
    paradasContainer.style.display = this.value === "1" ? 'block' : 'none';

    // Si se habilitan las paradas, ocultar el campo de número de paradas
    if (this.value === "1") {
        document.getElementById('numParadas').style.display = 'none';
    } else {
        document.getElementById('numParadas').style.display = 'block';
    }
});

document.getElementById('numCompuestos').addEventListener('input', function() {
    const numCompuestos = parseInt(this.value);
    const container = document.getElementById('compuestosContainer');
    container.innerHTML = '';

    // Limpiar el select de compuesto inicial
    const compuestoInicialSelect = document.getElementById('compuestoInicial');
    compuestoInicialSelect.innerHTML = '';

    for (let i = 1; i <= numCompuestos; i++) {
        container.innerHTML += `
            <div class="mb-4">
                <h3 class="text-xl mb-2">Compuesto ${i}</h3>
                <label for="tipoCompuesto${i}">Tipo:</label>
                <select id="tipoCompuesto${i}" class="w-full p-2 border rounded-md bg-gray-900" required>
                    <option value="SS">Super Soft</option>
                    <option value="S">Soft</option>
                    <option value="M">Medium</option>
                    <option value="H">Hard</option>
                </select>
                <label for="duracionCompuesto${i}">Duración (vueltas):</label>
                <input type="number" id="duracionCompuesto${i}" class="w-full p-2 border rounded-md bg-gray-900" required>
            </div>
        `;
    }

    // Agregar botón para guardar compuestos
    const guardarButton = document.createElement('button');
    guardarButton.textContent = 'Guardar Compuestos';
    guardarButton.type = 'button';
    guardarButton.className = 'bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded mt-4';
    guardarButton.addEventListener('click', guardarCompuestos);
    container.appendChild(guardarButton);
});

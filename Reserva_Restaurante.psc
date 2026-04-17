Algoritmo Reserva_Restaurante
	
	// Variables
	Definir personas, capacidadMesa Como Entero
	Definir mesa, turno Como Entero
	Definir fecha Como Cadena
	Definir disponible, capacidadValida Como Logico
	
	// Capacidad máxima por mesa
	capacidadMesa <- 8 
	
	// MOSTRAR MESAS DISPONIBLES
	MostrarMesas(1)
	
	// Entrada de datos
	Escribir "Ingrese numero de personas para hacer su reserva:"
	Leer personas
	
	Escribir "Ingrese numero de mesa que desea (1 al 15):"
	Leer mesa
	
	Escribir "Ingrese fecha en formato mm/dd/aaaa:"
	Leer fecha
	
	Escribir "Ingrese el turno para la reserva:"
	Escribir "1 para mañana"
	Escribir "2 para tarde"
	Escribir "3 para noche"
	Leer turno
	
	// Llamar módulos
	capacidadValida <- validarCapacidad(personas, capacidadMesa)
	disponible <- validarDisponibilidad(mesa, fecha, turno)
	
	// Decisión final
	Si capacidadValida Y disponible Entonces
		Escribir "Reserva exitosa"
	Sino
		Escribir "No se puede realizar la reserva"
	FinSi
	
FinAlgoritmo


// -------- MODULO PARA MOSTRAR MESAS --------
SubProceso MostrarMesas(1)
	
	Definir i Como Entero
	
	Escribir "==================================="
	Escribir "     MESAS DISPONIBLES DEL DIA"
	Escribir "==================================="
	
	Para i <- 1 Hasta 15 Con Paso 1 Hacer
		Escribir "Mesa #", i
	FinPara
	
	Escribir "==================================="
	
FinSubProceso


// -------- MODULO 1 --------
Funcion resultado <- validarCapacidad(personas, capacidadMesa)
	
	Definir resultado Como Logico
	
	Si personas <= capacidadMesa Entonces
		resultado <- Verdadero
	Sino
		resultado <- Falso
	FinSi
	
FinFuncion


// -------- MODULO 2 --------
Funcion resultado <- validarDisponibilidad(mesa, fecha, turno)
	
	Definir resultado Como Logico
	
	// Simulación:
	// Si la mesa 1 en turno noche está ocupada
	Si mesa = 1 Y turno = 3 Entonces
		resultado <- Falso
	Sino
		resultado <- Verdadero
	FinSi
	
FinFuncion

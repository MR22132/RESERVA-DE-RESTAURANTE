Algoritmo Reserva_Restaurante2
	
	// VARIABLES
	Definir opcion, mesa, personas, turno Como Entero
	Definir fecha, continuar Como Cadena
	Definir capacidadValida Como Logico
	Definir i Como Entero
	
	Dimension mesas[15]
	Definir mesas Como Logico
	
	// INICIALIZAR MESAS LIBRES
	Para i <- 1 Hasta 15 Hacer
		mesas[i] <- Verdadero
	FinPara
	
	Repetir
		
		Escribir "=================================="
		Escribir "   SISTEMA DE RESERVACIONES"
		Escribir "=================================="
		Escribir "1. Hacer reservacion"
		Escribir "2. Cancelar reservacion"
		Escribir "3. Ver estado de mesas"
		Escribir "4. Salir"
		Escribir "Seleccione una opcion:"
		Leer opcion
		
		Segun opcion Hacer
			
			1:
				MostrarMesas(mesas)
				
				Escribir "Ingrese numero de personas:"
				Leer personas
				
				Escribir "Ingrese numero de mesa (1-15):"
				Leer mesa
				
				Escribir "Ingrese fecha:"
				Leer fecha
				
				Escribir "Turno:"
				Escribir "1. Mañana"
				Escribir "2. Tarde"
				Escribir "3. Noche"
				Leer turno
				
				capacidadValida <- validarCapacidad(personas,8)
				
				Si capacidadValida Entonces
					Si mesas[mesa] = Verdadero Entonces
						mesas[mesa] <- Falso
						Escribir "Reservacion exitosa en mesa ", mesa
					Sino
						Escribir "La mesa ya esta ocupada."
					FinSi
				Sino
					Escribir "Capacidad excedida."
				FinSi
				
			2:
				MostrarMesas(mesas)
				
				Escribir "Ingrese numero de mesa a cancelar:"
				Leer mesa
				
				Si mesas[mesa] = Falso Entonces
					mesas[mesa] <- Verdadero
					Escribir "Reservacion cancelada."
				Sino
					Escribir "Esa mesa ya esta libre."
				FinSi
				
			3:
				MostrarMesas(mesas)
				
			4:
				Escribir "Gracias por usar el sistema."
				
			De Otro Modo:
				Escribir "Opcion invalida."
				
		FinSegun
		
	Hasta Que opcion = 4
	
FinAlgoritmo



// MODULO MOSTRAR MESAS
SubProceso MostrarMesas(mesas Por Referencia)
	
	Definir i Como Entero
	
	Escribir "========== ESTADO DE MESAS =========="
	
	Para i <- 1 Hasta 15 Hacer
		Si mesas[i] = Verdadero Entonces
			Escribir "Mesa ", i, ": Disponible"
		Sino
			Escribir "Mesa ", i, ": Ocupada"
		FinSi
	FinPara
	
	Escribir "====================================="
	
FinSubProceso



// MODULO VALIDAR CAPACIDAD
Funcion resultado <- validarCapacidad(personas, capacidadMesa)
	
	Definir resultado Como Logico
	
	Si personas <= capacidadMesa Entonces
		resultado <- Verdadero
	Sino
		resultado <- Falso
	FinSi
	
FinFuncion

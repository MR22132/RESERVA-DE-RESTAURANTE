Algoritmo Reserva_Restaurante_Final
    // 1. DECLARACION DE TODAS LAS VARIABLES AL INICIO
    Definir opcion, mesa_elegida, personas, turno_elegido Como Entero
    Definir fecha_elegida, cant_reservas, i, j Como Entero
    Definir disponible, encontrada Como Logico
    
    // 2. DIMENSIONES
    Dimension info_mesas[16, 2] 
    Dimension historial_reservas[101, 3] 
    
    // 3. INICIALIZACION
    cant_reservas <- 0
    // Llenamos datos de mesas: ID y Capacidad real
    Para i <- 1 Hasta 15 Hacer
        info_mesas[i, 1] <- i 
        Si i <= 5 Entonces 
            info_mesas[i, 2] <- 2
        Sino 
            Si i <= 10 Entonces 
                info_mesas[i, 2] <- 4
            Sino 
                info_mesas[i, 2] <- 8
            FinSi
        FinSi
    FinPara
    
    // 4. CICLO PRINCIPAL
    Repetir
        Escribir ""
        Escribir "=================================="
        Escribir "    SISTEMA DE RESERVACIONES"
        Escribir "=================================="
        Escribir "1. Hacer reservacion"
        Escribir "2. Ver historial de reservas"
        Escribir "3. Cancelar reservacion"
        Escribir "4. Salir"
        Escribir "Seleccione una opcion:"
        Leer opcion
        
        Segun opcion Hacer
			//Módulo de Reservación
            1:
                Escribir "Ingrese fecha (Ejemplo: 17042026 para 17 de abril del 2026):"
                Leer fecha_elegida
                Escribir "Turno: 1.Manana, 2.Tarde, 3.Noche"
                Leer turno_elegido
                Escribir "Cantidad de personas:"
                Leer personas
                
                Escribir "Mesas aptas (Capacidad suficiente):"
                Para i <- 1 Hasta 15 Hacer
                    Si info_mesas[i, 2] >= personas Entonces
                        Escribir "Mesa ", i, " (Capacidad: ", info_mesas[i,2], ")"
                    FinSi
                FinPara
                
                Escribir "Ingrese numero de mesa deseada:"
                Leer mesa_elegida
                
                // VALIDACIONES DE RESERVA
                Si mesa_elegida >= 1 Y mesa_elegida <= 15 Entonces
                    Si personas <= info_mesas[mesa_elegida, 2] Entonces
                        
                        disponible <- Verdadero
                        Si cant_reservas > 0 Entonces
                            Para i <- 1 Hasta cant_reservas Hacer
                                // Validar que NO coincidan Mesa, Fecha y Turno al mismo tiempo
                                Si historial_reservas[i,1] = mesa_elegida Y historial_reservas[i,2] = fecha_elegida Y historial_reservas[i,3] = turno_elegido Entonces
                                    disponible <- Falso
                                FinSi
                            FinPara
                        FinSi
                        
                        Si disponible Entonces
                            cant_reservas <- cant_reservas + 1
                            historial_reservas[cant_reservas, 1] <- mesa_elegida
                            historial_reservas[cant_reservas, 2] <- fecha_elegida
                            historial_reservas[cant_reservas, 3] <- turno_elegido
                            Escribir "Reserva confirmada con exito."
                        Sino
                            Escribir "La mesa ya esta ocupada en esa fecha y turno."
                        FinSi
                        
                    Sino
                        Escribir "La capacidad de la mesa es insuficiente."
                    FinSi
                Sino
                    Escribir "Numero de mesa no valido."
					Escribir "REALICE EL PROCESO DE NUEVO"
                FinSi
			//Módulo de Consulta
            2:
                Si cant_reservas = 0 Entonces
                    Escribir "No existen reservas registradas."
                Sino
                    Escribir "MESA | FECHA | TURNO"
                    Para i <- 1 Hasta cant_reservas Hacer
                        Escribir historial_reservas[i,1], "    | ", historial_reservas[i,2], "  | ", historial_reservas[i,3]
                    FinPara
                FinSi
			//Módulo de Cancelación
            3:
                Si cant_reservas = 0 Entonces
                    Escribir "No hay reservas para cancelar."
                Sino
                    Escribir "Datos de la reserva a cancelar:"
                    Escribir "Fecha:"
                    Leer fecha_elegida
                    Escribir "Mesa:"
                    Leer mesa_elegida
                    Escribir "Turno (1-3):"
                    Leer turno_elegido
                    
                    encontrada <- Falso
                    i <- 1
                    
                    Mientras i <= cant_reservas Y encontrada = Falso Hacer
                        Si historial_reservas[i,1] = mesa_elegida Y historial_reservas[i,2] = fecha_elegida Y historial_reservas[i,3] = turno_elegido Entonces
                            encontrada <- Verdadero
                            
                            // Logica de desplazamiento para "borrar" la reserva sin dejar huecos
                            Si i < cant_reservas Entonces
                                Para j <- i Hasta cant_reservas - 1 Hacer
                                    historial_reservas[j, 1] <- historial_reservas[j+1, 1]
                                    historial_reservas[j, 2] <- historial_reservas[j+1, 2]
                                    historial_reservas[j, 3] <- historial_reservas[j+1, 3]
                                FinPara
                            FinSi
                            
                            cant_reservas <- cant_reservas - 1
                            Escribir "Reserva cancelada correctamente."
                        Sino
                            i <- i + 1
                        FinSi
                    FinMientras
                    
                    Si encontrada = Falso Entonces
                        Escribir "No se encontro ninguna reserva con esos datos."
                    FinSi
                FinSi
        FinSegun
    Hasta Que opcion = 4
FinAlgoritmo
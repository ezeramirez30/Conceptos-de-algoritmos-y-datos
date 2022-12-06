{La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa
Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el docente
coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el nombre de la
escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La información se
ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar un programa que
lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse), e
informe:
● Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de escuelas por cada localidad.
● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
● Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.}

program ejer8;
type
    str20=string[20];
    docente = record
		dni:integer;
		nombre:str20;
		email:str20;
    end;
    proyecto = record
        cod:integer;
        titulo:str20;
        docenteCoor:docente;
        cantAlum:integer;
        escuela:str20;
        localidad:str20;
    end;

var
    p:proyecto;
begin

    leerProyecto(p);
    totalEscuelas:=0;
    
    while(p.cod<>-1) do begin
		localidadAct:=p.localidad;
		cantEscuelasLoc:=0;
		while (p.localidad=localidadAct) and (p.cod<>-1) do begin
			escuelaAct:=p.escuela;
			cantEscuelasLoc:=cantEscuelasLoc+1;
			cantAluxEsc:=0;
			while (p.escuela=escuelaAct) and (p.localidad=localidadAct) and (p.cod<>-1)  do begin
				cantAluxEsc:=cantAluxEsc+p.cantAlu;
				if(p.localidad='Daireaux' and cumpleCondicion(p.cod)) then write(p.titulo);
				leerProyecto(p);
			end;
			//termina una escuela
			calcularMaximoCantAlum(p.escuela,cantAluxEsc,maximos);
		end;
		//termino una localidad
		writeln(cantEscuelasLoc);
		totalEscuelas:=totalEscuelas+cantEscuelasLoc;
		
    end;
    //termina la lectura
    writeln(totalEscuelas);
    writeln('las dos escuelas con mayor cantidad de alumnos',maximos);
        
end.


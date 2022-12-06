Program ejercicio7;

Type
	string30 = string[30];
var
	nombre, puesto1, puesto2, puestoAnte, puestoUlti: string30;
	tiempo, tiempo1, tiempo2, tiempoAnte, tiempoUlti: real;
	cant: integer;
	
Begin
	tiempo1:=99999;
	tiempo2:=99999;
	tiempoAnte:= -999999;
	tiempoUlti:= -999999;
	cant:=0;
	puesto1:='';
	puestoUlti:='';
	Repeat
		Writeln('Ingrese el nombre del piloto');
		Readln(nombre);
		Writeln('Ingrese el tiempo en que finalizo la carrera');
		Readln(tiempo);
		if(tiempo<tiempo1) then begin
			tiempo2:=tiempo1;
			tiempo1:= tiempo;
			puesto2:=puesto1;
			puesto1:= nombre;
		end
		else if(tiempo<tiempo2) then begin
			tiempo2:= tiempo;
			puesto2:=nombre;
		end;
		if(tiempo>tiempoUlti) then begin
			tiempoAnte:= tiempoUlti;
			tiempoUlti:= tiempo;
			puestoAnte:= puestoUlti;
			puestoUlti:= nombre;
		end
		else if(tiempo>tiempoAnte) then begin
			tiempoAnte:=tiempo;
			puestoAnte:=nombre;
		end;
		cant:= cant+1;
	until(cant=100);
	Writeln('1er lugar: ',puesto1, '. 2do lugar: ',puesto2);
	Writeln('Anteultimo lugar: ',puestoAnte,'. Ultimo lugar: ',puestoUlti);
	
END.


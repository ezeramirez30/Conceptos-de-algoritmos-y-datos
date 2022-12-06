program Ejercicio2Complementario1;

type
	subrangoNotas = -1..10;
var
	legajo, i, cantNotasPresente, cantCumpleI, cantCumpleR, notasTotal: integer;
	condicion: char;
	nota: subrangoNotas;	
begin
	cantCumpleI:= 0;
	cantCumpleR:= 0;
	cantAlumnoI:=0;
	cantAlumnoR:=0;
	Writeln('Ingrese legajo');
	Readln(legajo);
	While(legajo<>-1) do begin
		Writeln('Ingrese la condicion del alumno');
		Readln(condicion);
		cantNotasPresente:=0;
		notasTotal:=0;
		for i:1 to 5 do begin
			Writeln('Ingrese la nota del alumno');
			Readln(nota);
			if(nota>4) then
				cantNotasPresentes:= cantNotasPresentes+1;
			if(nota<>-1) then begin
				notasTotal:= notasTotal+nota;
				cantNotasValidas:= cantNotasValidas+1;
			end;
			if(nota=10) then 
				cantNotas10:= cantNotas10+1;
		end;
		{calcular maximo con las notas = 10}
		
		if(condicion = 'I') and then begin
				cantAlumnoI:= cantAlumnoI+1;
				if(cantNotasBien>=4) then 
					cantCumpleI:=cantCumpleI+1;
			else begin
				cantAlumnoR:=cantAlumnoR+1;
				if(cantNotasBien>=4) then cantCumpleR:=cantCumpleR+1;
			end;
		if(cantNotasPresente=5) then 
			cantAlumnoApro:= cantAlumnoApro+1;
			
end.

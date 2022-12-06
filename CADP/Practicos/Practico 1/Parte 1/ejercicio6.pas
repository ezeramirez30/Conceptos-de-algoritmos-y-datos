program ejercicio6;

var
	legajo, alumnos, alumnosBien, alumnosDesta: integer;
	promedio: real;

begin
	alumnos:=0;
	alumnosBien:=0;
	alumnosDesta:=0;
	Writeln('Ingrese legajo del alumno');
	Readln(legajo);
	while (legajo<>-1) do begin
		Writeln('Ingrese promedio');
		Readln(promedio);
		alumnos:= alumnos+1;
		if(promedio>6.5) and (promedio<8.6) then
			alumnosBien:= alumnosBien+1;
		if(promedio>8.5) and (legajo<2500) then
			alumnosDesta:= alumnosDesta+1;
		Writeln('Ingrese legajo del alumno');
		Readln(legajo);
	end;
	
	Writeln('La cantidad de alumnos leida es: ',alumnos);
	Writeln('La cantidad de alumnos con promedio mayor a 6.5 son: ',alumnosBien);
	Writeln('La cantidad de alumnos con promedio mayor a 8.5 y con legajo menor a 2500 son: ',alumnosDesta);
	
end.

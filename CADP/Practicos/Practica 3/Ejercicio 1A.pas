program Ejercicio1;
type
	str20 = string[20];
	alumno = record
	codigo : integer;
	nombre : str20;
	promedio : real;
end;

procedure leer(var alu : alumno);
begin
	writeln('Ingrese el codigo del alumno');
	read(alu.codigo);
	if (alu.codigo <> 0) then begin
		Writeln('Ingrese el nombre del alumno'); read(alu.nombre);
		writeln('Ingrese el promedio del alumno'); read(alu.promedio);
	end;
end;
{ declaración de variables del programa principal }
var
	a : alumno;
	cant: integer;
{ cuerpo del programa principal }
begin
	cant:= 0;
	leer(a);
	cant:= cant+1;
	While (a.codigo <> 0) do begin
		leer(a);	
		cant:= cant+1;
	end;
	Writeln('La cantidad de alumnos leida es ', cant);
end.

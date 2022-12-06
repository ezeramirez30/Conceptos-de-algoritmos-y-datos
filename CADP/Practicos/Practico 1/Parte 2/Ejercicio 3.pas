Program Ejercicio3;


	
Type 
	cadena20 = string[20];
	rangoNota = 1..10;
	
var	
	nom: cadena20;
	nota: rangoNota;
	cantApr, cant7: integer;

begin
	cantApr:=0;
	cant7:=0;
	repeat
		Writeln('Ingrese el nombre del alumno');
		Readln(nom);
		Writeln('Ingrese la nota del alumno');
		Readln(nota);
		if(nota>= 8) then
			cantApr:=cantApr + 1;
		if(nota=7) then
			cant7:= cant7 + 1;
	until(nom= 'Zinedine Zidane');
	Writeln('La cantidad de alumnos aprobados son :',cantApr);
	Writeln('La cantidad de alumnos con nota 7 son :',cant7);
end.
	


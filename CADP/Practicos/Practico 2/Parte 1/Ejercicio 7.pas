program alcanceYFunciones;

var

	suma, cant : integer;

function calcularPromedio: real;
	var
		prom : real;
	begin
		if (cant = 0) then
		prom := -1
	else
		prom := suma / cant; 
		calcularPromedio:= prom; {a esta funcion le faltaba la asignacion para
								  que retorne algo}
end;

begin { programa principal }
	readln(suma);
	readln(cant);
	if (calcularPromedio <> -1) then begin
		cant := 0;
		writeln('El promedio es: ', calcularPromedio);
	end
	else
		writeln('Dividir por cero no parece ser una buena idea');
end.

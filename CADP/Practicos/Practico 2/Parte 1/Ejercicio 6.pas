Program ejercicio6;

procedure leerNumeros();
var
	num, numMax: integer;
begin
	num:=0;
	numMax:=0;
	While (num>=0) do begin
		Writeln('Ingrese un numero positivo (si desea salir, uno negativo');
		Readln(num);
		if(num>numMax) and (num mod 2 = 0) then
			numMax:= num;
	end;
	Writeln('El mayor numero ingresado es: ',numMax);
end;

begin
	leerNumeros;
end.

program Ejercicio1;

var
	num, suma, i: integer;

begin
	suma:=0;
	for i:=1 to 10 do begin
		Writeln('Ingrese un numero');
		Readln(num);
		suma:= num+suma;
	end;
	Writeln('La suma total es: ',suma);
end.

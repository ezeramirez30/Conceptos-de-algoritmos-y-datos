Program ejercicio2;

var
	num, mayor, i, orden: integer;

begin
	mayor:=0;
	for i:=0 to 10 do begin
		Writeln('Ingrese un numero');
		Readln(num);
		if(num>mayor) then
			mayor:=num;
			orden:=i;
			
	end;
	Writeln('El numero mayor leido es ',mayor);
	Writeln('En el orden ', orden);
end.

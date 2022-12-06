program ejercicio4;

var
	num1, doble: real;
begin

	Writeln('Ingrese un numero');
	Readln(num1);
	doble:= num1*2;
	while(num1<>doble) do begin
		Writeln('Ingrese un numero');
		Readln(num1);
	end;
		
end.

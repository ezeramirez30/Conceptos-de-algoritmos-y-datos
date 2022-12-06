program ejercicio6;
const
	pesos= 189.32;
var 
	dolares: integer;
	banco: real;
begin
	Writeln('Ingrese la cantidad de dolares');
	Readln(dolares);
	banco:= (dolares*pesos)*0.04;
	Writeln('La transaccion sera de ',((dolares*pesos)+banco):1:2);

end.

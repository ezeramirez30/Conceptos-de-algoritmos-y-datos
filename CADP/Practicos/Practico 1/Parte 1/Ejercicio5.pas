program ejercicio4;

var
	num1, num2, cont, doble: real;
begin
	cont:=0;
	Writeln('Ingrese un numero');
	Readln(num1);
	doble:= num1*2;
	while((num1<>doble) and (cont<10)) do begin
		Writeln('Ingrese un numero');
		Readln(num2);
		cont:=cont+1;
		if((cont=10) and (num2<>doble)) then
			Writeln('No se ha ingresado el doble de X');
	end;
	
		
end.

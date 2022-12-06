program ejercicio2;


var
	num1 : integer;
BEGIN
	Writeln('Ingrese un numero');
	Readln(num1);
	if(num1<0) then 
		Writeln('El valor absoluto de ',num1,' es ',num1*-1)
		else 
		Writeln('El valor absoluto de ',num1,' es ',num1);
END.


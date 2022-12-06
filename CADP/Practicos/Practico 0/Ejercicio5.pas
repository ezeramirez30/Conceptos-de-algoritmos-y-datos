program ejercicio5;

var x, y: integer;

BEGIN
	Writeln('Caramelos que posee el kiosquero');
	Readln(x);
	Writeln('Cantidad de clientes');
	Readln(y);
	Writeln('La cantidad de caramelos para cada cliente es: ',(x/y):1:2);
	Writeln('El kiosquero se queda con: ', x mod y);
	Writeln('El kiosquero debera cobrar a cada cliente: ', ((x/y)*1.60):1:2);	 
END.


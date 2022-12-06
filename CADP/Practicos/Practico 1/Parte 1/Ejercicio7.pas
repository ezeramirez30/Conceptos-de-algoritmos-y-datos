program ejercicio7;

var
	codigo: integer;
	precioActual, precioNuevo: real;

begin
	codigo:= 0;
	Writeln('Ingrese el codigo del producto');
	Readln(codigo);
	While codigo<> 32767 do begin
		
		Writeln('Ingrese el precio actual del producto');
		Readln(precioActual);
		Writeln('Ingrese el precio nuevo del producto');
		Readln(precioNuevo);
		precioActual:= precioActual+(precioActual*10)/100;
		if precioNuevo>precioActual then 
			Writeln('El aumento de precio del producto ',codigo, ' supera el 10%')
		else
			Writeln('El aumento de precio del producto ',codigo, ' no supera el 10%');
		Writeln('Ingrese el codigo del producto');
		Readln(codigo);
	end;
	Writeln('Ingrese el precio actual del producto');
		Readln(precioActual);
		Writeln('Ingrese el precio nuevo del producto');
		Readln(precioNuevo);
	if precioNuevo>precioActual then 
			Writeln('El aumento de precio del producto ',codigo, ' supera el 10%')
		else
			Writeln('El aumento de precio del producto ',codigo, ' no supera el 10%');

end. 


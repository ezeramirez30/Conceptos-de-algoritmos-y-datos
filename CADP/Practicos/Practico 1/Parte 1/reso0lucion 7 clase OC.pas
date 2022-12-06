program ejer;
var
codigo: integer;
precioActual, precioNuevo, porcentajeDiez:real;

BEGIN
	repeat
	   read(codigo);
	   read(precioActual);
	   read(precioNuevo);
	   porcentajeDiez := (10*precioActual)/100;
	   if (precioNuevo > precioActual+porcentajeDiez) then 
		  write('El precio del producto aumentó más de un 10 por ciento')
		  else
			write ('El precio del producto no aumentó más de un 10 por ciento');
	until(codigo=32767);
	 
END.

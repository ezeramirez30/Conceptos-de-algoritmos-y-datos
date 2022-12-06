program ejercicio4;

var diametro: integer;
	radio, area, perimetro: real;
begin
	Writeln('Ingrese el diametro del circulo');
	Readln(diametro);
	radio:= diametro/2;
	Writeln('El radio del circulo es: ',radio:1:2);
	area:= (radio*radio)*pi;
	Writeln('El area del circulo es: ',area:1:2);
	perimetro:= diametro*pi;
	Writeln('El perimetro del circulo es: ',perimetro:1:2);
end.

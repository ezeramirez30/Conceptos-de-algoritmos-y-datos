Program Ejercicio4;

Type
	cliente = record
		codigo: integer;
		cantLineas: integer;
	end;
	linea = record
		numero: integer;
		cantConsu: integer;
		mbConsu: integer;
	end;

procedure leerCliente(var c: cliente);
begin
	Writeln('Ingrese codigo de cliente');
	Readln(c.codigo);
	Writeln('Ingrese cantLineas');
	Readln(c.cantLineas);
end;

procedure calcularCantidades(lineas: integer; var li: linea; var min, mb: real);
var
	i: integer;
begin
	for i:= 1 to lineas do begin
		Writeln('Ingrese el numero de su linea');
		Readln(li.numero);
		Writeln('Ingrese la cantidad de minutos consumidos');
		Readln(li.cantConsu);
		Writeln('Ingrese la cantidad de megas consumidos');
		Readln(li.mbConsu);
		min:= li.cantConsu*3.40;
		mb:= li.mbConsu*1.35;
	end;
end;

var
	cli: cliente;
	li: linea;
	i: integer;
	cantMin: real;
	cantMb: real;

begin
	cantMin:=0;
	cantMb:= 0;
	leerCliente(cli);
	for i:= 1 to 9300 do begin
		calcularCantidades(cli.cantLineas, li, cantMin, cantMb);
		Writeln('El cliente debe abonar $', (cantMin+cantMb):1:2);
		leerCliente(cli);
	end;
end.

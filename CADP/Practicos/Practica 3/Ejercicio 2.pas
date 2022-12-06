program Ejercicio2;
Type
	casamiento = record
		dia : integer;
		mes : integer;
		anio : integer;
	end;

Procedure leerFecha (var ca: casamiento);

begin
	Writeln('Ingrese el dia');
	Readln(ca.dia);
	Writeln('Ingrese el mes en numero');
	Readln(ca.mes);
	Writeln('Ingrese el anio');
	Readln(ca.anio);
end;

var
	cas: casamiento;
	casVerano, casPrimerosDias: integer;
begin
	casVerano:=0;
	casPrimerosDias:=0;
	leerFecha(cas);
	While(cas.anio<>2020) do begin
		if(cas.mes>=1) or (cas.mes<=3) then
			casVerano:= casVerano+1;
		if(cas.dia<=10) then
			casPrimerosDias:= casPrimerosDias+1;
		leerFecha(cas);
	end;
	Writeln('La cantidad de casamientos celebrados en verano es: ',casVerano);
	Writeln('La cantidad de casamientos realizados en los primeros 10 dias del mes es: ',casPrimerosDias);
	Writeln(a);		
end.

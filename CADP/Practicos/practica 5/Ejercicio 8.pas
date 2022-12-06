program memoria;
type
	datos = array [1..20] of integer;
	punt = ^datos;

procedure procesarDatos(v : datos;     var v2 : datos);
var						{array= 20*4) {4 bytes ya que pasar por referencia es igual a un puntero= 4 bytes}
	i, j : integer; {4 bytes}
begin
	for i := 1 to 20 do
		v2[21 - i] := v[i]; {80 bytes (v)+ 4 bytes(v2)+ 4(i+j)+ 86(la mem que ya teniamos ocupada)= 132 bytes}
	end;

var
	vect : datos;{2*20= 40 bytes}
	pvect : punt;{4 bytes}
	i : integer;{2 bytes}
begin {46 bytes}
	for i:= 1 to 20 do begin
		vect[i] := i; {46 bytes}
		new(pvect); {se reserva el array en memoria dinamica}
	end;
	for i:= 20 downto 1 do begin
		pvect^[i] := 0; {46 de los que ya teniamos+ 40 del vector que reserve en mem dinamica= 86 bytes}
		procesarDatos(pvect^, vect);
	end;
	Writeln(sizeof(pvect));
	writeln(‘fin’);
end.

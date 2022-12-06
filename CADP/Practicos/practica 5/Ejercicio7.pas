Program ejercicio7;

Type
	cadena50= String[50];{51 bytes}
	vCiudades = array[1..2500] of cadena50;{51*2500=127500 bytes en memoria estatica} {a}
	Puntero = ^cadena50;{b}
	ArrPunteros	= array[1..2500] of Puntero;{4*2500= 10000 bytes}	{b}					

Procedure inicializarV(var v:ArrPunteros);
var
	i: integer;
begin
	for i:=1 to 2500 do begin
		new(v[i]); {le hago new a cada uno del puntero}
					{en memoria dinamica despues de todo el for voy a tener 51*2500= 127500}
	end;
end;		
var
	vec: vCiudades;{a}
	vPunt: arrPunteros; {b}

begin
	inicializarV(vPunt);
end.

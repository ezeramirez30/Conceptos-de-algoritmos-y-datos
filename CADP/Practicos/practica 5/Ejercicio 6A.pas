Program ejercicio6;

Const
	dimF = 999; 
	
Type
	Str20= String[19];
	fecha= record{6 bytes}
		dia: integer;
		mes: integer;
		anio: integer;
	end;
	persona= record{50 bytes}
		nombre: Str20; {20}
		apellido: Str20;{20}
		dni: integer;{2}
		nacimiento: fecha;{6 bytes}
		edad: integer {2 bytes}
	end;
	puntero=^persona;
	
	vectorPersona= array[1..dimF] of puntero; 
	
	
var
	vec: vectorPersona;{49950 bytes}
	i: integer;{2 bytes}
	nomMax, apeMax: Str20; {40 bytes}
	p: puntero;
Begin
	Writeln(sizeof(vec));
	
end.


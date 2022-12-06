Program Ejercicio7;

Const
	dimF= 2500;

Type 
	Nombre = String[50];
	Puntero = ^Nombre;
	ArrPunteros = array[1..2500] of Puntero;
	
	
Procedure reservar(var arrP: ArrPunteros);
Var
	i: integer;
Begin
	for i:=1 to dimF do begin
		new(arrP[i]);
	end;
end;

Procedure leerNombre(var arrP: ArrPunteros);
Var
	i: integer;
Begin
	For i:=1 to dimF do begin
		Writeln('Ingrese un nombre');
		Readln(arrP[i]^);
	end;
end;



Var
Punteros: ArrPunteros; {2500*4, por ser un array de punteros}

Begin
	reservar(Punteros);
	leerNombre(Punteros);
end.
	

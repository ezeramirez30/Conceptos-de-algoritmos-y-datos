program ejercicio7;

Type
	rango=0..9;
	vNumeros = array [rango] of integer;
	
Procedure inicializar (var v: vNumeros);
var
	i: integer;
Begin
	for i:=0 to 9 do
		v[i]:= 0;
end;

Procedure descomponer(var v: vNumeros; n: integer);
var
	dig: rango;
begin
	While (n<>0) do begin
		dig:= n mod 10; {dig= ultimo valor ingresado en num}
		v[dig]:= v[dig]+1; {v[dig]+1= sumo uno en la posicion del digito ingresado para decir que se ingreso ese digio}
		n:= n div 10;{pasa a los siguientes valores de mi digito, sacando el ultimo}
	end;
end;

Procedure cantOcurrencias(v: vNumeros);
var
	i: rango;
begin
	for i:=0 to 9 do 
		Writeln(i,' = ', v[i]); {Escribimos en cada iteracion del for, la cantidad de digitos del 0 al 9 que se ingreso}
		{escribimos que en la posicion i (digito), hay v[i] cantidad de digitos ingresados}
end;

Procedure digMax (v: vNumeros; var masLeido: integer);
var
	max: integer;
	i: rango;
Begin
	max:= -1;
	for i:= 0 to 9 do begin
		if(v[i]> max) then begin
			max:= v[i];{max= cant de digitos mas ingresados, por ej= el 1, se ingreso 9 vece, entonces max=9}
			masLeido:= i; {masLeido = digito mas leido}
		end;
	end;
end;

Procedure noOcurrencias(v: vNumeros);
var
	i: rango;
Begin
	for i:=0 to 9 do begin
		if(v[i] = 0) then
			Writeln(' ',i);
	end;
end;

var
	vNum: vNumeros;
	num, masLeido: integer;
begin
	Writeln('Ingrese un numero');
	Readln(num);
	inicializar(vNum);{inicializamos el vNum en 0}
	While(num<>-1) do begin {mientras num sea distinto de menos 1, itera}
		descomponer(vnum, num); {descompone el numero ingresado e incrementa la cantidad de digitos(dependiendo el digito) en mi array de numeros}
		Writeln('Ingrese un numero'); {ingreso otro numero}
		Readln(num);
	end;
	cantOcurrencias(vNum);
	digMax(vNum, masLeido);
	Writeln ('El digito mas leido fue: ',masLeido);
	Writeln ('Los digitos que no tuvieron ocurrencia son: ');
	noOcurrencias (vNum);
end.
	

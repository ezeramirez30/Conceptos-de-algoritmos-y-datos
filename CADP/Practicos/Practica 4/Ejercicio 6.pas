Program ejercicio6;

Const
	dimF = 4;

Type
	vector= array[1..dimF] of integer;

Procedure leerNum (var v: vector; var dL: integer);
var
	num: integer;
Begin
	Writeln('Ingrese un numero');
	Readln(num);
	While(num<>0) and (dL<=dimF) do begin
		dL:= dL+1;
		v[dL]:= num;
		Writeln('Ingrese un numero');
		Readln(num);
	end;
end;

procedure minYmax(v: vector; dimL: integer;var posMax: integer; var posMin: integer);
var
	i, min, max: integer;
begin
	min:=9999;
	max:=-1;
	for i:= 1 to dimL do begin
		if(v[dimL]>max) then begin	
			max:=v[i];
			posMax:=i;
		end;
		if(v[dimL]<min) then begin
			min:= v[i];
			posMin:= i;
		end;
	end;
end;


procedure intercambio(var v: vector; x, y: integer);
var
	inter: integer;
begin
	inter:= v[x];
	v[x]:= v[y];
	v[y]:= inter;
end;

Var
	dimL, pos, posMin: integer;
	vec: vector;
Begin
	dimL:=0;
	leerNum(vec, dimL);
	minYmax(vec, dimL, pos, posMin);
	intercambio(vec, pos, posMin);
	Writeln('El elemento maximo ',vec[posMin],' en la posicion ',pos, ' fue intercambiado con el elemento minimo ',vec[pos],' que se encontraba en la posicion ',posMin);
end.

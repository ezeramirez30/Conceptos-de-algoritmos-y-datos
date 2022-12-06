{A}
Function posicion(v: vector; x: integer): integer;
var
	esta: boolean;
	pos: integer;
Begin
	pos:= 1;
	While(esta = true) and (pos<=dimL) do begin
		if(v[pos] = x) then
			esta:= false
		else
			pos:=pos+1;
		end;
	if(seguir = false) then
		posicion:= pos;
	else
		posicion:=-1;
end;

{B}
Procedure intercambio(var v: vector; x, y: integer);
var
	inter: integer;
begin	
	inter:= v[x];
	v[x]:=v[y];
	v[y]:=inter;
end;

{C}
Function suma(v: vector; dimL: integer): integer;
var
	i, suma2: integer;
	
Begin
	for i:=1 to dimL do 
		suma2:=suma2+v[i];
	suma:=suma2;
end;

{d}
Function promedio(v: vector; dimL: integer): real;
var
	i, suma: integer;
Begin
	for i:=1 to dimL do 
		suma:= suma+v[i];
	promedio:=suma/dimL;
end;

{E}
function elemMax(v: vector; dimL: integer);
var
	max, pos: integer;
begin
	max:=-1;
	for i:=1 to dimL do begin
		if(v[i]>max) do begin
			max:=v[i]
			pos:= i;
	end;
	elemMax:=pos;
end;

{d}
function elemMin(v: vector; dimL: integer);
var
	min, pos: integer;
begin
	min:=9999;
	for i:=1 to dimL do begin
		if(v[i]<min) do begin
			min:=v[i]
			pos:= i;
	end;
	elemMax:=pos;
end;

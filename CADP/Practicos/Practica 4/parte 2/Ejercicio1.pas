Program Ejercicio1;

Const
	dimF= 500;
	
Type
	vector = array[1..dimF] of integer;
{a}	
Function encuentra(vec: vector; dimL: integer; n: integer): boolean;
Var
	encontro: boolean;
	pos: integer;
Begin
	encontro:= false;
	pos:= 1;
	While(pos<=dimL) and (encontro = false) then begin
		if(v[pos]=n) then
			encontro:= true
		else 
			pos:=pos+1;
	end;
	encuentra:= encontro;
end;

{b}
Function encuentra(vec: vector; dimL: integer; n: integer): boolean;
Var
	encontro: boolean;
	pos: integer;
Begin
	encontro:= false;
	pos:= 1;
	While(pos<=dimL) and (v[i]<n) then
		pos:= pos+1;
	if(v[i]=n) then
		encontro:= true
	else
		encontro:= false;
	encuentra:= encontro;
end;

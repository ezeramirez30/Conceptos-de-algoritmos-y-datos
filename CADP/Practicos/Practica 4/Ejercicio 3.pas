{a}
Procedure imprimirVector (v: vector; dimL: integer):
var 
	i: integer;
begin
	for i:= 1 to dimL do begin
		Writeln(v[i]);
		end;
end;

{b}
Procedure imiprimirUlt (v: vector; dimL: integer);
var
	i: integer;
Begin
	for i:=dimL downto 1 do begin
		Writeln(v[i]);
		end;
end;

{c}
Procedure imprimirMitad (v: vector; dimL: integer);
var
	mitad, i: integer;
begin
	mitad:= dimL div 2
	for i:= mitad downto 1 do begin
		Writeln(v[i]);
	end;
	mitad:= mitad+1;
	for i:= mitad dimL do begin
		Writeln(v[i]);
	end;
end;

{d}
procedure imprimirDAdelante (v: vector; y, x: integer; dimL: integer);
var
	i: integer;
begin
	if (x>y) then begin 
		for i:=y to x do
			Writeln(v[i]);
		end;
	end	
	else begin
		for i:=x to x do 
			Writeln(v[i]);
	end;	
end;

procedure imprimirDAtras(v: vector; y, x: integer; dimL: integer);
var
	i: integer;
Begin
	if(y>x) then begin
		for i:=y downto x 
			Writeln(v[i]);
	end
	else begin
		for i:=x downto y
			Writeln(v[i]);
	end;
end;

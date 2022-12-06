program alcance2;

var 
	a,b: integer; {variable local}
procedure uno;
	begin
		b := 3;
		writeln(b); {imprime 3}
	end;
	
begin
	a:= 1;
	b:= 2;
	uno;
	writeln(b, a); {imprime 3 1}
end.


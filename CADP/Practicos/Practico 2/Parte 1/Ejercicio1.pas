program Ejercicio1;

var
	a,b: integer; {variable global al programa, alcance: todo el programa}

procedure uno;
	var b: integer; {variable local al proceso, alcance: proceso}
	begin
		b:= 3;
		Writeln(b); {Imprime 3}
	end;

begin
	a:=1;
	b:=2;
	uno;
	Writeln(b, a); {imprime: 2 y 1}
end.


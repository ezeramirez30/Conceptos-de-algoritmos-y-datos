program punteros;
type
	cadena = string[50];
	puntero_cadena = ^cadena;
var
	pc: puntero_cadena;
begin
	new(pc);
	pc^:= 'un nuevo nombre';
	writeln(sizeof(pc^), ' bytes');{50+1= 51 bytes}
	writeln(pc^);{51 bytes}
	dispose(pc);
	pc^:= 'otro nuevo nombre';
end.


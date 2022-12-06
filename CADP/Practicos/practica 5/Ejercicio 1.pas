program punteros;
type
	cadena = string[50];
	puntero_cadena = ^cadena;
var
	pc: puntero_cadena; {4 bytes}
begin
	writeln(sizeof(pc), ' bytes');{4 bytes}
	new(pc);
	writeln(sizeof(pc), ' bytes'); {4 bytes}
	pc^:= 'un nuevo nombre';
	writeln(sizeof(pc), ' bytes');{4 bytes}
	writeln(sizeof(pc^), ' bytes');{51 bytes (string[50]+1)}
	pc^:= 'otro nuevo nombre distinto al anterior';
	writeln(sizeof(pc^), ' bytes'); {51 bytes}
end.

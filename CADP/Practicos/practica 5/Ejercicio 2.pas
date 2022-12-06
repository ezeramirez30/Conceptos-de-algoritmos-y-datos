program punteros;
type
	cadena = string[9];
	producto = record
		codigo: integer;
		descripcion: cadena;
		precio: real;
	end;
	puntero_producto = ^producto;
var
	p: puntero_producto; {4 bytes (puntero)}
	prod: producto;{cod = 2 bytes + descripcion = 10 bytes + precio = 4 bytes}
begin				{2+10+4= 16 bytes}
	writeln(sizeof(p), ' bytes');{4 bytes}
	writeln(sizeof(prod), ' bytes');{16 bytes}
	new(p);
	writeln(sizeof(p), ' bytes');{4 bytes}
	p^.codigo := 1;
	p^.descripcion := 'nuevo pro';
	writeln(sizeof(p^), ' bytes');
	p^.precio := 200;
	writeln(sizeof(p^), ' bytes');
	prod.codigo := 2;
	prod.descripcion := 'otro nuev';
	writeln(sizeof(prod), ' bytes');
end.


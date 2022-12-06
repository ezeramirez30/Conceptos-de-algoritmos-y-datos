program punteros;
type
	numeros = array[1..10000] of integer;
	puntero_numeros = ^numeros;
var
	n: puntero_numeros;{4 bytes}
	num: numeros; {20000 bytes}
	i:integer;
begin
	writeln(sizeof(n), ' bytes'); {4 bytes}
	writeln(sizeof(num), ' bytes');{20000 bytes}
	new(n);
	writeln(sizeof(n^), ' bytes');{20000 bytes}
	for i:= 1 to 5000 do
	n^[i]:= i;
	writeln(sizeof(n^), ' bytes');{20000 byutes}
end.


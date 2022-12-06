program JugamosConListas;
type
	lista = ^nodo;
	nodo = record
		num : integer;//dato que guarda la lista
		sig : lista;//referencia al siguiente nodo
	end;
procedure armarNodo(var L: lista; v: integer); // insertar adelante
var
	aux : lista; 
begin
	new(aux);
	aux^.num := v;
	aux^.sig := L;
	L := aux;
end;
//10,21,13,48,0
procedure imprimirLista(l:lista); // insertar adelante
var 
	
begin {48,13,21,10}
	while (l<>nil) do
		begin
			writeln(l^.num);
			l:=l^.sig;
		end;
end;

procedure actualizarLista(li:lista,valor:integer); 
// modifica contenido de la lista, se pasa la lista por valor 
var 
begin
	while (li<>nil) do
		begin
			li^.num:=li^.num+valor;
			li:=li^.sig;
		end;
end;
{-si el modulo modifica la estructura --> referencia (usar aux)
 -si el modulo modifica el contenido (los datos) --> valor (usar el parametro)}
var
	pri : lista;
	valor : integer;
begin
	pri := nil;
	writeln('Ingrese un numero');
	read(valor);
	while (valor <> 0) then begin
		armarNodo(pri, valor);
		writeln('Ingrese un numero');
		read(valor);
	end;
	imprimirLista(pri);
	actualizarLista(pri,5);
end.

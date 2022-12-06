program ejercicio2;
type
	lista = ^nodo;
	persona = record
		dni: integer;
		nombre: string;
		apellido: string;
	end;
	nodo = record
		dato: persona;
		sig: lista;
	end;
procedure leerPersona(var p: persona);{9}
begin
	read(p.dni);
	if (p.dni <> 0)then begin
		read(p.nombre);
		read(p.apellido);
	end;
end;
{Agrega un nodo a la lista}
procedure agregarAdelante(var l:lista;p:persona);{4}
var
	aux: lista;
begin
	new(aux);{5}
	aux^.dato:= p;
	aux^.sig:= l;
	l:= aux;
end;
{Carga la lista hasta que llega el dni 0}

procedure generarLista(var l:lista);
var
	//p:nodo;
	p:persona;{2}
begin
	leerPersona(p);
	while (p.dni <> 0) do begin
		agregarAdelante(l,p);
		leerPersona(p);{3}
	end;
end;

procedure imprimirInformacion(l:lista);{6}
begin
	while (l <> nil) do begin 
		writeln('DNI: ', l^.dato.dni, 'Nombre:',
				l^.dato.nombre{7}, 'Apellido:', l^.dato.apellido{8});
		l:= l^.sig;
	end;
end;
{Programa principal}
var
	l:lista;
begin
	l:=nil;{1}
	generarLista(l);
	imprimirInformacion(l);
end.


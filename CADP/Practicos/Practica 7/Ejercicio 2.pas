Program Ejercicio2;


Type
	Str30= String[30];
	rangoPol= 1..6;
	cliente=record
		codCli: integer;
		dni: integer;
		apellido: Str30;
		nombre: Str30;
		codPol: rangoPol;
		montoMen: real;
	end;
	
	lista=^nodo;
	nodo= record
		elem: cliente;
		sig: lista;
	end;
	
	vecTabla= array[rangoPol] of real;

Procedure leerCliente(var c: cliente);
Begin
	With c do begin
		Readln(codCli);
		Readln(dni);
		Readln(apellido);
		Readln(nombre);
		Readln(codPol);
		Readln(montoMen);
	end;
end;

	
Procedure agregarAtras(var L: lista; c: cliente);
Var	
	nue, ult: lista;
Begin
	new(nue);
	nue^.elem:= c;
	nue^.sig:= nil;
	if(L=nil) then
		L:=nue
	else
		ult^.sig:=nue;
	ult:=nue;
end;
	
Procedure cargarLista(var L: lista);
Var
	c: cliente;
Begin
	repeat
		leerCliente(c);
		agregarAtras(L, c);
	until(c.codCli=1122);
end;


Function dosDigitos(dni: integer): boolean;
Var
	dig, cantNueve: integer;
Begin
	cantNueve:=0;
	While(dni<>0) and (cantNueve<>2) do begin
		dig:= dni mod 10;
		If(dig=9) then
			cantNueve:=cantNueve+1;
		dni:= dni div 10;
	end;
	if(cantNueve=2) then
		dosDigitos:=true
	else
		dosDigitos:=false;
end;


Procedure recorrerLista(var L:lista; v: vecTabla);

Begin
	While(L<>nil) do begin
		Writeln('DNI: ',L^.elem.dni);
		Writeln('Nombre: ',L^.elem.nombre);
		Writeln('Apellido: ',L^.elem.apellido);
		Writeln('Monto a pagar: ',L^.elem.montoMen+v[L^.elem.codPol]);
		if(dosDigitos(L^.elem.dni)) then 
			Writeln(L^.elem.nombre,' ',L^.elem.apellido,' tiene dos 9 en su dni');
	end;
end;



Procedure eliminarElemento(var L: lista; codBorrar: integer);
Var
	act, ant: lista;
Begin
	act:=L;
	While(act<>nil) and (act^.elem.codCli<>codBorrar) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act<>nil) then begin
		if(act=L) then
			L:=L^.sig
		else
			ant^.sig:=act^.sig;
		dispose(act);
	end;
end;

Var
	L:lista;
	v: vecTabla;
	codBorrar: integer;
Begin
	cargarVector(v); {se dispone}
	cargarLista(L);
	recorrerLista(L,v);
	Writeln('Ingrese el codigo de cliente que desea borrar');
	Readln(codBorrar);
	eliminarElemento(L,codBorrar);
end.
	
	


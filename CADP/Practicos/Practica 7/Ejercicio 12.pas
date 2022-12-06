Program ejercicio12;
Const
	dimF=4;
Type
	rangoTipoSus=1..dimF;
	vecTabla=array[rangoTipoSus] of real;
	Str30=String[30];
	cliente=record
		nombre: Str30;
		dni: integer;
		edad: integer;
		tipoSus: rangoTipoSus;
	end;
	
	lista=^nodo;
	nodo= record
		elem: cliente;
		sig: lista;
	end;
	
	vecSus=array[rangoTipoSus] of integer;
	
	mayores=record
		nombre: Str30;
		dni: integer;
	end;
	lista2=^nodo2;
	nodo2= record
		elem: mayores;
		sig: lista;
	end;
	
Procedure leerCliente(var c: cliente);
Begin
	With c do begin
		readln(nombre);
		Readln(dni);
		if(dni<>0) then begin
			Readln(edad);
			Readln(tipoSus);
		end;
	end;
end;

Procedure agregarAtras(var L: lista; var ult: lista; c: cliente);
Var
	nue: lista;
Begin
	new(nue);
	nue^.elem:=c;
	nue^.sig:=nil;
	if(L=nil) then
		L:=nue
	else
		ult^.sig:=nue;
	ult:=nue;
end;

Procedure cargarLista(var L: lista);
Var
	ult: lista;
	c: cliente;
Begin
	leerCliente(c);
	While(c.dni<>0) do begin
		agregarAtras(L, ult, c);
		leerCliente(c);
	end;
end;

Procedure inicializarVec(var vS: vecSus);
var
	i: integer;
Begin
	for i:=1 to dimF do 
		vS[i]:=0;
end;

Procedure insertarOrdenado(nom: Str30; dni: integer; var L2: lista2);
Var
	nue, ant, act: lista2;
Begin
	new(nue);
	nue^.elem.nombre:=nom;
	nue^.elem.dni:=dni;
	ant:=L2;
	act:=L2;
	While(act<>nil) and (dni<act^.elem.dni) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act=ant) then
		L:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

Procedure masClientes(vS: vecSus; var suscMax, suscMax2: integer);
Var
	comp, comp2,i: integer;
Begin
	comp:=0;
	comp2:=0;
	for i:=1 to dimF do begin	
		if(vS[i]>comp) then begin
			comp2:=comp;
			comp:=vS[i];
			suscMax2:=suscMax;
			suscMax:=i;
		end
		else if(vS[i]>comp2) then begin
			comp2:=vS[i];
			suscMax2:=i;
		end;
	end;
end;

Procedure recorrerLista(L: lista; vT: vecTabla; var vS: vecSus; var L2: lista2);
var
	montoTotal:real;
	suscMax, suscMax2: integer;
Begin
	suscMax:=-1;
	suscMax2:=-1;
	montoTotal:=0;
	While(L<> nil) do begin
		montoTotal:=montoTotal+v[L^.elem.tipoSus];
		vS[L^.elem.tipoSus]:=vS[L^.elem.tipoSus]+1;
		if(L^.elem.edad>40) and (L^.elem.tipoSus>=3) then
			insertarOrdenado(L^.elem.nombre, L^.elem.dni, L2);
		L:=L^.sig;
	end;
	Writeln(montoTotal);
	masClientes(vS, suscMax, suscMax2);
	Writeln(suscMax, suscMax2);
end;

Var
	L: lista;
	L2: lista2;
	vS: vecSus;
	vT: vecTabla;
Begin
	L:=nil;
	L2:=nil;
	cargarTabla(vT);
	cargarLista(L);
	recorrerLista(L, vT, vS, L2);
end.

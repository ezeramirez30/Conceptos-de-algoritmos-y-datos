Program ejercicio1;
Const
	dimF=5;
Type
	rangoGenero= 1..5;
	Str30= String[30];
	persona= record
		dni: integer;
		apeYNom: Str30;
		edad: integer;
		codGenero: rangoGenero
	end;
	
	lista=^nodo;
	nodo= record
		elem: persona;
		sig: lista;
	end;
	
	vecGenero= array[rangoGenero] of integer;

Procedure leerPersona(var p: persona);
Begin
	with p do begin
		readln(p.dni);
		Readln(p.apeYNom);
		Readln(p.edad);
		Readln(p.codGenero);
	end;
end;

Procedure cargarLista(var L:lista; var ult: lista; p: persona);
Var
	nue: lista;
Begin
	new(nue);
	nue^.elem:=p;
	nue^.sig:=nil;
	if(L=nil) then
		L:=nue
	else
		ult^.sig:=nue;
	ult :=nue;
end;
	
Procedure cargarPersona(var L: lista);
var
	p: persona;
	ult: lista;
Begin
	leerPersona(p);
	Repeat
		cargarLista(L, ult, p);
		leerPersona(p);
	until(p.dni=33555444);
end;

Function digitosPares(dni: integer): integer;
Var
	pares, impares, dig: integer;
Begin
	pares:=0;
	impares:=0;
	While(dni<>0) do begin
		dig:=dni mod 10;
		if(dig mod 2=0) then
			pares:= pares + 1
		else
			impares:= impares + 1;
		dni:=dni div 10
	end;
	if(pares>impares) then
		digitosPares:=1
	else
		digitosPares:=0;
end;	

Procedure recorrerLista(L: lista; var vC: vecGenero);
Var
	cantPersonas, codMax, codMax2, i: integer;
Begin
	cantPersonas:=0;
	codMax:=0;
	codMax2:=0;
	While(L<>nil) do begin
		cantPersonas:= cantPersonas + digitosPares(L^.elem.dni);
		vC[L^.elem.codGenero]:= vC[L^.elem.codGenero]+1;
		L:=L^.sig;
	end;
	for i:=1 to dimF do begin
		if(vC[i]>codMax) then begin
			codMax2:=codMax;
			codMax:=i;
		end
		else if(vC[i]>codMax2) then
			codMax2:=i;
	end;
	Writeln(cantPersonas);
	Writeln(codMax, codMax2);
end;

Procedure borrarElemento(var L: lista; dniBorrar: integer; var ok: boolean);
var
	ant, act: lista;
Begin
	act:=L;
	while(act<>nil) and (act^.elem.dni<>dniBorrar) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act<>nil) then begin
		if(act=L) then 
			L:=L^.sig
		else
			ant^.sig:=act^.sig;
		dispose(act);
		ok:=true;
	end
	else
		ok:=false;
end;


Var
	L:lista;
	ok: boolean;
	vC: vecGenero;
	dniBorrar: integer;
Begin
	ok:=false;
	L:=nil;
	cargarPersona(L);
	recorrerLista(L, vC);
	Readln(dniBorrar);
	borrarElemento(L, dniBorrar, ok);
	if (ok) then
		Writeln('El dni ha sido eliminado')
	else
		Writeln('El dni no pertenece a una persona de la lista');
end.
			
		

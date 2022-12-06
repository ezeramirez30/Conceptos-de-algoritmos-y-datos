Program Ejercicio7;
Const
	dimF= 24;
Type
	Str30= String[30];
	rangoMate=1..dimF;
	vecNotas= array[rangoMate] of integer;
	alumno= record
		numero: integer;
		apellido: Str30;
		nombres: Str30;
		dirCorreo: Str30;
		anioIng: integer;
		anioEgr: integer;
		notas: vecNotas;
	end;
	
	lista=^nodo;
	nodo= record
		elem: alumno;
		sig: lista;
	end;
	
	masRapido= record
		ape: Str30;
		nom: Str30;
		dir: Str30;
	end;
	
	vecMasRapido= array[1..2] of masRapido;
Procedure leerNotas(var v: vecNotas);
Var
	i: integer;
Begin
	For i:=1 to dimF do 
		Readln(v[i]);
end;
	
Procedure leerAlumno(var a: alumno);
Begin
	With a do begin
		Readln(numero);
		if(numero<>-1) then begin
			Readln(apellido);
			Readln(nombres);
			Readln(dirCorreo);
			Readln(anioIng);
			Readln(anioEgr);
			leerNotas(notas);
		end;
	end;
end;

Procedure agregarAtras(var L: lista; a: alumno; var ult: lista);
Var
	nue: lista;
Begin
	new(nue);
	nue^.elem:=a;
	nue^.sig:=nil;
	if(L=nil) then
		L:=nue
	else
		ult^.sig:=nue;
	ult:=nue;
end;
	
	
Procedure cargarLista(var L: lista);
Var
	a: alumno;
	ult: lista;
Begin
	leerAlumno(a);
	While(a.numero<>-1) do begin
		agregarAtras(L,a, ult);
		leerAlumno(a);
	end;
end;

Function prom(v: vecNotas): real;
Var
	cantNotas, i: integer;
Begin
	cantNotas:=0;
	for i:=1 to dimF do begin
		cantNotas:= cantNotas+ v[i]
	end;
	prom:=cantNotas/24;
end;

Function esImpar(n: integer): boolean;
Var
	dig, cantImp, cantDig: integer;
Begin
	dig:=0;
	cantImp:=0;
	cantDig:=0;
	While(n<>0) do begin
		dig:=n mod 10;
		cantDig:=cantDig+1;
		if(dig mod 2 = 1) then
			cantImp:=cantImp+1;
		n:= n div 10;
	end;
	if(cantImp=cantDig) then
		esImpar:=true
	else
		esImpar:=false;
end;

Procedure calcuRecibida(L: lista; var compMenos, compMenos2: integer; var v: vecMasRapido);
Var
	anios: integer;
Begin
	anios:= L^.elem.anioEgr-L^.elem.anioIng;
	if(anios<compMenos) then begin
		compMenos2:=compMenos;
		compMenos:=anios;
		v[1].ape:=L^.elem.apellido;
		v[1].nom:=L^.elem.nombres;
		v[1].dir:=L^.elem.dirCorreo;
	end
	else if(anios<compMenos2) then begin
		compMenos2:=anios;
		v[2].ape:=L^.elem.apellido;
		v[2].nom:=L^.elem.nombres;
		v[2].dir:=L^.elem.dirCorreo;
	end;
end;

Procedure recorrerLista(L: lista; var v: vecMasRapido);
Var
	cantAlu, compMenos, compMenos2, i: integer;
	promedio: real;
Begin
	cantAlu:=0;
	compMenos:=99;
	compMenos2:=99;
	While(L<>nil) do begin
		promedio:=prom(L^.elem.notas);
		Writeln(promedio);
		If(L^.elem.anioIng=2012) and (esImpar(L^.elem.numero)) then
			cantAlu:=cantAlu+1;
		calcuRecibida(L, compMenos, compMenos2, v);
		L:=L^.sig;
	end;
	Writeln(cantAlu);
	For i:=1 to 2 do begin 
		Writeln(v[i].ape);
		Writeln(v[i].nom);
		Writeln(v[i].dir);
	end;
end;

Procedure eliminar(var L:lista; numBorrar: integer);
Var
	ant, act: lista;
Begin
	act:=L;
	While(act<>NIL) and (numBorrar<>act^.elem.numero) do begin
		ant:=act;
		act:=act^.sig
	end;
	if(act<>nil) then begin
		if(act=nil) then
			L:=L^.sig
		else
			ant^.sig:=act^.sig;
		dispose(act);
	end;
end;

Var
	L: lista;
	v: vecMasRapido;
	numBorrar: integer;

Begin
	L:=nil;
	cargarLista(L);
	recorrerLista(L,v);
	Writeln('Ingrese el numero que desea borrar');
	Readln(numBorrar);
	eliminar(L, numBorrar);
end.

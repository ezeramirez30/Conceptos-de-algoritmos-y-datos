Program Ejercicio6;

Const
	dimF= 7;
Type
	Str30= String[30];
	rangoCat=1..dimF;
	vecCate= array[rangoCat] of integer;
	objeto= record
		codObj: integer;
		catObj: rangoCat;
		nomObj: Str30;
		distancia: integer;
		nomDes: Str30;
		anioDes: integer;
	end;
	
	lista=^nodo;
	nodo= record
		elem: objeto;
		sig: lista;
	end;
	
Procedure leerObjeto(var o: objeto);
Begin
	With o do begin
		Readln(codObj);
		Readln(catObj);
		Readln(nomObj);
		Readln(distancia);
		Readln(nomDes);
		Readln(anioDes);
	end;
end;

Procedure insertarOrdenado(var L: lista; o: objeto; var ult: lista);
Var
	nue: lista;
Begin
	new(nue);
	nue^.elem:=o;
	nue^.sig:=nil;
	if(L=nil) then
		L:=nue
	else
		ult^.sig:=nue;
	ult:=nue;
end;
	
Procedure cargarLista(var L: lista);
Var
	o: objeto;
	ult: lista;
Begin
	leerObjeto(o);
	While(o.codObj<>-1) do begin
		insertarOrdenado(L, o, ult);
		leerObjeto(o);
	end;
end;

Procedure inicializarVec(var v: vecCate);
Var
	i: integer;
Begin
	for i:=1 to dimF do begin
		v[i]:=0;
	end;
end;

Procedure masLejano(L: lista; var codMax, codMax2, distMax, distMax2: integer);
Begin
	if(L^.elem.distancia>distMax) then begin
		distMax2:=distMax;
		distMax:=L^.elem.distancia;
		codMax2:=codMax;
		codMax:=L^.elem.codObj;
	end
	else if(L^.elem.distancia>distMax2) then begin
		distMax2:=L^.elem.distancia;
		codMax2:=L^.elem.codObj;
	end;
end;

Function esMasPar(cod: integer): boolean;
Var
	cantPar, cantImp, dig: integer;
Begin
	cantPar:=0;
	cantImp:=0;
	While(cod<>0) do begin
		dig:=cod mod 10;
		if(dig mod 2 = 0) then
			cantPar:=cantPar+1
		else
			cantImp:=cantImp+1;
		cod:= cod div 10;
	end;
	If(cantPar>cantImp) then
		esMasPar:=true
	else
		esMasPar:=false;
end;

Procedure recorrerLista(L: lista; var v: vecCate);
Var
	codMax, codMax2, distMax, distMax2, cantGalileo, i: integer;
Begin
	codMax:=-1;
	distMax:=-1;
	cantGalileo:=0;
	While(L<>nil) do begin
		masLejano(L, codMax, codMax2, distMax, distMax2);
		if(L^.elem.nomDes='Galileo Galilei') and (L^.elem.anioDes<1600) then
			cantGalileo:=cantGalileo+1;
		v[L^.elem.catObj]:=v[L^.elem.catObj]+1;
		if(esMasPar(L^.elem.codObj)) and (L^.elem.catObj=1) then
			Writeln(L^.elem.nomObj);
		L:=L^.sig;
	end;
	Writeln(codMax, codMax2);
	For i:=1 to dimF do begin
		Writeln(v[i]);
	end;
end;

Var
	L: lista;
	v: vecCate;
Begin
	L:=nil;
	cargarLista(L);
	inicializarVec(v);
	recorrerLista(L,v);
end.
		
	
	

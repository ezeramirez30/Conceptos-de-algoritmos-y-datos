Program ejercicio14;
Const
	dimF=31;
Type
	rangoDia=1..dimF;
	prestamo= record
		numero: integer;
		isbn: integer;
		nroSocio: integer;
		diaPrestamo: rangoDia;
	end;
	
	lista=^nodo;
	nodo=record
		elem: prestamo;
		sig: lista;
	end;
	
	nueva= record
		isbn: integer;
		cantPrestado: integer;
	end;
	
	lista2=^nodo2;
	nodo2=record
		elem: nueva;
		sig: lista2;
	end;
	
	vecDias=array[rangoDia] of integer;
	
Procedure leerPrestamo(var p: prestamo);
Begin
	With p do begin
		Readln(numero);
		Readln(isbn);
		if(isbn<>-1) then begin
			Readln(nroSocio);
			Readln(diaPrestamo);
		end;
	end;
end;

Procedure insertarOrdenado(var L:lista; p: prestamo);
Var
	ant, act: lista;
	nue: lista;
Begin
	new(nue);
	nue^.elem:=p;
	act:=L;
	ant:= L;
	While(act<>nil) and (p.isbn<act^.elem.isbn) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act=ant) then 
		L:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

Procedure cargarLista(var L: lista);
Var
	p: prestamo;
Begin
	leerPrestamo(p);
	While(p.isbn<>-1) do begin
		insertarOrdenado(L, p);
		leerPrestamo(p);
	end;
end;

Procedure inicializarVec(var v: vecDias);
Var
	i: integer;
Begin
	for i:=1 to dimF do 
		v[i]:=0;
end;

Procedure insertarOrde(isbn: integer; vPrestado: integer; var L2: lista2);
Var
	ant, act: lista2;
	nue: lista2;
Begin
	new(nue);
	nue^.elem.isbn:=isbn;
	nue^.elem.cantPrestado:=vPrestado;
	act:=L2;
	ant:=L2;
	While(act<>nil) and (isbn<act^.elem.isbn) do begin
		ant:=act;
		act:=ant;
	end;
	if(act=ant) then
		L2:=nue
	else	
		ant^.sig:=nue;
	nue^.sig:=act;
end;

function menosPrestamos(v: vecDias): integer;
Var
	diaMax, i: integer;
Begin
	diaMax:=0;
	for i:=1 to dimF do begin
		if(v[i]>diaMax) then begin
			diaMax:=v[i];
			menosPrestamos:=i;
		end;
	end;
end;

Procedure recorrerLista(L: lista; var L2: lista2; var v: vecDias);
Var
	isbnAct, vecesPrestado, cantPrestamos, nroImp, nroPar, menPrestamos: integer;
Begin
	nroImp:=0;
	nroPar:=0;
	cantPrestamos:=0;
	While(L<>nil) do begin
		isbnAct:=L^.elem.isbn;
		vecesPrestado:=0;
		While(L<>nil) and (isbnAct=L^.elem.isbn) do begin
			vecesPrestado:=vecesPrestado+1;
			v[L^.elem.diaPrestamo]:=v[L^.elem.diaPrestamo]+1;
			cantPrestamos:=cantPrestamos+1;
			if(L^.elem.numero mod 2=0) then
				nroPar:=nroPar+1
			else 
				nroImp:=nroImp+1;
			L:=L^.sig;
		end;
		insertarOrde(isbnAct, vecesPrestado, L2);
	end;
	menPrestamos:= menosPrestamos(v);
	Writeln(menPrestamos);
	Writeln((nroImp/cantPrestamos)*100:2:1);
	Writeln((nroPar/cantPrestamos)*100:2:1);
end;
	
Var
	L:lista;
	L2: lista2;
	v: vecDias;
Begin
	L:=nil;
	L2:=nil;
	cargarLista(L);
	inicializarVec(v);
	recorrerLista(L, L2, v);
END.



Program Ejercicio5;

Type
	Str30= String[30];
	productos= record
		codigo: integer;
		descri: Str30;
		stockAct: integer;
		stockMin: integer;
		precio: real;
	end;
	
	lista=^nodo;
	nodo= record
		sig: lista;
		elem: productos;
	end;

Procedure leerProd(var p: productos);
Begin
	with p do begin
		Readln(codigo);
		Readln(descri);
		Readln(stockAct);
		Readln(stockMin);
		Readln(precio);
	end;
end;

Procedure agregarLista(var L: lista; p: productos);
Var
	nue: lista;
Begin
	new(nue);
	nue^.elem:=p;
	nue^.sig:=L;
	L:=nue;
end;

Procedure cargarLista(var L: lista);
Var
	p: productos;
Begin
	leerProd(p);
	While(p.codigo<>-1) do begin
		agregarLista(L,p);
		leerProd(p);
	end;
end;

Procedure menosStock(var cantDeb: integer; stAct, stMin: integer);
Begin
	if(stAct<stMin) then
		cantDeb:=cantDeb+1;
end;

Function tresDig(L: lista): boolean;
Var
	dig, num, contPar: integer;
Begin
	num:=L^.elem.codigo;
	dig:=0;
	contPar:=0;
	While(num<>0) and (contPar<3) do begin
		dig:= num mod 10;
		if(dig mod 2 = 0) then 
			contPar:=contPar+1;
		num:= num div 10;
	end;
	if(contPar=3) then
		tresDig:= true
	else
		tresDig:= false;
	
end;

Procedure masEco(preAct: real; codAct: integer; var preUno, preDos: real; var cod1, cod2: integer);
Begin
	if(preAct<preUno) then begin
		preDos:= preUno;
		preUno:=preAct;
		cod2:=cod1;
		cod1:= codAct;
	end
	else if(preAct<preDos) then begin
		preDos:=preAct;
		cod2:=codAct;
	end;
end;

Procedure recorrer(L: lista);
Var
	cantDeb, cantTotal, cod1, cod2: integer;
	preUno, preDos: real;
Begin
	cantDeb:=0; cantTotal:=0; preUno:=9999; preDos:=9999;
	While(L<>nil) do begin
		cantTotal:=cantTotal+1;
		menosStock(cantDeb, L^.elem.stockAct, L^.elem.stockMin);
		if(tresDig(L)) then
			Writeln(L^.elem.descri);
		masEco(L^.elem.precio, L^.elem.codigo, preUno, preDos, cod1, cod2);
		L:=L^.sig;
	end;
	Writeln((cantDeb/cantTotal)*100:2:1);
	Writeln(cod1, cod2);
end;

Var
	L: lista;
	
Begin
	cargarLista(L);
	recorrer(L);
end.

Program Ejercicio10;
Const
	dimF= 20;
Type
	Str30= String[30];
	rangoCultivos=1..dimF;
	culti=record
		nombre: Str30;
		cantHect: integer;
		cantMeses: integer;
	end;
	vecCultivos= array[rangoCultivos] of culti;
	
	empresa= record
		codigo: integer;
		nombre: Str30;
		tipo: Str30;
		ciudad: Str30;
		cultivos: vecCultivos;
		dimL: integer;
	end;
	
	lista=^nodo;
	nodo= record
		elem: empresa;
		sig: lista;
	end;
	
Procedure leerCultivo(var c: culti);
Begin
	With c do begin
		Readln(cantHect);
		if(cantHect<>0) then begin
			Readln(nombre);
			Readln(cantMeses);
		end;
	end;
end;
	
Procedure ingresarCultivo(var v: vecCultivos; var dimL: integer);
Begin
	dimL:=1;
	leerCultivo(v[dimL]);
	While(dimL<dimF) and (v[dimL].cantHect<>0) do begin
		dimL:=dimL+1;
		leerCultivo(v[dimL]);
	end;
end;

Procedure leerEmpresa(var e: empresa);
Begin
	with e do begin
		Readln(codigo);
		if(codigo<>-1) then begin
			Readln(nombre);
			Readln(tipo);
			Readln(ciudad);
			ingresarCultivo(cultivos, dimL);
		end;
	end;
end;

Procedure agregarAtras(var L: lista; e: empresa; var ult: lista);
Var
	nue: lista;
Begin
	new(nue);
	nue^.elem:=e;
	nue^.sig:=nil;
	if(L=nil) then
		L:=nue
	else
		ult^.sig:=nue;
	ult:=nue;
end;
			
	
Procedure cargarLista(var L: lista);
Var
	e: empresa;
	ult: lista;
Begin
	leerEmpresa(e);
	While(e.codigo<>-1) do begin
		agregarAtras(L, e, ult);
		leerEmpresa(e);
	end;
end;
	
Function poseeDosCeros(c: integer): boolean;
Var
	dig, cantCeros: integer;
Begin
	cantCeros:=0;
	While(c<>0) do begin
		dig:= c mod 10;
		if(dig=0) then
			cantCeros:= cantCeros+1;
		c:= c div 10;
	end;
	If(cantCeros>=2) then 
		poseeDosCeros:=true
	else
		poseeDosCeros:= false;
end;

Procedure masTiempo(nombre: Str30; var nomMax: Str30; var tiempoMax: integer; tiempoAct: integer);
Begin
	if(tiempoAct>tiempoMax) then begin
		tiempoMax:=tiempoAct;
		nomMax:=nombre;
	end;
end;

Procedure recorrerLista(L: lista);
Var
	cantHectSoja, totalHect, tiempoMax, tiempoAct, i: integer;
	nomMax: Str30;
	trigo: boolean;
Begin
	cantHectSoja:=0;
	totalHect:=0;
	tiempoMax:=0;
	While(L<>nil) do begin
		For i:=1 to L^.elem.dimL do begin
			if(L^.elem.cultivos[i].nombre='Trigo') and (L^.elem.nombre='San Miguel del Monte') and (poseeDosCeros(L^.elem.codigo)) then 
				trigo:=true;
			If(L^.elem.cultivos[i].nombre='soja') then
				cantHectSoja:=cantHectSoja+L^.elem.cultivos[i].cantHect;
			if(L^.elem.cultivos[i].nombre='maiz') then
				tiempoAct:=L^.elem.cultivos[i].cantMeses;
			totalHect:=totalHect+L^.elem.cultivos[i].cantHect;
		end;
		if(trigo) then
			Writeln(L^.elem.nombre);
		Writeln(cantHectSoja,(cantHectSoja/totalHect)*100:2:1);
		masTiempo(L^.elem.nombre, nomMax, tiempoMax, tiempoAct);
		L:=L^.sig;
	end;
	Writeln(nomMax);
end;

Procedure incrementar(var L: lista);
Var
	i: integer;
Begin
	While(L<> nil) do begin
		for i:=1 to L^.elem.dimL do begin
			if(L^.elem.cultivos[i].nombre='Girasol') and (L^.elem.tipo='Estatal') then
				L^.elem.cultivos[i].cantMeses:=L^.elem.cultivos[i].cantMeses+1;
		end;
		L:=L^.sig;
	end;
end;

Var
	L:lista;
Begin
	L:=nil;
	cargarLista(L);
	recorrerLista(L);
	incrementar(L);
end.
		

	
	

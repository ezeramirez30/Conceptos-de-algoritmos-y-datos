Program ejercicio3;

Type
	Str30= string[30];
	viaje=record
		numero: integer;
		codAuto: integer;
		dirOrigen: Str30;
		dirDestino: Str30;
		kilometros: integer;
	end;
	
	lista=^nodo;
	nodo= record
		elem: viaje;
		sig: lista;
	end;
	
	lista2=^nodo;
	nodo2=record
		elem:viaje;
		sig: lista2;
	end;
	
	
Procedure agregarOrdenado(via: viaje; var L2: lista2);
Var
	ant, act, nue: lista2;
Begin
	new(nue);
	nue^.elem:=via;
	act:=L2;
	ant:=L2;
	While(act<>nil) and (via.numero<act^.elem.numero) do begin
		ant:=act;
		act:= act^.sig;
	end;
	if(act=ant) then
		L2:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

Procedure masRecorrieron (codAct: integer; var codMax, codMax2, kmMax, kmMax2: integer; cantKm: integer);
Begin
	if(cantKm>kmMax) then begin
		kmMax2:=kmMax;
		kmMax:=cantKm;
		codMax2:=codMax;
		codMax:=codAct;
	end
	else if(cantKm>kmMax2) then begin
		kmMax2:=cantKm;
		codMax2:=codAct;
	end;
end;

Procedure recorrerLista(L: lista;var L2: lista2);
Var
	codMax, codMax2, kmMax, kmMax2, codAct, cantKm: integer;
Begin
	kmMax:=0;
	kmMax:=0;
	codMax:=0;
	codMax2:=0;
	cantKm:=0;
	While(L<>nil) do begin
		codAct:=L^.elem.codAuto;
		While(L<>nil) and (L^.elem.codAuto=codAct) do begin
			cantKm:=cantKm+L^.elem.kilometros;
			if(L^.elem.kilometros>5) then
				agregarOrdenado(L^.elem, L2);
			L:=L^.sig;
		end;
		masRecorrieron(codAct, codMax, codMax2, kmMax, kmMax2, cantKm);
	end;
	Writeln('Los autos que mas km recorrieron son: ',codMax, ' y ', codMax2);
end;

Var
	L: lista;
	L2: lista2;
Begin
	cargarLista(L);
	recorrerLista(L, L2);
end.
	

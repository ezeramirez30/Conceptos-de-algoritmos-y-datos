Program Ejercicio8;
Const
	dimF= 7;
Type
	rangoMoti=1..dimF;
	vecMotivos=array[rangoMoti] of integer;
	transfe= record
		numOrigen: integer;
		dniOrigen: integer;
		numDestino: integer;
		dniDestino: integer;
		mes: integer;
		monto: real;
		codMotivo: rangoMoti;
	end;
	lista=^nodo;
	nodo= record
		elem: transfe;
		sig: lista;
	end;
	
	lista2=^nodo2;
	nodo2= record
		elem: transfe;
		sig: lista;
	end;

Procedure insertarOrdenado(t: transfe; var L2: lista2);
Var
	ant, act, nue: lista2;
Begin
	new(nue);
	nue^.elem:=t;
	act:=L2;
	ant:=L2;
	While(act<>nil) and (t.numOrigen<act^.elem.numOrigen) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(ant=act) then
		L2:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

Procedure generarEst(L: lista; var L2: lista2);
Begin
	While(L<>nil) do begin
		if(L^.elem.numOrigen<>L^.elem.numDestino) then
			insertarOrdenado(L^.elem, L2);
	end;
end;

Procedure inicializarVec(var v: vecMotivos);
Var
	i: integer;
Begin
	for i:=1 to dimF do begin
		v[i]:=0;
	end;
end;

Function menosPares(n: integer): boolean;
Var
	dig, contPar, contImp: integer;
Begin
	contPar:=0;
	contImp:=0;
	While(n<>0) do begin
		dig:= n mod 10;
		if(dig mod 2 = 0) then
			contPar:= contPar+1
		else
			contImp:=contImp+1;
		n:=n div 10;
	end;
	if(contPar<contImp) then
		menosPares:=true
	else
		menosPares:=false;
end;

Procedure masTuvo(v: vecMotivos; var codMax: integer);
Var
	i, cantAct: integer;
Begin
	cantAct:=0;
	for i:=1 to dimF do begin
		if(v[i]>cantAct) then
			codMax:=i;
	end;
end;


Procedure recorrerLista(L2: lista2; var v: vecMotivos);
Var
	codMax, transJunio, codAct: integer;
	montoTotal: real;
Begin
	transJunio:=0;
	montoTotal:=0;
	While(L2<>nil) do begin
		codAct:=L2^.elem.codOrigen;
		While(L2<>nil) do begin
			montoTotal:=montoTotal+L2^.elem.monto;
			v[L2^.elem.codMotivo]:=v[L2^.elem.codMotivo]+1;
			if(L2^.elem.mes=5) and (menosPares(L2^.elem.numDestino)) then
				transJunio:=transJunio+1;
			L2:=L2^.sig;
		end;
		Writeln(montoTotal);
	end;
	masTuvo(v, codMax);
	Writeln(codMax);
end;

Var
	L: lista;
	L2: lista2;
	v: vecMotivos;
Begin
	L2:=nil;
	L:=nil;
	cargarLista(L);
	generarEst(L, L2);
	inicializarVec(v);
	recorrerLista(L2, v);
end.


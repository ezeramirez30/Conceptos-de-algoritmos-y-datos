Program Ejercicio3;

Const
	dimF= 200;
	
	
Type
	dias= 1..31;
	marzo= record
		dia: dias;
		monto: real;
		distancia: real;
	end;
	
	vecMarzo = array [1..dimF] of marzo;
	vecDias = array [dias] of integer;
	
Procedure leerMarzo(var a: marzo);
Begin
	With a do begin
		Writeln('Ingrese el dia del mes del viaje (del 1 a 31): ');readln(dia);
		Writeln('Ingrese el monto de dinero transportado : ');readln(monto);
		Writeln('Ingrese la distancia recorrida: ');readln(distancia);
	end;
end;


Procedure cargarVector(var vec: vecMarzo; var dL: integer);
Var
	aux: marzo;
Begin
	leerMarzo(aux);
	While(aux.distancia<>0) and (dL<dimF) do begin
		vec[dL]:= aux;
		dL:= dL+1;		
		leerMarzo(aux);
	end;
end;

Procedure inicializar(var dM: vecDias);
Var
	i: integer;
Begin
	for i:=1 to 31 do 
		dM[i]:= 0;
end;

Procedure promedioMonto(monto: real; var mT: real);
Begin
	mT:= mT+monto;
end;

Procedure menosDinero(v: marzo; var dM: marzo);
Begin
	if(v.monto<dM.monto) then 
		dM:= v;
end;

Procedure cantViajes(dia: dias; var tD: vecDias);
Begin
	tD[dia]:= tD[dia]+1; 
end;


Procedure imprimir(dM: marzo);
Begin
	Writeln('Distancia recorrida ', dM.distancia:2:1);
	Writeln('Dia del mes ', dM.dia);
	Writeln();
end;

Procedure imprimir2(tD: vecDias);
Var
	i: dias;
Begin
	for i:= 1 to 31 do begin
		if(tD[i]<>0) then 
			Writeln('La cantidad de viajes realizados el dia ',i,' es ',tD[i]);
	end;
end;

Procedure recorrer(vec: vecMarzo; dimL: integer);
Var
	montoTotal: real;
	diaMenos: marzo;
	totalDias: vecDias;
	i: integer;
Begin
	montoTotal:= 0;
	diaMenos.dia:=1;
	diaMenos.monto:= 99000;
	diaMenos.distancia:= 0;
	inicializar(totalDias);
	for i:=1 to dimL do begin
		promedioMonto(vec[i].monto, montoTotal);
		menosDinero(vec[i], diaMenos);
		cantViajes(vec[i].dia, totalDias); {vec[i].dia= posicion en el vector de dias}
	end;
	Writeln('El monto promedio realizado es: ',montoTotal/dimL:2:1);
	Writeln('La distancia recorrida y el dia que se transporto menos dinero es ');
	imprimir(diaMenos);
	imprimir2(totalDias); {imprimir 2: impimir la cantidad de viajes realizados en el mes}
end;

Procedure eliminar(var vM: vecMarzo; var dL: integer; var eliminado: boolean);
Var
	i: integer;

Begin
	For i:=1 to dL-1 do begin
		if(vM[i].distancia = 100) then begin
			vM[i]:= vM[i+1];
			eliminado:= true;
			dL:=dL+1;
		end;
	end;
end;
	
Var
	vecMar: vecMarzo;
	dimL: integer;
	eliminado: boolean;
	
Begin
	eliminado:= false;
	dimL:=1;
	cargarVector(vecMar, dimL);
	recorrer(vecMar, dimL);
	eliminar(vecMar, dimL, eliminado);
	if (eliminado) then 
		writeln ('Se han borrado todos los viajes cuya distancia sea = 100') 
	else 
		writeln ('No habia viajes cuyos km sean 100 para borrar');
end.

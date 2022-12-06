/**************************************************************/
program ejer14;
type
	str20=String[20];
	rolDesarrollador = record
		cod:integer;
		rol:str20;
		valor:real;
	end;
	vTabla = array [1..5] of rolDesarrolador;
	proyecto = record
		monto:real;
		cantArq:integer;
	end;
	vProyectos = array [1..1000] of proyecto;	
	
	desarrollador=record
		pais:str20;
		codP:integer;
		nomP:str20;
		rol:integer;
		canths:integer;
	end;

procedure inicializarV(var p:vProyectos);
var i:integer;
begin
	for i:=1 to 1000 do begin
		p[i].monto:=0;
		p[i].cantArq:=0;
	end;
end;

var
	desa:desarrollador;
	proy:vProyectos;
	tabla:vTabla;
	totalArg:real;
	totalHsAd:integer;
	
begin
	totalArg:=0;
	totalHsAd:=0;
	inicializarV(proy);
	leer(desa);
	while(desa.codP<>-1) do begin
		proy[desa.codP].monto:= proy[desa.codP].monto + (desa.canths * tabla[desa.rol].valor );
		if (desa.rol = 4) then 
			proy[desa.codP].cantArq:= proy[desa.codP].cantArq + 1;
		if(desa.pais='Argentina') then 
			totalArg:= totalArg+ (desa.canths * tabla[desa.rol].valor );
		if(desa.rol=3) then
			totalHsAd:= totalHsAd + desa.canths;
		leer(desa);
	end;
	
	//calculos de los proyectos
	
	writeln('el codigo del proyecto con menor monto:',menorMonto(proy));
	imprimirArq(proy);
	
	
end;

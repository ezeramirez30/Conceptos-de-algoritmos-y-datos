Program Ejercicio11;

Const
	dimF= 200;

Type
	Str30= String[30];
	foto= record
		titulo: Str30;
		autor: Str30;
		meGusta: integer;
		clicks: integer;
		comentarios: integer;
	end;
	vFotos= array[1..dimF] of foto;
	
	
Procedure leerVector(var v: vFotos);
Var
	i: integer;
Begin
	for i:=1 to dimF do begin
		Writeln('Ingrese el titulo de la foto');
		Readln(v[i].titulo);
		Writeln('Ingrese el autor de la foto');
		Readln(v[i].autor);
		Writeln('Ingrese la cantidad me gusta de la foto');
		Readln(v[i].meGusta);
		Writeln('Ingrese la cantidad de clicks de la foto');
		Readln(v[i].clicks);
		Writeln('Ingrese la cantidad de comentarios');
		Readln(v[i].comentarios);
	end;
end;

procedure tituloMas(titulo: Str30; clicks: integer; var tMas: Str30; var clickMax: integer);
begin
	if(clicks>clickMax) then begin
			clickMax:=clicks;
			tMas:= titulo;
	end;
end;

Procedure recorrer(v: vFotos; var clickMax: integer; var tMas: Str30; var cMg: integer; var ctCom: integer);
Var
	i: integer;
Begin
	for i:=1 to dimF do begin
		tituloMas(v[i].titulo, v[i].clicks, tmas, clickMax);
		if(v[i].autor = 'Art Vandelay') then
			cMg:= cMg + v[i].meGusta;
		ctCom:= ctCom+v[i].comentarios
	end;
end;

Var
	vFot: vFotos;
	titMas: Str30;
	clickMax, cantMg, cantCom: integer;
	
Begin
	cantMg:=0;
	clickMax:= -1;
	leerVector(vFot);
	recorrer(vFot, clickMax, titMas, cantMg, cantCom);
	Writeln('La foto mas vista es ',titMas);
	Writeln('Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay” ',cantMg);
	Writeln('comentarios recibidos para cada una de las fotos publicadas en esa página ',cantCom);
End.


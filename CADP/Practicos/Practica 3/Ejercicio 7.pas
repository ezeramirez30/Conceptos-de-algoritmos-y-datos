Program Ejercicio7;

Type
	Str30= String[30];
	centrosInve = record
		nombre: Str30;
		universidad: Str30;
		cantInves: integer;
		cantBeca: integer;
	end;

procedure leerCentro (var c: centrosInve);
Begin
	Writeln('Ingrese el nombre del centro de investigacion');
	Readln(c.nombre);
	Writeln('Ingrese la universidad a la cual pertenece  el centro de investigacion');
	Readln(c.universidad);
	Writeln('Ingrese la cantidad de investigadores del centro de investigacion');
	Readln(c.cantInves);
	Writeln('Ingrese la cantidad de becados del centro de investigacion');
	Readln(c.cantBeca);
end;

procedure uniMayor (cen: centrosInve; var totalIn: integer; var compIn: integer; var mayUni: Str30);
begin
	if(totalIn>compIn) then 
		mayUni:= cen.universidad;
		compIn:= totalIn;
end;

procedure menorBecarios (cent: centrosInve; cantBec: integer; var comBec1, comBec2: integer; var ce1, ce2: Str30);
begin
	if(cantBec<comBec1) then begin
		comBec2:= comBec1;
		ce2:=ce1;
		comBec1:=cantBec;
		ce1:=cent.nombre;
	end
	else if(cantBec<comBec2) then begin
		comBec2:= cantBec;
		ce2:=cent.nombre;
	end;
end;

var
	centro: centrosInve;
	cantCentros, totalInve, cantBec, mayorInves, compBec1, compBec2: integer;
	compUni, mayorUni, cen1, cen2: Str30;
	
begin
	cen1:='';
	cen2:='';
	compBec1:=1000;
	compBec2:=1000;
	mayorInves:=-1;
	mayorUni:='';
	leerCentro(centro);
	While(centro.cantInves <> 0 ) do begin
		compUni:= centro.universidad;
		totalInve:= 0;
		cantCentros:=0;
		cantBec:= 0;
		While(centro.universidad = compUni) and (centro.cantInves <> 0 ) do begin
			cantCentros:=cantCentros+1;
			totalInve:= totalInve+centro.cantInves;
			cantBec:= cantBec+centro.cantBeca;
			uniMayor(centro, totalInve, mayorInves, mayorUni);
			menorBecarios(centro, cantBec, compBec1, compBec2, cen1, cen2);
			leerCentro(centro);
		end;
		Writeln('Cantidad total de centros para cada universidad ',cantCentros);
	end;
	Writeln('La universidad con mayor cantidad de investigadores en sus centros es ',mayorUni);
	Writeln('Los dos centros con menor cantidad de becarios son ',cen1,' y ', cen2);
end.
			
			
		
		

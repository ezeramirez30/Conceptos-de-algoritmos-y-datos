Program ejercicio3;

Const
	unesco = 23.435;
	
	
Type
	Str20 = String[20];
	escuela = record
		cue: integer;
		nombre:	Str20;
		docentes: integer;
		alumnos: integer;
		localidad: Str20;
	end;
	
	regMin = record
		cue: integer;
		nombre: Str20;
		relacion: real;
	end;	

procedure leerEscuela(var e: escuela);
begin
	Writeln('Ingrese el codigo único de establecimiento');
	Readln(e.cue);
	Writeln('Ingrese el nombre de la escuela');
	Readln(e.nombre);
	Writeln('Ingrese la cantidad de docentes');
	Readln(e.docentes);
	Writeln('Ingrese la cantidad de alumnos');
	Readln(e.alumnos);
	Writeln('Ingrese la localidad de la escuela');
	Readln(e.localidad);
end;

procedure calcularMejores (reg: escuela; rel: real; var m1, m2: regMin);
begin
	if(rel>m1.relacion) then begin
		m2.relacion:=m1.relacion;
		m2.nombre:= m1.nombre;
		m2.cue:= m1.cue;
		m1.relacion:=rel;
		m1.nombre:= reg.nombre;
		m1.cue:= reg.cue;
	end
	else if(rel>m2.relacion) then begin
		m2.relacion:=rel;
		m2.nombre:= reg.nombre;
		m2.cue:= reg.cue;
	end;
end;
		
function calcularRelacion (cantA, cantD: integer): real;
begin
	calcularRelacion:= cantA/cantD;
end;

var
	esc: escuela;
	relacion: real;
	cantLp, i: integer;
	min1, min2: regMin;
	
begin
	min1.relacion:= 9999;
	min1.cue:=-1;
	min1.nombre:= '';
	min2.relacion:= 9999;	
	cantLp:= 0;
	for i:= 1 to 3 do begin
		leerEscuela(esc);
		relacion:=calcularRelacion(esc.docentes, esc.alumnos);
		if(relacion>unesco) and (esc.localidad= 'La Plata') then
			cantLp:= cantLp+1;
		calcularMejores(esc, relacion, min1, min2);	
	end;
	Writeln('La cantidad de escuelas de La Plata con una relacion superior a la Unesco es: ', cantLp);
	Writeln('La escuela con mejor relacion es: ',min1.nombre, ' con cue ', min1.cue);
	Writeln('La seguna escuela con mejor relacion es: ',min2.nombre,' con cue ',min2.cue);
end.

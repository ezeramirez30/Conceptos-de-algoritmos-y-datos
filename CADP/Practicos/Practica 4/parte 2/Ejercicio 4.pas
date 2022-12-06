Program ejercicio4;

Const
	dimF= 1000;
	
Type
	Str30= String[30];
	alumno= record
		numero: integer;
		apellido: Str30;
		nombre: Str30;
		asistencias: integer;
	end;
	
	vectorAlu= array[1..dimF] of alumno;

{A}	
Function buscarAlumno(a: vectorAlu; dimL: integer; nroBuscar: integer): integer;
Var
	pos: integer;
Begin
	pos:=1;
	While(a[pos].numero<nroBuscar) do 
		pos:=pos+1;
	buscarAlumno:= pos;
end;
	
{B}
Procedure insertarAlumno(var a: vectorAlu; var dL: integer; regA: alumno);
Var
	pos, i: integer;
Begin
	If((dL+1)<=dimF) then {chequeo si hay lugar}
		pos:=1;
		While(pos<dL) and (regA.numero<a[pos].numero) do begin 
			pos:= pos+1;
			For i:=dL downto pos do begin
				a[i+1]:=a[i]; {hago el corrimiento}
			end;
			a[i]:=regA;
			dL:= dL+1;
		end;
end;

{C}
Procedure eliminarAlumno(var a: vectorAlu; var dimL: integer; posEli: integer);
var
	i: integer;
Begin
	if(posEli>=1) and (posEli<=dimL) then begin
		for i:=posEli to dimL-1 do begin
			a[i]:= a[i+1];
		end;
		dimL:= dimL-1;
	end;
end;

{D}
Procedure eliminarAlumnoPos(var a: vectorAlu; var dL: integer; nroEli: integer);
Begin
	eliminarAlumno(a, dL, buscarAlumno(a, dL, nroEli)); {buscarAlu nos devuelve la posicion que se encuentra segun el numero de alumno, eliminarAlumno elimina al alumno en la posicion que recibe de buscarAlumno}
end;

{E}
Procedure eliminarAsistencia(var a: vectorAlu; var dL: integer);
Var
	i: integer;
Begin
	for i:=1 to dL do begin
		if(a[i].asistencias=0) then begin
			a[i]:= a[i+1];
			dL:=dL-1;
		end;
	end;
end;


Var
	alu: vectorAlu;
	dimL, nroBuscar, posEliminar, nroEliminar: integer;
	regAlu: alumno;
	
Begin
	cargarAlumno(alu, dimL);
	Writeln('Ingrese el alumno que quiere buscar');
	Readln(nroBuscar);
	buscarAlumno(alu, dimL, nroBuscar);
	insertarAlumno(alu, dimL, regAlu);
	Writeln('Ingrese la posicion del alumno que desea eliminar');
	Readln(posEliminar);
	eliminarAlumno(alu, dimL, posEliminar);
	Writeln('Ingrese el numero del alumno que desea eliminar');
	Readln(nroEliminar);
	eliminarAlumnoPos(alu, dimL, nroEliminar);
	eliminarAsistencia(alu, dimL);
end.
	
	

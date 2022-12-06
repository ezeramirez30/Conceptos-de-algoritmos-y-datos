Program ejercicio2;

Const
	dimF= 500;
Type
	Str30= string[30];
	vector= array[1..dimF] of Str30;
	

	
Procedure leer(var n: Str30);
Begin
		Writeln('Ingrese el nombre del alumno');
		Readln(n);
	
Procedure cargar(var vec: vector; var dimL: integer);
Var
	nom: Str30; {para cargar el vector con numeros ingresados}
Begin
	leer(nom);
	While(nom<>'ZZZ') and (dimL < dimF) do begin
		dimL:= dimL+1;
		v[dimL]:=nom;
		leer(nom);
	end;
end;

{b}
Procedure eliminar(var vec: vector; var dimL: integer);
Var
	pos, i: integer;
	nom2: Str30;
	eliminado: boolean;
Begin
	pos:= 1;
	eliminado:= false;
	Writeln('Ingrese el nombre del alumno que desea borrar');
	Readln(nom2);
	While(pos<=dimL) and (not eliminado) do begin
		if(v[pos]= nom2) then begin
			for i:= pos to (dimL - 1) do
				v[i]:= v[i+1]; 
			end;
		eliminado:= true;
		dimL:=dimL-1;
		end
		else
			pos:=pos+1;
	end;
end;	

{c}
Procedure insertar(var v: vector; var dL: integer);
Var
	nom3: Str30;
	pos, i: integer;
Begin
	pos:= 4;
	Writeln('Ingrese el nombre del alumno que desea insertar');
	Readln(nom3);
	if(dimL<dimF) then begin
		for i:= pos downto 4
			v[i+1]:= v[i]; {al elemento en la posicion v[i], lo paso a la siguiente posicion}
		v[4]:= nom3;
		dimL:= dimL+1;
	end;
End;

{D}
Procedure agregar (var v: vector; var dL: integer);
Var
	nom4: Str30;
Begin
	Writeln('Ingrese el nombre del alumno que desea agregar');
	Readln(nom4);
	if(dL+1<=dimF) then begin
		v[dL+1]:= nom4;
		dL:= dL+1;
	end;
end;


	
Var
	dimL: integer;
	vec: vector;
	
Begin
	dimL:=1;
	Cargar(vec,dimL);
	eliminar(vec, dimL);
	insertar(vec, dimL);
	agregar(vec, dimL);

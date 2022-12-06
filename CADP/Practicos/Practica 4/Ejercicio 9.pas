Program Ejercicio9;

Const
	dimF = 400;

Type
	Str30 = string[30];
	ingresantes = record
		nroInscr: integer;
		dni: integer;
		apellido: Str30;
		nombre: Str30;
		nacimiento: integer;
	end;
	vIngresantes= array [1..dimF] of ingresantes;

Procedure leer(var a: ingresantes);
begin
	WriteLn ('Ingrese nro de inscripcion: '); 
	Readln (a.nroInscr);
	WriteLn ('Ingrese DNI: '); 
	Readln (a.dni);
	If(a.dni<>-1) then begin
		Write ('Ingrese apellido del alumno: '); 
		Readln (a.apellido);
		Write ('Ingrese nombre del alumno: '); 
		Readln (a.nombre);
		Write ('Ingrese ano de nacimiento del alumno: '); 
		Readln (a.nacimiento);
	end;
end;

Procedure cargar(var v: vIngresantes; var dimL: integer);

Begin
	leer(v[dimL]);
	While(v[dimL].dni<>-1) do begin
		dimL:= dimL+1;
		leer(v[dimL])
	end;
end;


function esPar(dni: integer): boolean;
var
	seguir: boolean;
	dig: integer;
begin
	seguir:= true;
	while(dni <> 0) and (seguir) do begin
		dig:= dni mod 10; {selecciono el ultimo valor}
		if(dig mod 2 = 0) then begin
			seguir:= true;
			dni:= dni div 10; {para que no me tome mas el digito ya leido}
		end
		else 
			seguir:= false;
	end;
	esPar:= seguir;
end;

Procedure recorrer(v: vIngresantes; dL: integer ; var por: real);
var
	i: integer;
	resultado: boolean;
begin
	for i:= 1 to dL do begin
		resultado:= esPar(v[i].dni);

		if(resultado) then
			por:= por+1;
	end;
end;

Procedure mayorEdad(v: vIngresantes; dL: integer; var nMax: Str30; var nMax2: Str30; var aMax: Str30; var aMax2: Str30; var eMax: integer; var eMax2: integer);
var
	i: integer;
Begin
	for i:= 1 to dL do begin
		if(v[i].nacimiento< eMax) then begin
			eMax2:= eMax;
			nMax2:= nMax;
			aMax2:= aMax;
			eMax:=v[i].nacimiento;
			nMax:= v[i].nombre;
			aMax:= v[i].apellido;
		end
		else if(v[i].nacimiento<eMax2) then begin
			eMax2:=v[i].nacimiento;
			nMax2:= v[i].nombre;
			aMax2:= v[i].apellido;
		end;
	end;
end;

var
	vIngre: vIngresantes;
	porcen: real;
	nomMax, nomMax2, apeMax, apeMax2: str30;
	edadMax, edadMax2, dimL: integer;
	
Begin
	dimL:=1;
	edadMax:= 2022;
	edadMax2:= 2022;
	nomMax:='';
	nomMax2:='';
	apeMax:='';
	apeMax2:='';
	cargar(vIngre, dimL);
	recorrer(vIngre, dimL, porcen); 
	mayorEdad(vIngre, dimL, nomMax, nomMax2, apeMax, apeMax2, edadMax, edadMax2);
	Writeln ('El porcentaje de alumnos con DNI compuesto solo por digitos pares: ',(porcen/dimF)*100:2:1);
	Writeln('El alumno con mayor edad es: ',nomMax,' ', apeMax);
	Writeln('El segundo  alumno con mayor edad es: ',nomMax2,' ', apeMax2);
end.

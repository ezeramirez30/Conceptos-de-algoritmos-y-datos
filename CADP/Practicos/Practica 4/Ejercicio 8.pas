Program Ejercicio8;

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
	Write ('Ingrese apellido del alumno: '); 
	Readln (a.apellido);
	Write ('Ingrese nombre del alumno: '); 
	Readln (a.nombre);
	Write ('Ingrese ano de nacimiento del alumno: '); 
	Readln (a.nacimiento);
end;

Procedure cargar(var v: vIngresantes);
var
	i: integer;
Begin
	for i:= 1 to dimF do begin
		leer(v[i])
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

Procedure recorrer(v: vIngresantes ; var por: real);
var
	i: integer;
	resultado: boolean;
begin
	for i:= 1 to dimF do begin
		resultado:= esPar(v[i].dni);

		if(resultado) then
			por:= por+1;
	end;
end;

Procedure mayorEdad(v: vIngresantes; var nMax, nMax2, aMax, aMax2: str30; var eMax, eMax2: integer);
var
	i: integer;
Begin
	for i:= 1 to dimF do begin
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
	edadMax, edadMax2: integer;
	
Begin
	edadMax:= 2022;
	edadMax2:= 2022;
	nomMax:='';
	nomMax2:='';
	apeMax:='';
	apeMax2:='';
	cargar(vIngre);
	recorrer(vIngre, porcen); 
	mayorEdad(vIngre, nomMax, nomMax2, apeMax, apeMax2, edadMax, edadMax2);
	Writeln ('El porcentaje de alumnos con DNI compuesto solo por digitos pares: ',(porcen/dimF)*100:2:1);
	Writeln('El alumno con mayor edad es: ',nomMax,' ', apeMax);
	Writeln('El segundo  alumno con mayor edad es: ',nomMax2,' ', apeMax2);
end.

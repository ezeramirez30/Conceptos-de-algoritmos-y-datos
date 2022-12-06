{Realizar un programa modularizado que lea una secuencia de caracteres y 
verifique si cumple con el patrón A$B#, donde:
- A es una secuencia de sólo letras vocales
- B es una secuencia de sólo caracteres alfabéticos sin letras vocales
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}

program Ejercicio12;

function esVocal(c:char): boolean;
	begin
		esVocal:= (car='a' or car='e' or car='i' or car='o' or car='u');
	end;

function esAlfabetico (c:char): boolean;
	var esAlfa: boolean;
	begin
		if((car>='A' and car<='Z') or (car>='a' and car<='z') then esAlfa:=true;
		else
			esAlfa:= false;
		esAlfabetico:= esAlfa;
	end;

procedure procesarA(var cumple: boolean);
	var car: char;
	begin
		Writeln('Ingrese un caracter');
		Readln(car);
		While(car<>'$' and cumple) do begin
			{una manera de hacerlo}
			{if(car='a') or (car='e') or (car='i') or (car='o') or (car='u') then {faltaria agregar las condiciones para mayuscula}}
			{otra}
			If(esVocal(car)) then			
				Writeln('Ingrese un caracter');
				Readln(car)
			else
				cumple:=false;
		end;
	end;
	
procedure procesarB(var cumple: boolean);
	var car: char;
	begin
		Writeln('Ingrese un caracter');
		Readln(car);
		While(car<>'#' and cumple) do begin
			If(esAlfabetico(car) and (not esVocal(car))) then			{NOT negar}
				Writeln('Ingrese un caracter');
				Readln(car)
			else
				cumple:=false;
		end;
	end;

var
	car: char;
	cumple: boolean;
	
begin
	cumple:= true;
	procesarA(cumple);
	If(cumple)then begin
		procesarB(cumple);
		If(cumple) then 
			Writeln('El patron se cumple')
		else
			Writeln('La secuencia B no cumple');
	end;
	else
		Writeln('La secuencia A no cumple');
end.


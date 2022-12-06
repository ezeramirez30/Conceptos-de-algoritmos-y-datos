program ejercicio8;

var
	
	caracter, caracter2, caracter3: char;

begin
	Writeln('Ingrese un caracter');
	Readln(caracter);
	Writeln('Ingrese un caracter');
	Readln(caracter2);
	Writeln('Ingrese un caracter');
	Readln(caracter3);
	if	((caracter = 'a') or (caracter = 'e') or (caracter = 'i') or (caracter = 'o') or (caracter = 'u')) and 
		((caracter2 = 'a') or (caracter2 = 'e') or (caracter2 = 'i') or (caracter2 = 'o') or (caracter2 = 'u')) and 
		((caracter3 = 'a') or (caracter3 = 'e') or (caracter3 = 'i') or (caracter3 = 'o') or (caracter3 = 'u')) then
		 Writeln('Los tres son vocales')
	else if  (caracter = 'a') or (caracter = 'e') or (caracter = 'i') or (caracter = 'o') or (caracter = 'u') or 
		(caracter2 = 'a') or (caracter2 = 'e') or (caracter2 = 'i') or (caracter2 = 'o') or (caracter2 = 'u') or
		(caracter3 = 'a') or (caracter3 = 'e') or (caracter3 = 'i') or (caracter3 = 'o') or (caracter3 = 'u') then
			Writeln('Al menos un caracter era vocal');
	
	
end.


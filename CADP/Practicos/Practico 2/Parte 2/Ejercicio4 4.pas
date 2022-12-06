program programadores;
 
procedure leerDatos(var legajo: integer; var salario : real); {2do los ordeno}
										{3ero salario tiene que ser de tipo referencia}
 begin
	 writeln('Ingrese el nro de legajo');
	 read(legajo);
	 writeln('Ingrese  el salario');
	 read(salario);
 end;
 
procedure actualizarMaximo(nuevoLegajo: integer; nuevoSalario: real; var maxLegajo: integer; var maxSalario: real);
 {var
	maxSalario : real;} {4to error, maxLegajo al salir del procedure al ser una variable local, lo perdemos}
begin
 	if (nuevoLegajo > maxLegajo) then begin
		 maxLegajo:= nuevoLegajo;
		 maxSalario := nuevoSalario;
	end;
 end;
 
var
	 legajo, maxLegajo, i : integer;
	 salario, maxSalario : real;
	 sumaSalarios: real;{1ero declaro sumaSalarios}
begin
	 sumaSalarios := 0; {1 ero no esta declarada}
	 maxLegajo:=-1;
	 for i := 1 to 130 do begin
		 leerDatos(legajo, salario); {2do error, pasa mal los parametros}
		 actualizarMaximo(legajo, salario, maxLegajo, maxSalario);
		 sumaSalarios := sumaSalarios + salario;
	 end;
	 writeln('En todo el mes se gastan ', sumaSalarios, ' pesos');
	 writeln('El salario del empleado más nuevo es ',maxSalario);
end.

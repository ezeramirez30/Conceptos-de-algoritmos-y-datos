Program Ejercicio10;

Const
	dimF = 300;

Type
	vEmpresa = array[1..dimF] of real;

Procedure leerEmpleado(var v: vEmpresa; var dimL: integer);
begin
	Writeln('Ingrese el salario del empleado');
	Readln(v[dimL]);
	While(v[dimL]<> 0) do begin
		dimL:=dimL+1;
		Writeln('Ingrese el salario del empleado');
		Readln(v[dimL]);
	end;
end;

Procedure incrementarSal(var v: vEmpresa; dimL: integer; x: real);
var
	i: integer;
Begin
	for i:=1 to dimL do 
		v[i]:= v[i]+(v[i]*100)/15;
end;

Procedure sueldoTotal(v: vEmpresa; dimL: integer; var suma: real);
var
	i: integer;
Begin
	for i:=1 to dimL do begin
		suma:= suma+v[i];
	end;
	Writeln('El sueldo promedio de los empleados de la empresa es: ',suma/dimL:2:1);
end;

var
	vEmpr: vEmpresa;
	dimL: integer;
	x, total: real;
Begin
	x:= 15;
	total:=0;
	dimL:=1;
	leerEmpleado(vEmpr, dimL);
	incrementarSal(vEmpr, dimL, x);
	sueldoTotal(vEmpr, dimL, total);
end.

program Vectores;
const
	cant_datos = 150;

type
	vdatos = array[1..cant_datos] of real;

procedure cargarVector(var v:vdatos; var dimL : integer);
var
i: integer;
begin
	Writeln('Ingrese un numero real');
	Readln(num);
	While(dl<=150) and (num<>0) do begin
		dimL:=dimL+1;
		v[dimL]:= num;
		Writeln('Ingrese un numero real');
		Readln(num);
	end;
end;

procedure modificarVectorySumar(var v:vdatos;
dimL : integer; n: real; var suma: real);
var
i: integer;
begin
	for i:= 1 to dimL do begin
		v[i]:= v[i]+n;
		suma:=v[i]+suma
	end;
end;

{ programa principal }
var
datos : vdatos;
i, dim : integer;
num, suma : real;
begin
dim := 0;
sumaTotal := 0;
cargarVector(datos, dim); { completar }
writeln(‘Ingrese un valor a sumar’);
readln(num);
modificarVectorySumar(datos, dim, num, suma);{completar}
writeln(‘La suma de los valores es: ’, suma);
writeln(‘Se procesaron: ’,dim, ‘ números’)
end

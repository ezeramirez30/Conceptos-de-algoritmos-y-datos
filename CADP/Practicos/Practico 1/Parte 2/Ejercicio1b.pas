Program ejercicio1b;

var
	num, suma, cantMayor, i: integer;

begin
	suma:=0;
	cantMayor:=0;
	for i:=1 to 10 do begin
		Writeln('Ingrese un numero');
		Readln(num);
		suma:= num+suma;
		if(num>5) then
			cantMayor:= cantMayor+1;
	end;
	
	Writeln('La suma total es: ',suma);
	Writeln('La cantidad  de numeros ingresados mayores a 5 son : ',suma);
end.


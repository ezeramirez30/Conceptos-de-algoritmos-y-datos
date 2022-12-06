Program Ejercicio5;

Var
	num, numMax, numMin, suma: integer;
	
begin
	numMax:= -999;
	numMin:=999;
	suma:=0;
	repeat	
		Writeln('Ingrese un numero');
		Readln(num);
		if (num>numMax) then
			numMax:=num;
		if(num<numMin) then
			numMin:= num;
		suma:= suma+num;
	until(num=100);
	Writeln('El numero maximo leido es ',numMax);
	Writeln('El numero minimo leido es ', numMin);
end.

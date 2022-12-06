Program Ejercicio7;

var
	num, i, numMin,numMin2: integer;
	
begin
	numMin:= 9999;
	numMin2:= 9999;
	for i:=1 to 3 do begin
		Writeln('Ingrese un numero');
		Readln(num);
		if(num<numMin) then begin 
			numMin2:=numMin;
			numMin:= num;
		end
		else if(num<numMin2) then 
			numMin2:=num;
	end;
	Writeln('Los numeros menores ingresados son: ',numMin,' y ',numMin2);
end.
			
	

program ejercicio3;

var
	num1, num2 ,num3, primero, segundo, tercero: integer;
	
begin
	primero:=0;
	segundo:=0;
	tercero:=0;
	Writeln('Ingrese un numero');
	Readln(num1);
	Writeln('Ingrese un numero');
	Readln(num2);
	Writeln('Ingrese un numero');
	Readln(num3);
	if (num1>num2) then begin
		 if(num1>num3) then begin
			primero:= num1;
			if(num2>num3) then begin
				segundo:=num2;
				tercero:= num3;
			end
			else begin
				segundo:= num3;
				tercero:= num2;
			end;
		end;
	end;
	if (num2>num1) then begin
		if(num2>num3) then begin
			primero:= num2;
			if(num1>num3) then begin
				segundo:=num1;
				tercero:= num3;
			end
			else begin
					segundo:= num3;
					tercero:= num1;
				end;
		end;
	end;
	if (num3>num1) then begin
		if(num3>num2) then begin;
			primero:= num3;
			if(num1>num2) then begin
				segundo:=num1;
				tercero:= num2;
			end
			else begin
				segundo:= num2;
				tercero:= num1;
			end;
		end;
	end;
	
	
	Writeln('Los valores ingresados puestos en orden descendente son: ',tercero,', ',segundo,' y ',primero);
	
		

end.

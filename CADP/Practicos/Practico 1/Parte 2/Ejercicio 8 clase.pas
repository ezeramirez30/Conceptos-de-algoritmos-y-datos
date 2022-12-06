program ejercicio8;
var
  monto,totalMes,totalDia:real;
  i,diaMax,cantVentasDia,cantVentasDiaMax:integer;
begin
  cantVentasDiaMax:=-1;
  totalMes:=0;
  for i:= 1 to 31 do
    begin
		totalDia:=0;
		cantVentasDia:=0;
		readln(monto);
		while(monto<>0) do
			begin
				cantVentasDia:= cantVentasDia + 1;
				totalDia:= totalDia + monto;
				readln(monto);
			end;
		
		if(cantVentasDia>cantVentasDiaMax)then 
			begin
				diaMax:=i;
				cantVentasDiaMax:= cantVentasDia;
			end;
		
		totalMes:= totalMes + totalDia;
		writeln('la cantidad de ventas del dia ',i,':',cantVentasDia);
    end;
   writeln('el monto total del mes fue:', totalMes);
   writeln('el dia del mes con mas ventas fue el:', diaMax, 'con ', cantVentasDiaMax,' ventas.');
    
end.

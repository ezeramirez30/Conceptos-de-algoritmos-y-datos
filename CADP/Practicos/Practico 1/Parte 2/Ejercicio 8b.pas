Program Ejercicio8b;

Var
	montoDia, montoTotal: real;
	ventas, ventasMax, diaMax, i: integer;
begin
	ventasMax:=-1;
	diaMax:=0;
	montoTotal:=0;
	for i:=1 to 3 do begin
		ventas:=0;
		Writeln('Ingrese el monto recaudado en el dia');
		Readln(montoDia);
		While(montoDia<>0) do begin
			ventas:= ventas+1;
			montoTotal:= montoTotal+ montoDia;
			Writeln('Ingrese el monto recaudado en el dia');
			Readln(montoDia);
		end;
		if(ventas>ventasMax) then begin
			diaMax:=i;
			ventasMax:= ventas;
		end;
		Writeln('La cantidad de ventas en el dia son :',ventas);
	end;
	Writeln('El monto acumulado del mes es : ',montoTotal:1:2);
	Writeln('El dia que se realizo mas ventas fue : ',diaMax);
END.
			
	

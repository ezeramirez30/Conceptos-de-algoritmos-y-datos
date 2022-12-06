program Ejercicio8;

Var
	montoDia, montoTotal, i: integer;
	ventas: integer;
begin
	montoTotal:=0;
	for i:=0 to 31 do begin
		ventas:=0;
		Writeln('Ingrese el monto recaudado en el dia');
		Readln(montoDia);
		While(montoDia<>0) do begin
			ventas:= ventas+1;
			montoTotal:= montoTotal+ montoDia;
			Writeln('Ingrese el monto recaudado en el dia');
			Readln(montoDia);
		end;
		Writeln('La cantidad de ventas en el dia son :',ventas);
	end;
	Writeln('El monto acumulado del mes es : ',montoTotal);
END.
			
	


program Ejercicio6;



var
	precio, precioMen, precioMen2: real;
	codigo, i, codBar, codBar2, cant: integer;
	
begin
	precioMen:=999;
	precioMen2:=999;
	codBar:= 999;
	codBar2:=999;
	cant:=0;
	for i:=1 to 200 do begin
		Writeln('Ingrese el codigo del producto');
		Readln(codigo);
		Writeln('Ingrese el precio del producto');
		Readln(precio);
		if(precio<precioMen) then begin
			precioMen2:=precioMen;
			precioMen:=precio;
			codBar:=codigo;
		end
		else if(precio<precioMen2) then
			precioMen2:= precio;
			codBar2:=codigo;
		if(precio>16) and (codigo mod 2 =0) then
			cant:=cant+1;
	end;
	Writeln('Los dos productos mas baratos son : ',codBar,' y ',codBar2);
	Writeln('La cantidad de productos con precio mayor a 16 y codigo par son: ',cant);
end.
			
	


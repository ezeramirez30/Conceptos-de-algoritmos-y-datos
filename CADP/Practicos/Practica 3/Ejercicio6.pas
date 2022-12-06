Program ejercicio5;

Type
	Str20 = String[20];
	Micropro = record
		marca: Str20;
		linea: Str20;
		nucleos: integer;
		reloj: integer;
		transitores: integer;
	end;
	
Procedure leerMicro(var m: Micropro);
begin
	Writeln('Ingrese la marca del microprocesador');
	Readln(m.marca);
	Writeln('Ingrese la linea del microprocesador');
	Readln(m.linea);
	Writeln('Ingrese la cantidad de nucelos del microprocesador');
	Readln(m.nucleos);
	Writeln('Ingrese la velocidad del reloj del microprocesador');
	Readln(m.reloj);
	Writeln('Ingrese la cantidad de transitores del microprocesador');
	Readln(m.transitores);
	
end;

Procedure mayorCantidad(m: Micropro; var m1, m2: Str20; cantMax: integer; var c1, c2: integer);
begin
	if(cantMax>c1) then begin
		m2:= m1;
		m1:= m.marca;
		c1:=cantMax;
	end
	else if(cantMax>c2) then begin
		m2:=m.marca;
		c2:=cantMax;
	end;
end;

Var
	micro: Micropro;
	marca1, marca2: Str20;
	marcaComp: Str20;
	cantProMax: integer;
	comp1, comp2, cantProMulti: integer;
Begin
	comp1:= 0;
	comp2:=0;
	cantProMulti:= 0;
	leerMicro(micro);
	While(micro.nucleos <> 0) do begin
		marcaComp:= micro.marca;
		cantProMax:=0;
		While (micro.marca = marcaComp) and (micro.nucleos <> 0) do begin
			if(micro.nucleos>2) and (micro.transitores<=22) then
				Writeln('Procesador marca ',micro.marca,' linea ',micro.linea,' con mas de 2 cores y transistores de a lo sumo 22 nm');
			if(micro.transitores=14) then 
				cantProMax:= cantProMax+1;
			mayorCantidad(micro, marca1, marca2, cantProMax, comp1, comp2);
			if(micro.marca = 'AMD') or (micro.marca = 'INTEL') then begin
				if(micro.reloj>=2) then
					cantProMulti:= cantProMulti+1;
			end;
		end;
	leerMicro(micro);
	end;
	Writeln('Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm son: ',marca1,' y ',marca2);
	Writeln('Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de al menos 2 Ghz son ',cantProMulti);	
end.



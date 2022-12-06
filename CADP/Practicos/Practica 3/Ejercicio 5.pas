Program ejercicio5;

Type
	Str20 = String[20];
	autos = record
		marca: Str20;
		modelo: Str20;
		precio: real;
	end;
	
	caro = record
		marca: Str20;
		modelo: Str20 ;
	end;
	
Procedure leerAuto(var a: autos);
begin
	Writeln('Ingrese la marca del vehiculo');
	Readln(a.marca);
	If(a.marca <> 'ZZZ') then begin
		Writeln('Ingrese modelo del vehiculo');
		Readln(a.modelo);
		Writeln('Ingrese el precio del producto');
		Readln(a.precio);
	end;
end;

Procedure autoCaro (var mC: caro; au: autos; var prMax: real);
begin
	if(au.precio>prMax) then 
		mC.marca:= au.marca;
		mC.modelo:= au.modelo;
		prMax:= au.precio;
end;

var
	auto: autos;
	masCaro: caro;
	totalPrecio, precioMax: real;
	cantAutos: integer;
	marcaComp: Str20;

	
begin
	precioMax:= 0;
	masCaro.marca:= '';
	masCaro.modelo:= '';
	leerAuto(auto);
	autoCaro(masCaro, auto, precioMax);
	While(auto.marca <> 'ZZZ') do begin
		cantAutos:= 0;
		totalPrecio:= 0;
		marcaComp:= auto.marca;
		While(auto.marca = marcaComp) and (auto.marca <> 'ZZZ') do begin
			cantAutos:= cantAutos+1;
			totalPrecio:= totalPrecio+auto.precio;
			leerAuto(auto);
			autoCaro(masCaro, auto, precioMax);
		end;
		Writeln('El precio promedio de la marca es ',totalPrecio/cantAutos:1:2);
	end;
	Writeln('El auto mas caro es :',masCaro.marca,' ',masCaro.modelo);
		
			
	
end.

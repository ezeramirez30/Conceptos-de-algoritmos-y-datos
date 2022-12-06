{Realizar un programa que lea información de autos que están a la venta en una concesionaria.
De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” 
que no debe procesarse.
La información se ingresa ordenada por marca. 
Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.}

program ejer5prac3;
const
	unesco=23.435;

type
	str30 = string[30];
	auto = record
		marca:str30;
		modelo:str30;
		precio:real;
	end;
	
procedure leerAuto(var reg:auto);
Begin
	writeln('ingrese el marca:');
	readln(reg.marca);
	if (reg.marca <>'ZZZ') then
	begin
		readln(reg.modelo);
		readln(reg.precio);
	end;
	
End;

function calcularPromedio(cantau:integer;prectot:real):real;
Begin
	calcularPromedio:=prectot/cantau;
end;


var 
	datosAuto:auto;
	marcaAct:str30;
	cantAuMarca:integer;
	totPrecMarca:real;

BEGIN
	
	leerAuto(datosAuto);
	while (datosAuto.marca<>'ZZZ') do 
	begin
		cantAuMarca:=0;
		totPrecMarca:=0;
		marcaAct:= datosAuto.marca;
		while((datosAuto.marca = marcaAct) and (datosAuto.marca<>'ZZZ')) do
		begin
			cantAuMarca:=cantAuMarca+1;
			totPrecMarca:=totPrecMarca+datosAuto.precio;
			leerAuto(datosAuto);
			
		end;
		//calcular precio promedio de la marca
		writeln('El precio promedio de la marca ',marcaAct,
				' es: ', calcularPromedio(cantAuMArca,totPrecMarca));
	end;
	
	//informar auto mas caro
	
END.

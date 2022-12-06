Program ejer3;

Const
	unesco= 23.435;
Type
	
	str30 = string[30];
	escuela= record
			cue: integer;
			nombre: str30;
			cantDoc: integer;
			cantAlu: integer;
			localidad: str30;
	end;
	
	regMin = record
		cue: integer;
		nombre: str30;
		minRel: real;
	end;
Procedure leerEscuela (var reg: escuela);
begin
	Writeln('Ingrese cue');
	Readln(reg.cue);
	Writeln('Ingrese nombre de la escuela');
	Readln(reg.nombre);
	Writeln('Ingrese cantidad de docentes');
	Readln(reg.cantDoc);
	Writeln('Ingrese cantidad de alumnos');
	Readln(reg.cantAlu);
	Writeln('Ingrese la localidad en la que se encuentra la escuela');
	Readln(reg.localidad);
end;

Procedure calcularMinimos(reg: escuela; relacionEsc :real; var m1, m2: regMin); 
begin
	if(relacionEsc<m1.minRel) then begin
		m2.minRel:= m1.minRel;
		m2.cue:= m1.cue;
		m2.nombre:=m1.nombre;
		m1.minRel:=relacionEsc;
		m1.cue:=reg.cue;
		m1.nombre:= reg.nombre;		
	end
	else if(relacionEsc<m2.minRel) then begin
		m2.minRel:=relacionEsc;
		m2.cue:=reg.cue;
		m2.nombre:= reg.nombre;		
	end;		
end; 

Function calcularRelacion(cantD, cantA: integer):real;
begin
	calcularRelacion:= cantA/cantD;
end;

var
	datosEsc: escuela;
	i, cantBuenaRelacion: integer;
	relacionEsc: real;
	min1, min2: regMin;
begin
	min1.minRel:= 9999;
	min1.cue:=-1;
	min1.nombre:= '';
	min2.minRel:= 9999;
	cantBuenaRelacion:=0;
	for i:=1 to 2400 do begin
		leerEscuela(datosEsc);
		relacionEsc:= calcularRelacion(datosEsc.cantDoc, datosEsc.cantAlu);
		if(relacionEsc>unesco) and (datosEsc.localidad = 'La Plata') then
			cantBuenaRelacion:= cantBuenaRelacion+1;
		calcularMinimos(datosEsc, relacionEsc, min1, min2);
	end;
	{writes}
END.



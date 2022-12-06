program ejercicio7;

type
  cadena30 = String[30];

var
  nombreganador,nombresegundo,nombrepil,nombreultimo,nombrepenultimo:cadena30;
  tfinc,mintfc1,mintfc2:real;
  i: integer;
  {-variables de los ultimos dos pilotos}
  maxtfc1,maxtfc2:real;
begin
  mintfc1:=9999;
  mintfc2:=9999;
  maxtfc1:=-1;
  maxtfc2:=-1;
  nombreganador:=' ';
  nombreultimo:= ' ';
  
  for i:= 1 to 100 do
    begin
          write('nombre del piloto');
          readln(nombrepil);
          write('tiempo de fin de carrera');
          readln(tfinc);
          {- los nombres de los dos pilotos que finalizaron en los dos primeros puestos.}
      if (tfinc<mintfc1)then
        begin
          nombresegundo:=nombreganador;
          mintfc2:=mintfc1;
          nombreganador:=nombrepil;
          mintfc1:=tfinc;
        end
      else
			if(tfinc<mintfc2) then
			begin
				nombresegundo:=nombrepil;
				mintfc2:=tfinc;
			end;
          
    {- los nombres de los pilotos que finalizaron en los últimos dos puestos.}
	  if (tfinc>maxtfc1)then
		begin
		  nombrepenultimo:= nombreultimo;
		  maxtfc2:=maxtfc1;
		  nombreultimo:=nombrepil;
		  maxtfc1:=tfinc;
		end
	  else
			if(tfinc>maxtfc2) then
			begin
				nombrepenultimo:=nombrepil;
				maxtfc2:=tfinc;
			end;
    end;
    writeln('los nombres delos dos primeros pilotos que finalizaron en los dos primeros puestos son: ',nombreganador, ' y ',nombresegundo);
    writeln('los nombres de los dos pilotos que finalizaron en los dos ultimos puestos son: ',nombrepenultimo,' y ',nombreultimo);
  
end.


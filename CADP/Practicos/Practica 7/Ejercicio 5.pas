Program Ejercicio5;

Const
	dimF= 100;

Type
	rangoCamiones= 1..dimF;
	Str20= string[20];
	camion= record
		patente: Str20;
		fabricacion: integer;
		capacidad: integer;
	end;
	
	vecCamion= array[rangoCamiones] of camion;
	
	viaje= record
		codViaje: integer;
		codCamion: rangoCamiones;
		distancia: integer;
		destino: Str20;
		anio: integer;
		dniChofer: integer;
	end;
	
	lista=^nodo;
	nodo= record
		elem: viaje;
		sig: lista;
	end;
		
Procedure cargarLista(var L:lista);
Var
	via: viaje;
Begin
	


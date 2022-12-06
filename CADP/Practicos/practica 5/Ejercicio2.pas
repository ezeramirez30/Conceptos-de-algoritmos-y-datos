Program ejercicio6;

Type
	registro = record {1000 bytes}
	end;
	
	v50= array[1..50] of registro;{50000 bytes= 50kilobytes}{A}
	
	v25= array[1..25] of registro; {25 kilobytes}{b}
	p25= ^v25;{b}{4}
	p50=^v50;{c}
var
	v: v50; {guardo en memoria estatica 50kilobytes} {a}
	v: v25; {reservo en memoria estatica 25 kilobytes}{b}
	punt25: p25;{b}
	punt50:p50;{c}
begin
	new(punt25);{reservo en memoria dinamica 25kilobytes}{b}
	new(punt50);{c}
end.


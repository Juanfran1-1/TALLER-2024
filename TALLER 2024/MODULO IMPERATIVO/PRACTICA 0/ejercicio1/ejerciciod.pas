program ProgramaNumAleatorio;

var
ale,i,A,B,N: integer;

begin
writeln('Ingrese un numero(MIN):  ');readln(A);
writeln('Ingrese un numero (MAX):  ');readln(B);
writeln('Ingrese un numero (REPETICIONES):  ');readln(N);
randomize;
for i:= 1 to N do begin 
     ale := random (B-A)+A; {devuelve un valor aleatorio en el intervalo 0 a 99}
     writeln ('El numero aleatorio generado es: ', ale);
     end;
end.

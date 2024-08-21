program ProgramaNumAleatorio;

var
ale,A,B,F: integer;

begin
writeln('Ingrese un numero(MIN):  ');readln(A);
writeln('Ingrese un numero (MAX):  ');readln(B);
writeln('Ingrese un numero (CORTE):  ');readln(F);
randomize;
ale := random (B-A)+A;
while (ale<>F) do begin  
    writeln ('El numero aleatorio generado es: ', ale);
    ale := random (B-A)+A;
    end;
end.

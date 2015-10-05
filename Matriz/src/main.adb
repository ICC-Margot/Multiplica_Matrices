with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Main is
   fin:Integer:=400;
   MatrizA : array (1..fin,1..fin) of Integer;
   MatrizB : array (1..fin,1..fin) of Integer;
   MatrizC : array (1..fin,1..fin) of Integer;
   m: Integer:=0;
begin
   for i in 1..fin loop
      for j in 1..fin loop
         MatrizA (i,j):= 2;
         MatrizB (i,j):= 2;
      end loop;
   end loop;


   for k in 1..fin loop
      for i in 1..fin loop
         m:=0;
         for j in 1..fin loop
           m:= MatrizA(k,j)+MatrizB(j,i)+m;
         end loop;
         MatrizC(k,i):=m;
      end loop;
   end loop;

   for i in 1..fin loop
      for j in 1..fin loop
         Put(MatrizC(i,j));
      end loop;
      Put_Line("");
   end loop;


   null;
end Main;

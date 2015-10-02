with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Main is
   MatrizA : array (1..500,1..500) of Integer;
   MatrizB : array (1..500,1..500) of Integer;
   MatrizC : array (1..500,1..500) of Integer;
   m: Integer:=0;
begin
   for i in 1..500 loop
      for j in 1..500 loop
         MatrizA (i,j):= 2;
         MatrizB (i,j):= 2;
      end loop;
   end loop;


   for k in 1..500 loop
      for i in 1..500 loop
         m:=0;
         for j in 1..500 loop
           m:= MatrizA(k,j)+MatrizB(j,i)+m;
         end loop;
         MatrizC(k,i):=m;
      end loop;
   end loop;

   for i in 1..500 loop
      for j in 1..500 loop
         Put(MatrizC(i,j));
      end loop;
      Put_Line("");
   end loop;


   null;
end Main;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Main is
   MatrizA : array (1..5,1..5) of Integer;
   MatrizB : array (1..5,1..5) of Integer;
   MatrizC : array (1..5,1..5) of Integer;
   m,i,j,k: Integer:=0;



   task type Multiplica is
      entry iniciar (inicio,fin:Integer);
   end Multiplica;

   task MatrizF is
      entry posicion (e,s,val:Integer);
   end MatrizF;

   task LlenaMatriz;

   task body LlenaMatriz is
    begin
     for i in 1..4 loop
      for j in 1..4 loop
         MatrizA (i,j):= 2;
         MatrizB (i,j):= 2;
         end loop;
      end loop;
   end LlenaMatriz;

   task body Multiplica is
      sumaR:Integer:=0;
   begin
      accept iniciar (inicio: Integer; fin: Integer) do
         for k in inicio..fin loop
          for i in 1..fin loop
            m:=0;
            for j in 1..fin loop
                m:= MatrizA(k,j)+MatrizB(j,i)+m;
               end loop;
               MatrizF.posicion(k,i,m);
          end loop;
         end loop;
      end iniciar;
   end Multiplica;

   SubMatrices : array (0..4) of Multiplica;

   task body MatrizF is
      resultado : Integer:=0;
   begin
      for i in 0..4 loop
       accept posicion (e,s, val:Integer) do
         MatrizC(e,s):=val;
       end posicion;
      end loop;

      Put_Line("La multiplicación es");
      for i in 1..4 loop
       for j in 1..4 loop
         Put(MatrizC(i,j));
       end loop;
       Put_Line("");
      end loop;
   end MatrizF;



begin
   Put_Line("Multiplicaciòn de Matrices");
   for i in 0..4 loop
         SubMatrices(i).iniciar(i,4);
      end loop;
   null;
end Main;

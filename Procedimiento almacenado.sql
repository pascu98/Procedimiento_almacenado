create or replace function especilistadedron (varchar)returns varchar
as
$$
declare
    nombre alias $1;
	datos RECORD;
	  espec_datos cursor for select dron_modelo as modelo,especialista_cantidad as cantidad
	  from especialista as e1
	  inner join detalle_especialista as d2 on e1.Prof_Id=d2.prof_id
	  inner join dron as d3 on d2.especialista_id=d3.especialista_id
	  where e1.Prof_nombre =$1
	  group by modelo order by modelo, cantidad asc;

begin
   for datos in espec_datos LOOP
   raise notice 'modelo: %, cantidad: %', datos.modelo, datos.cantidad;
end loop;
end;
$$
LANGUAGE plpgsql;


--Mostrar el procedimiento almacenado
select especialistadedron ('Marcos')
select especialistadedron ('Juan')
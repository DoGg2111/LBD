create trigger Sumar_Inventario_Ventas
on orden_compra
after
Insert
AS
	declare @stock int
	select @stock= cantidad from inventario_productos
					join inserted 
					on inserted.id_producto=inventario_productos.id_producto
					where inventario_productos.id_producto= inserted.id_producto
	
	update inventario_productos set cantidad=cantidad+inserted.cantidad_compra
	from inventario_productos
	join inserted
	on inserted.id_producto= inventario_productos.id_producto
	where inventario_productos.id_producto= inserted.id_producto

Create function IVA (@cantidad money)

Returns money
as
Begin
Declare @resultado money

 set @resultado  = @cantidad * 0.16
 Return (@resultado)
 end

 select nombre_prod, precio_prod,dbo.iva(precio_prod) as iva
 from productos

 create procedure Departamento_Medicamentos
@departamento int
as
Select  p.nombre_prod,p.marca_prod,d.nombre_dep
from departamento d
inner join productos p on  d.id_departamento = p.id_departamento
where d.id_departamento = @departamento

 exec Ventas_Sucursal '1';


create procedure Estado_productos
@producto int
as
 Select p.nombre_prod, ipr.cantidad,ipr.estado
from inventario_productos ipr
inner join productos p on  ipr.id_producto = p.id_producto
where ipr.id_producto = @producto

create procedure Ventas_Usuario
@ventas_usuario int
as
select COUNT(id_detalle)Ventas_Usuarios, id_usuario
from detalle_venta
group by id_usuario
having id_usuario = @ventas_usuario

create procedure Usuarios_Puesto
@puesto int
as
Select e.nombre_epdo, p.Nombre_puesto, p.Sueldo_pue
from empleados e
inner join puesto p on  e.puesto_id = p.puesto_id
where e.id_empleado = @puesto


create procedure Ventas_Sucursal
@sucursal int
as
select count(id_venta) Ventas_sucursal,id_sucursal
from venta
where id_sucursal=@sucursal
group by id_sucursal

use Farmacia	

select * from  vw_Ventas_Sucursal

create View vw_Empleados_Puesto
as
select puesto_id,count(id_empleado) Numero_de_Empleados
from empleados
group by puesto_id
go

create View vw_Compras_Proveedor
as
select count(id_proveedor) Proveedor,id_compra,fecha_compra
from orden_compra
group by id_compra,fecha_compra

go

create View vw_Ventas_Usuarios
as
select count(id_usuario) Usuario,id_detalle,sum(cantidad_det_vta) cantidad_de_venta
from detalle_venta
group by id_detalle
go

create View vw_Productos_Departamento
as
select count(id_producto)Productos_por_Departamento,id_departamento
from productos  
group by id_departamento
go

create View vw_Ventas_Sucursal
as
select count(id_sucursal) Ventas_sucursal,id_venta
from venta
group by id_venta
go

select nombre_prod, id_departamento,precio_prod
from productos
where precio_prod >(SELECT avg(precio_prod) from productos)
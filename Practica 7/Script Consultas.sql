use Farmacia



Select e.nombre_epdo, p.Nombre_puesto, p.Sueldo_pue
from empleados e
inner join puesto p on  e.puesto_id = p.puesto_id
where e.id_empleado = 1

Select pr.nombre_prod,pr.cantidad_prod,c.nombre_clas
from productos pr
inner join clasificacion c on  pr.id_clasificacion = c.id_clasificacion
where pr.id_producto = 1

Select e.Nombre_epdo, e.ap_pat_epdo, s.nombre_suc
from empleados e
inner join sucursales s on  e.id_sucursal = s.id_sucursal
where e.id_sucursal = 1

Select o.id_compra, p.nombre_prov,s.nombre_suc,o.fecha_compra
from orden_compra o
inner join proveedores p on o.id_proveedor=p.id_proveedor 
inner join sucursales s on  o.id_sucursal = s.id_sucursal
where o.id_compra=1

Select  p.nombre_prod,p.marca_prod,d.nombre_dep
from departamento d
inner join productos p on  d.id_departamento = p.id_departamento
where d.id_departamento = 1

Select e.nombre_epdo,e.ap_pat_epdo,u.usuario
from empleados e 
inner join usuarios u on  e.id_empleado = u.id_empleado
where e.id_empleado=2

Select dv.id_detalle, p.nombre_prod,u.usuario, dv.fecha_venta
from detalle_venta dv
inner join usuarios u on  dv.id_usuario = u.id_usuario
inner join venta v on  dv.id_venta = v.id_venta
inner join productos p on  dv.id_producto = p.id_producto
where dv.id_detalle = 1

Select dv.id_detalle, dv.id_venta, s.nombre_suc
from detalle_venta dv
inner join sucursales s on dv.id_sucursal = s.id_sucursal
where dv.id_detalle = 1

Select a.descripcion_alm, s.nombre_suc
from almacen a
inner join sucursales s on a.id_sucursal = s.id_sucursal
where a.id_sucursal = 1 

Select p.nombre_prod, ipr.cantidad,ipr.estado
from inventario_productos ipr
inner join productos p on  ipr.id_producto = p.id_producto
where ipr.id_producto = 1

Select e.nombre_epdo, p.Sueldo_pue
from puesto p
inner join empleados e on p.puesto_id= e.puesto_id
group by e.nombre_epdo,p.Sueldo_pue
having Sueldo_pue>3000


select puesto_id,count(id_empleado) Numero_de_Empleados
from empleados
group by puesto_id
order by puesto_id

select count(id_proveedor) Proveedor,id_compra,fecha_compra
from orden_compra
group by id_compra,fecha_compra
order by fecha_compra

select count(id_sucursal) Ventas_sucursal,id_venta
from venta
group by id_venta

select count(id_usuario) Usuario,id_detalle,sum(cantidad_det_vta) cantidad_de_venta
from detalle_venta
group by id_detalle
order by cantidad_de_venta

Select SUM(e.id_sucursal) Empleados_por_Sucursal,s.nombre_suc as Sucursal
from empleados e
INNER JOIN sucursales s on e.id_sucursal = s.id_sucursal
group by s.nombre_suc
having sum(e.id_sucursal)>1

select COUNT(id_detalle)Ventas_Usuarios, id_usuario
from detalle_venta
group by id_usuario
having id_usuario = 1

select COUNT(id_detalle)Ventas_Usuarios, id_usuario
from detalle_venta
group by id_usuario
having id_usuario = 2

select count(id_producto)Productos_por_Departamento,id_departamento
from productos  
group by id_departamento

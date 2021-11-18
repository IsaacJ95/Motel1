--Historico de ingresos por convenio.
select  extract(year from estandia.fecha_estadia), empresa_convenio.nombre_empresa, sum(pago.valor_pago) 
from empresa_convenio
inner join convenio on convenio.cod_empresa = empresa_convenio.cod_empresa
inner join registro_cliente on registro_cliente.codigo_cliente = convenio.codigo_cliente
inner join pago on registro_cliente.codigo_cliente = pago.codigo_cliente
inner join estandia on pago.cod_pago = estandia.cod_pago
group by empresa_convenio.nombre_empresa, extract(year from estandia.fecha_estadia) 
order by extract(year from estandia.fecha_estadia); 

--Historico de costos por tipo de mantenimiento a habitación por año.
select extract(year from estandia.fecha_estadia), mantenimiento.tipo_mantenimiento, mantenimiento.codigo_habitacion, sum(pago.valor_pago)
from estandia
inner join pago on pago.cod_pago = estandia.cod_pago
inner join habitacion on habitacion.numero_habitacion = estandia.numero_habitacion
inner join mantenimiento on habitacion.numero_habitacion = mantenimiento.numero_habitacion
group by extract(year from estandia.fecha_estadia), mantenimiento.tipo_mantenimiento, mantenimiento.codigo_habitacion
order by extract(year from estandia.fecha_estadia);

--Histórico por año y por taxista cuantas carreras tuve por taxista
select extract(year from estandia.fecha_estadia), taxista_comision.nombre, count(estandia.codigo_cliente)
from estandia
inner join pago on pago.cod_pago = estandia.cod_pago
inner join comision on pago.cod_pago = comision.cod_pago
inner join taxista_comision on taxista_comision.cod_comision = comision.cod_comision
group by extract(year from estandia.fecha_estadia), taxista_comision.nombre
order by extract(year from estandia.fecha_estadia);

--Histórico de tiempo promedio de uso por habitación (detallado en horas)
select extract(year from estandia.fecha_estadia), habitacion.numero_habitacion,
extract( hour from (estandia.hora_salida - estandia.hora_entrada)), sum(pago.valor_pago)
from estandia
inner join pago on pago.cod_pago = estandia.cod_pago
inner join habitacion on habitacion.numero_habitacion = estandia.numero_habitacion
group by extract(year from estandia.fecha_estadia), habitacion.numero_habitacion,
estandia.hora_entrada, estandia.hora_salida;

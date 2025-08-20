drop database if exists db_Super;
create database db_Super;
use db_Super;

create table Producto (
	codigoProducto int auto_increment,
    nombreProducto varchar(150),
    precio decimal(10,2),
    descripcion varchar(100),
    primary key PK_codigoProducto(codigoProducto)
);

create table Venta (
	codigoVenta int auto_increment,
    subtotal decimal(10,2),
    total decimal(10,2),
    descuento decimal(10,2),
    codigoProducto int,
    primary key PK_codigoVenta(codigoVenta),
    constraint FK_Venta_Producto foreign key (codigoProducto)
        references Producto(codigoProducto)
);


-- PROCEDIMIENTOS ALMACENADOS (PRODUCTO) -------------------------

-- AGREGAR PRODUCTO
Delimiter $$
create procedure sp_AgregarProducto (
	in nombreProd varchar(150),
	in precioProd decimal(10,2),
	in descripcionProd varchar(100))
begin
	insert into Producto (nombreProducto, precio, descripcion)
	values (nombreProd, precioProd, descripcionProd);
end$$
Delimiter ;

call sp_AgregarProducto('Leche Entera', 12.50, 'Leche de 1 litro');
call sp_AgregarProducto('Pan Integral', 8.75, 'Paquete de 500g');

-- LISTAR PRODUCTOS
Delimiter $$
create procedure sp_ListarProductos ()
begin
	select 
		codigoProducto,
		nombreProducto,
		precio,
		descripcion
	from Producto;
end$$
Delimiter ;

call sp_ListarProductos();

call sp_ListarProductos();

-- ELIMINAR PRODUCTO
Delimiter $$
create procedure sp_EliminarProducto (
	in codProducto int)
begin
	delete from Producto where codigoProducto = codProducto;
end$$
Delimiter ;

call sp_EliminarProducto(2);

-- BUSCAR PRODUCTO
Delimiter $$
create procedure sp_BuscarProducto (
	in codProducto int)
begin
	select 
		codigoProducto,
		nombreProducto,
		precio,
		descripcion
	from Producto 
	where codigoProducto = codProducto;
end$$
Delimiter ;

call sp_BuscarProducto(1);

-- EDITAR PRODUCTO
Delimiter $$
create procedure sp_EditarProducto (
	in codProducto int,
	in nombreProd varchar(150),
	in precioProd decimal(10,2),
	in descripcionProd varchar(100))
begin
	update Producto set nombreProducto = nombreProd, precio = precioProd, descripcion = descripcionProd
	where codigoProducto = codProducto;
end$$
Delimiter ;

call sp_EditarProducto(1, 'Leche Descremada', 13.00, 'Leche descremada de 1 litro');

---------------------------------------------------------------
-- PROCEDIMIENTOS ALMACENADOS (VENTA) -------------------------

-- AGREGAR VENTA
Delimiter $$
create procedure sp_AgregarVenta (
	in subtotalVenta decimal(10,2),
	in totalVenta decimal(10,2),
	in descuentoVenta decimal(10,2),
	in codProducto int)
begin
	insert into Venta (subtotal, total, descuento, codigoProducto)
	values (subtotalVenta, totalVenta, descuentoVenta, codProducto);
end$$
Delimiter ;

call sp_AgregarVenta(50.00, 55.00, 5.00, 1);

-- LISTAR VENTAS
Delimiter $$
create procedure sp_ListarVentas ()
begin
	select 
		codigoVenta,
		subtotal,
		total,
		descuento,
		codigoProducto
	from Venta;
end$$
Delimiter ;

call sp_ListarVentas();

-- ELIMINAR VENTA
Delimiter $$
create procedure sp_EliminarVenta (
	in codVenta int)
begin
	delete from Venta where codigoVenta = codVenta;
end$$
Delimiter ;

call sp_EliminarVenta(1);

-- BUSCAR VENTA
Delimiter $$
create procedure sp_BuscarVenta (
	in codVenta int)
begin
	select 
		codigoVenta,
		subtotal,
		total,
		descuento,
		codigoProducto
	from Venta 
	where codigoVenta = codVenta;
end$$
Delimiter ;


-- EDITAR VENTA
Delimiter $$
create procedure sp_EditarVenta (
	in codVenta int,
	in subtotalVenta decimal(10,2),
	in totalVenta decimal(10,2),
	in descuentoVenta decimal(10,2),
	in codProducto int)
begin
	update Venta set subtotal = subtotalVenta, total = totalVenta, descuento = descuentoVenta, codigoProducto = codProducto
	where codigoVenta = codVenta;
end$$
Delimiter ;

call sp_EditarVenta(1, 60.00, 66.00, 6.00, 1);

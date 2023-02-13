create database U_CommerceBD;
use U_CommerceBD;

create table Categoria(
	id_categoria INT NOT NULL AUTO_INCREMENT,
    nombre varchar(12) NOT NULL,
    descripcion varchar(200),
    primary key(id_categoria)
);
INSERT INTO `Categoria` VALUES (1,'Reposteria','La repostería, confitería o pastelería es el arte de preparar o decorar pasteles u otros postres.'),(2,'Moda y Accesorios','Las tendencias en moda y accesorios que necesitas conocer y adquirir las encuentras solo en U-Commerce');

create table Clasificacion(
	id_clasificacion INT NOT NULL AUTO_INCREMENT,
    nombre varchar(12) NOT NULL,
    descripcion varchar(200),
    primary key(id_clasificacion)
);

INSERT INTO `Clasificacion` VALUES (1,'Regular','Son productos que se venderan periodicamente según un stock diario'),(2,'Servicio','Trabajos ofrecidos de un estudiante a otro, pueden ser tutorias, cuidar mascotas, servicio de auto, etc...'),(3,'Clasificado','Son productos de venta unica, bicicletas, celulares, audifonos, etc');

create table Usuario(
	id_usuario INT NOT NULL AUTO_INCREMENT,
    nombre varchar(25) NOT NULL,
    apellido varchar(25) NOT NULL,
    codigo varchar(11) NOT NULL,
    email varchar(100) NOT NULL,
    celular varchar(10) NOT NULL,
    imagen varchar(500),
    user_password varchar(200) NOT NULL,
    primary key(id_usuario),
    unique(email),
    unique(codigo)
);
INSERT INTO `Usuario` VALUES (1,'Camilo','Marin','2172969','juancmaringcu@gmail.com','3192771146','https://static.platzi.com/media/avatars/avatars/camilo-marin527_fc4439b8-3afe-4fd1-af8a-156b74b084a6','12345678'),(4,'Deyci G','Toloza O','2171986','deycigisela.9@gmail.com','3168028970','https://phantom-marca.unidadeditorial.es/b71fee5068de22d32cba309963077ece/crop/0x0/1916x1078/resize/660/f/webp/assets/multimedia/imagenes/2021/11/04/16360442482194.jpg','12345678'),(5,'Sergio Andres','Sanchez Niño','2172018','Lsergiolsanchezl@gmail.com','3002629396','https://www.latercera.com/resizer/HdYNuxP5rQh5u86zhN7JeQ2sUnY=/900x600/smart/arc-anglerfish-arc2-prod-copesa.s3.amazonaws.com/public/GQBGXM33EFF7LCYU3PCRMRR2QU.jpg','12345678');

create table Tienda(
	id_tienda INT NOT NULL AUTO_INCREMENT,
    nombre varchar(25) NOT NULL,
    descripcion varchar(200),
    logo varchar(500),
    categoria_id int NOT NULL,
    usuario_id int NOT NULL,
    primary key(id_tienda),
    unique(nombre),
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id_categoria),
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id_usuario)
);
INSERT INTO `Tienda` VALUES (1,'Valesca','Reposteria Red Velvet','https://scontent.fbga1-4.fna.fbcdn.net/v/t1.6435-9/120842052_115228790349822_7579910948061054800_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=xUrbZXcNHL8AX9ZQy_D&_nc_ht=scontent.fbga1-4.fna&oh=00_AT9K-hRcbHLk_ppEU-9-qwYqn2uTNuPtaYbOd4USfNnhTA&oe=621F1A22',1,1),(2,'Deyci-Arte!!!','La mejor y más colorida tienda de arte del mundo mundial','https://media.airedesantafe.com.ar/p/ba625f7784b4e9395cf1cdfa9f6b39c6/adjuntos/268/imagenes/001/456/0001456924/cerebro.jpeg',2,4);

create table Seccion(
	id_seccion INT NOT NULL AUTO_INCREMENT,
    nombre varchar(50) NOT NULL,
    descripcion varchar(200),
    tienda_id int NOT NULL,
    primary key(id_seccion),
    FOREIGN KEY (tienda_id) REFERENCES Tienda(id_tienda)
);
INSERT INTO `Seccion` VALUES (1,'Galletas','Galletas de todos los colores y Sabores',1),(2,'Retratos','Encuentra tu retrato',2),(3,'Brownies','Amor por los Brownies',1),(4,'Donas','Delisiosas Donas de muchos sabores',1);

create table Producto(
	id_producto INT NOT NULL AUTO_INCREMENT,
    nombre varchar(50) NOT NULL,
    descripcion varchar(200),
    precio double NOT NULL,
    imagen varchar(500) NULL,
    seccion_id int NOT NULL,
    clasificacion_id int NOT NULL,
    primary key(id_producto),
    FOREIGN KEY (seccion_id) REFERENCES Seccion(id_seccion),
    FOREIGN KEY (clasificacion_id) REFERENCES Clasificacion(id_clasificacion)
);
INSERT INTO `Producto` VALUES (1,'Galletas Rojas','Galletas Red Velvet con chispas de chocolate',1500,'https://www.fabricadeantojos.com/wp-content/uploads/2018/09/201805-24-Galletas-Red-Velvet-02.jpg',1,1),(2,'Brownie Red Velvet!!!','Delisioso Brownie Red-Velvet con Nueces',3500,'https://www.cocinayvino.com/wp-content/uploads/2016/11/31742457_l-696x464.jpg',3,1);

create table MetodoPago(
	id_metodo_pago INT NOT NULL AUTO_INCREMENT,
    nombre varchar(12) NOT NULL,
    primary key(id_metodo_pago)
);
INSERT INTO `MetodoPago` VALUES (1,'Efectivo'),(2,'Nequi'),(3,'Daviplata');

create table Venta(
	id_venta INT NOT NULL AUTO_INCREMENT,
    tienda_id int NOT NULL,
    cliente_id int NOT NULL,
    fecha_venta datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    total_pagar double,
    metodo_pago_id int,
    primary key(id_venta),
    FOREIGN KEY (tienda_id) REFERENCES Tienda(id_tienda),
    FOREIGN KEY (cliente_id) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (metodo_pago_id) REFERENCES MetodoPago(id_metodo_pago)
);
INSERT INTO `Venta` VALUES (3,1,5,'2022-02-24 15:13:58',10000,1),(4,1,5,'2022-02-24 18:49:18',11000,2),(5,2,5,'2022-02-24 20:47:42',11000,2);

create table DetalleVenta(
	id_detalle_venta INT NOT NULL AUTO_INCREMENT,
    venta_id int NOT NULL,
    producto_id int NOT NULL,
    precio_unitario double NOT NULL,
    cantidad int NOT NULL,
    primary key(id_detalle_venta),
    FOREIGN KEY (venta_id) REFERENCES Venta(id_venta),
    FOREIGN KEY (producto_id) REFERENCES Producto(id_producto)
);

INSERT INTO `DetalleVenta` VALUES (1,3,2,3500,2),(2,3,1,1500,2);
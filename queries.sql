USE tienda;
SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, CONCAT(precio,'€'),CONCAT(precio, '$') FROM producto;
SELECT nombre, CONCAT(precio,'€') AS euros ,CONCAT(precio, '$') AS dolares FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, SUBSTRING(UPPER(nombre),1,2) AS abreviado FROM fabricante;
SELECT nombre, ROUND(precio) FROM producto;
SELECT nombre, TRUNCATE(precio,0) FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT producto.nombre, producto.precio, fabricante.nombre AS fabrica FROM producto,fabricante WHERE producto.codigo_fabricante=fabricante.codigo;
SELECT producto.nombre, producto.precio, fabricante.nombre AS fabrica FROM producto,fabricante WHERE producto.codigo_fabricante=fabricante.codigo ORDER BY fabrica ASC;
SELECT producto.codigo AS cod_prod, producto.nombre AS nom_prod, producto.codigo_fabricante, fabricante.nombre AS nom_fab FROM producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre, producto.precio, fabricante.nombre AS fabrica FROM producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo ORDER BY precio ASC LIMIT 1;
SELECT producto.nombre, producto.precio, fabricante.nombre AS fabrica FROM producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo ORDER BY precio DESC LIMIT 1;
SELECT producto.* FROM producto, fabricante WHERE producto.codigo_fabricante=fabricante.codigo && fabricante.nombre="Lenovo";
SELECT producto.* FROM producto, fabricante WHERE producto.codigo_fabricante=fabricante.codigo && fabricante.nombre="Crucial" && precio>200;
SELECT producto.* FROM producto, fabricante WHERE producto.codigo_fabricante=fabricante.codigo && (fabricante.nombre="Asus" || fabricante.nombre="Seagate" || fabricante.nombre="Hewlett-Packard");
SELECT producto.* FROM producto, fabricante WHERE producto.codigo_fabricante=fabricante.codigo && fabricante.nombre IN ("Asus","Seagate","Hewlett-Packard" );
SELECT producto.nombre, producto.precio FROM producto, fabricante WHERE producto.codigo_fabricante=fabricante.codigo && fabricante.nombre LIKE "%e";
SELECT producto.nombre, producto.precio FROM producto, fabricante WHERE producto.codigo_fabricante=fabricante.codigo && fabricante.nombre LIKE "%W%";
SELECT producto.nombre, producto.precio, fabricante.nombre AS fabrica FROM producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo && producto.precio>=180 ORDER BY producto.precio DESC, producto.nombre ASC;
SELECT DISTINCT fabricante.* FROM producto,fabricante WHERE producto.codigo_fabricante=fabricante.codigo ;
SELECT * FROM fabricante LEFT JOIN producto ON fabricante.codigo=producto.codigo_fabricante;
SELECT * FROM fabricante LEFT JOIN producto ON fabricante.codigo=producto.codigo_fabricante WHERE producto.codigo IS NULL;
SELECT producto.* FROM producto, fabricante WHERE producto.codigo_fabricante=fabricante.codigo && fabricante.nombre="Lenovo";
SELECT producto.* FROM producto WHERE producto.precio = (SELECT producto.precio FROM producto, fabricante WHERE producto.codigo_fabricante=fabricante.codigo && fabricante.nombre="Lenovo" ORDER BY producto.precio DESC LIMIT 1);
SELECT producto.nombre FROM producto, fabricante WHERE producto.codigo_fabricante=fabricante.codigo && fabricante.nombre="Lenovo" ORDER BY producto.precio DESC LIMIT 1;
SELECT producto.nombre FROM producto, fabricante WHERE producto.codigo_fabricante=fabricante.codigo && fabricante.nombre="Hewlett-Packard" ORDER BY producto.precio ASC LIMIT 1;
SELECT producto.* FROM producto WHERE producto.precio >= (SELECT producto.precio FROM producto, fabricante WHERE producto.codigo_fabricante=fabricante.codigo && fabricante.nombre="Lenovo" ORDER BY producto.precio DESC LIMIT 1);
SELECT producto.* FROM producto, fabricante WHERE producto.codigo_fabricante=fabricante.codigo && fabricante.nombre="Asus" && precio> (SELECT AVG(precio) FROM producto, fabricante WHERE producto.codigo_fabricante=fabricante.codigo && fabricante.nombre="Asus");

USE universidad;
SELECT apellido1,apellido2,nombre FROM persona WHERE tipo="alumno" ORDER BY apellido1,apellido2,nombre;
SELECT apellido1,apellido2,nombre FROM persona WHERE tipo="alumno" && telefono IS NULL ORDER BY apellido1,apellido2,nombre;
SELECT * FROM persona WHERE fecha_nacimiento>="1999-01-01" && fecha_nacimiento<="1999-12-31" ORDER BY apellido1,apellido2,nombre;
SELECT * FROM persona WHERE tipo="profesor" && telefono IS NULL && nif LIKE '________K' ORDER BY apellido1,apellido2,nombre;
SELECT * FROM asignatura WHERE cuatrimestre=1 && curso=3 && id_grado=7;
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre as departamento FROM persona, profesor, departamento WHERE persona.id=profesor.id_profesor && departamento.id=profesor.id_departamento ORDER BY persona.apellido1,persona.apellido2,persona.nombre;
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona, alumno_se_matricula_asignatura, asignatura,curso_escolar WHERE persona.nif="26902806M" && persona.id=alumno_se_matricula_asignatura.id_alumno && alumno_se_matricula_asignatura.id_asignatura=asignatura.id && alumno_se_matricula_asignatura.id_curso_escolar=curso_escolar.id;
SELECT DISTINCT departamento.nombre FROM departamento, asignatura, grado, profesor WHERE grado.nombre="Grado en Ingeniería Informática (Plan 2015)" && asignatura.id_grado=grado.id && profesor.id_departamento=departamento.id && asignatura.id_profesor IS NOT NULL;
SELECT DISTINCT persona.* FROM persona, alumno_se_matricula_asignatura, curso_escolar WHERE curso_escolar.anyo_inicio=2018 && curso_escolar.id=alumno_se_matricula_asignatura.id_curso_escolar && alumno_se_matricula_asignatura.id_alumno=persona.id ;
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre  FROM persona, departamento LEFT JOIN profesor ON departamento.id=profesor.id_departamento WHERE persona.id=profesor.id_profesor;
SELECT * FROM persona RIGHT JOIN profesor ON persona.id=profesor.id_profesor WHERE id_departamento IS NULL;
SELECT * FROM departamento LEFT JOIN profesor ON profesor.id_departamento=departamento.id WHERE profesor.id_profesor IS NULL;
SELECT persona.* FROM asignatura RIGHT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor LEFT JOIN persona ON persona.id= profesor.id_profesor WHERE asignatura.id IS null;
SELECT * FROM asignatura WHERE id_profesor IS null;
SELECT DISTINCT departamento.id, departamento.nombre FROM profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor LEFT JOIN departamento ON profesor.id_departamento=departamento.id WHERE asignatura.id IS null;
SELECT COUNT(persona.id) FROM persona WHERE persona.tipo="alumno";
SELECT COUNT(persona.id) FROM persona WHERE persona.tipo="alumno"&& persona.fecha_nacimiento>="1999-01-01" && persona.fecha_nacimiento<="1999-12-31";
SELECT departamento.nombre,COUNT(departamento.id) profes FROM departamento LEFT JOIN profesor ON departamento.id=profesor.id_departamento GROUP BY departamento.nombre ORDER BY profes DESC;
SELECT departamento.nombre, COUNT(profesor.id_profesor) profes FROM departamento LEFT JOIN profesor ON departamento.id=profesor.id_departamento GROUP BY departamento.nombre ORDER BY profes DESC;
SELECT grado.nombre, COUNT(asignatura.id) marias FROM grado LEFT JOIN asignatura on grado.id=asignatura.id_grado GROUP BY  grado.nombre ORDER BY marias desc;
SELECT grado.nombre, COUNT(asignatura.id) marias FROM grado LEFT JOIN asignatura on grado.id=asignatura.id_grado GROUP BY grado.nombre HAVING COUNT(asignatura.id)>40 ORDER BY marias desc;
SELECT grado.nombre, asignatura.tipo, sum(asignatura.creditos) creditos_totales FROM grado LEFT JOIN asignatura on grado.id=asignatura.id_grado GROUP BY grado.nombre,asignatura.tipo;
SELECT c.anyo_inicio AS curso, count(a.id_alumno) AS matriculados FROM alumno_se_matricula_asignatura a LEFT JOIN curso_escolar c ON a.id_curso_escolar = c.id GROUP BY a.id_curso_escolar;
SELECT p.id, p.nombre, p.apellido1, p.apellido2, count(a.id) AS asignaturas FROM persona p LEFT JOIN asignatura a ON p.id=a.id_profesor GROUP BY p.id ORDER BY asignaturas desc;
SELECT * FROM persona WHERE tipo="alumno" && fecha_nacimiento=(SELECT max(fecha_nacimiento) FROM persona);
SELECT persona.* FROM  profesor p LEFT JOIN asignatura a ON  p.id_profesor=a.id_profesor INNER JOIN persona ON persona.id=p.id_profesor WHERE a.id IS NULL;

















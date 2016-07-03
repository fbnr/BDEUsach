/* Hay 3 tipos de estado no más, no sé cuantos más pueden haber*/
insert into TipoEstado (nombre_estado, descripcion_estado)
values
('Habilitado', 'Este estado representa a los usuarios activos'),
('Deshabilitado', 'Este estado representa a los usuarios inactivos por voluntado propia'),
('Bloqueado', 'Este estado representa a los usuarios que fueron bloqueados por algún administrador');

/* No se me ocurren más cosas, pero aquí va la idea*/
insert into Tipo (tipo_evento, descripcion)
values
('Concierto', 'Un concierto donde muchos cantan y tocan distintos instrumentos.'),
('Obra de teatro', 'Representación artística con personificación de personajes.'),
('Ceremonia de titulación', 'Ceremonia donde a alumnos con todos sus ramos y tesis aprobada, reciben su certificado para ejercer su profesión.'),
('Exposición', 'Exposición donde una persona expone un tema de investigación de mucha experiencia para él.'),
('Entrevista', 'Reunión de dos o más personas para tratar algún asunto, generalmente profesional o de negocios.'),
('Ampliado', 'Reunión general de alumnos de la universidad para decidir sobre asuntos comunes en base a votaciones.');

/* Distintos lugares de la universidad donde se hacen cosas culturales y artisticas */
insert into Lugar (nombre_lugar, latitud, longitud)
values
('Aula Magna', -33.449942, -70.686613), /*falta agregar las coordenadas de los lugares */
('Cite-Camp', -33.446334, -70.683219),
('Departamento de Ingeniería en Informática', -33.449742, -70.687213),
('Salon Victor Jara', -33.4499988, -70.684971),
('Radio Usach', -33.4489929, -70.6818929),
('Paraninfo', -33.4489929, -70.6818929),
('Federación de estudiantes USACH', -33.4503623, -70.6861008),
('Casa Central', -33.4489929, -70.6818929),
('Foro Griego', -33.4484405, -70.6822449);

/* Existen 5 usuarios random y nosotros, como administradores de la aplicacion*/
insert into Usuario (id_tipoestado, nombre_usuario, apellido_usuario, correo_usuario, carrera_usuario, contrasenha_usuario, esAdministrador_)
values
(1, 'Jonathan', 'Simpson', 'jsimpson0@ebay.com', 'Administrative Officer', 'usach', false),
(1, 'Dennis', 'Cooper', 'dcooper1@abc.net.au', 'Software Consultant', 'usach', false),
(1, 'Steve', 'Welch', 'swelch2@wufoo.com', 'Software Consultant', 'usach', false),
(1, 'Judy', 'Price', 'jprice3@canalblog.com', 'Editor', 'usach', false),
(1, 'Robert', 'Foster', 'rfoster4@is.gd', 'Marketing Manager', 'usach', false),
(1, 'Pablo', 'Ulloa', 'pablo.ulloa@usach.cl', 'Ingeniería Ejecución en Informática', 'hola123', true),
(1, 'Francisco', 'Lopez', 'francisco.lopez.a@usach.cl', 'Ingeniería Ejecución en Informática', 'hola123', true),
(1, 'Dania', 'Montanares', 'dania.montanares@usach.cl', 'Ingeniería Civil en Informática', 'hola123', true),
(1, 'Fabian', 'Ramirez', 'fabian.ramirezr@usach.cl', 'Ingeniería Ejecución en Informática', 'hola123', true),
(1, 'Bastian', 'Toro', 'bastian.toro@usach.cl', 'Ingeniería Civil en Informática', 'hola123', true);

/* Usuarios que se siguen entre sí */
insert into UsuarioSeguidos ()
values
(1, 2), 
(2, 4);

/* Preferencias que tiene un usuario en base al tipo de eventos que existen */
insert into Preferencias (id_tipo, id_usuario)
values
(1, 1), /* al usuario 1 le gustan el tipo 1: concierto */
(2, 1), /* el usuario 1 tambien tiene preferencias con las obras de teatro */
(1, 2),
(4, 2),
(4, 3),
(3, 3),
(4, 4),
(1, 5),
(2, 5);

/* Evento culturales o artisticos que existen en la u */
insert into Evento (id_lugar, id_tipo, id_usuario, titulo_evento, inicio_evento, fin_evento, descripcion_evento, habilitado_)
values
(1, 1, 9, 'Orquesta sinfónica Usach', '2016/05/23 19:00:00', '2016/05/23 21:00:00', 'Concierto de la orquesta sinfonica de la usach para darse a conocer al estudiantado y presentar sus nuevas melodias (?).', true),
(3, 3, 6, 'Nuevos profesionales de la Informática', '2016/05/26 19:00:00', '2016/05/26 21:00:00', 'Ceremonia de titulacion donde se presentaran a los nuevos profesionales del futuro.(?)', true),
(3, 4, 8, 'Charla: Aprenda Scrum en 5 simples pasos', '2016/06/17 19:00:00', '2016/06/17 21:00:00', 'Charla de la expositora Dania Montanares para adentrar al estudiantado al uso de la metodología SCRUM y sea sencillo aprender', true),
(3, 4, 6, 'Charla: Taller de Android', '2016/04/11 15:30:00', '2016/04/11 18:40:00', 'Charla para enseñarle a los interesados a crear aplicaciones móviles.', true),
(5, 5, 7, 'Entrevista a la presidenta de la federación', '2016/07/09 15:00:00', '2016/07/09 16:00:00', 'Entrevista a la presidenta de la federacion de estudiantes de la USACH para saber su opinión sobre el movimiento estudiantil', true),
(7, 6, 10, 'Ampliado estudiantil: Petitorio de Confech', '2016/06/01 17:00:00', '2016/06/01 18:40:00', 'Se discute petitorio interno y se establece las clausulas que se adhieren', true),
(8, 4, 7, 'Discuro de Rector para alumnos nuevos 2017', '2017/01/05 10:00:00', '2017/01/05 11:00:00', 'Discurso motivacional a alumnos nuevos que ingresan el 2017 destacando el prestigio de la Universidad', true),
(3, 4, 8, 'Hackaton Universitaria', '2016/07/11 17:00:00', '2016/07/15 21:00:00', 'Encuentro para estudiantes del departamento de ingenieria de informatica cuyo objetivo es el desarrollo colaborativo de Software', true),
(9, 1, 9, 'Tocata de Hip-Hop a Beneficio', '2016/06/10 19:00:00', '2016/06/10 21:00:00', 'Tocata Hip-Hop donde se presentarán distintos grupos a cantar sus canciones.', true),
(2, 2, 10, 'Exposicion de arte de la antigua UTE', '2016/05/20 09:00:00', '2016/05/20 17:00:00', 'Presentacion de fotografias como galería de arte con respecto a la antigua universidad técnica del estado.', true);


/* tabla intermedia de los eventos, ya que un usuario puede asistir a más de un evento y a un evento pueden asistir muchos usuarios */
insert into EventoUsuario (id_evento, id_usuario)
values
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 1),
(1, 5),
(3, 2),
(3, 6),
(4, 9),
(5, 8),
(6, 10),
(7, 7),
(8, 2),
(9, 9),
(10, 4);

/* comentarios de usuarios hacia eventos existentes */
insert into Comentario (id_usuario, id_evento, texto_comentario, fecha_comentario)
values
(1, 1, 'Me encanta la música clásica!.', '2016/05/15 23:15:00'),
(4, 2, 'Pues podré ver como se realiza una ceremonia de titulación.', '2016/05/14 19:15:00'),
(3, 1, 'No me gusta mucho, pero veremos que tal', '2016/05/13 08:30:00');
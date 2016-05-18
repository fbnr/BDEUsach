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
('Exposición', 'Exposición donde una persona expone un tema de investigación de mucha experiencia para él.');

/* Distintos lugares de la universidad donde se hacen cosas culturales y artisticas */
insert into Lugar (nombre_lugar, latitud, longitud)
values
('Aula Magna', -33.449942, -70.686613), /*falta agregar las coordenadas de los lugares */
('Cite-Camp', -33.446334, -70.683219),
('Departamento de Ingeniería en Informática', -33.449742, -70.687213),
('Salon Victor Jara', -33.450082, -70.685113);

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
(1, 2), /* no se como se colocan */
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
insert into Evento (id_lugar, id_tipo, id_usuario, titulo_evento, inicio_evento, fin_evento, fecha_evento, descripcion_evento)
values
(1, 1, 9, 'Orquesta sinfónica Usach', '19:00:00', '21:00:00', '2016/05/23', 'Concierto de la orquesta sinfonica de la usach para darse a conocer al estudiantado y presentar sus nuevas melodias (?).'),
(3, 3, 6, 'Nuevos profesionales de la Informática', '19:00:00', '21:00:00', '2016/05/26', 'Ceremonia de titulacion donde se presentaran a los nuevos profesionales del futuro.(?)');

/* tabla intermedia de los eventos, ya que un usuario puede asistir a más de un evento y a un evento pueden asistir muchos usuarios */
insert into EventoUsuario (id_evento, id_usuario)
values
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(1, 5),
(2, 1);

/* comentarios de usuarios hacia eventos existentes */
insert into Comentario (id_usuario, id_evento, texto_comentario, fecha_comentario)
values
(1, 1, 'Me encanta la música clásica!.', '2016/05/15 23:15:00'),
(4, 2, 'Pues podré ver como se realiza una ceremonia de titulación.', '2016/05/14 19:15:00'),
(3, 1, 'No me gusta mucho, pero veremos que tal', '2016/05/13 08:30:00');
1.- Obtener la fecha del comentario de un evento en el cual Jonathan haya asistido.

SELECT c.fecha_comentario FROM Comentario c, EventoUsuario eu, Evento e, Usuario u
WHERE u.nombre_usuario = 'Jonathan'
AND u.id_usuario = eu.id_usuario
AND eu.id_evento = e.id_evento
AND e.id_evento = c.id_evento
AND u.id_usuario = c.id_usuario;

2.- Obtener el nombre de todos los usuarios que hayan asistido a cualquier evento en el Aula Magna

SELECT u.nombre_usuario FROM Usuario u, Lugar l, Evento e, EventoUsuario eu
WHERE l.nombre_lugar = 'Aula Magna'
AND l.id_lugar = e.id_lugar
AND e.id_evento = eu.id_evento
AND eu.id_usuario = u.id_usuario;

3.- Obtener el nombre de las preferencias que tiene un usuario que haya asistido a la Orquesta sinfónica Usach

SELECT t.tipo_evento FROM Tipo t, Preferencias p, Usuario u, EventoUsuario eu, Evento e
WHERE e.titulo_evento = 'Orquesta sinfónica Usach'
AND u.nombre_usuario = 'Jonathan'
AND e.id_evento = eu.id_evento
AND eu.id_usuario = u.id_usuario
AND u.id_usuario = p.id_usuario
AND p.id_tipo = t.id_tipo;
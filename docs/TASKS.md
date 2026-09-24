# Tareas Greenmove

## Base tecnica

- [x] Mover migracion inicial a `backend/src/main/resources/db/migration/V1__initial_schema.sql`.
- [x] Mover `application-local.example.properties` a `backend/src/main/resources`.
- [x] Activar Flyway y usar `ddl-auto=validate` en Docker.
- [x] Eliminar MySQL del backend.
- [x] Conservar PostgreSQL/PostGIS.
- [x] Iniciar renombre progresivo de RAITE a Greenmove.
- [x] Unificar tipos oficiales.
- [x] Limpiar `.gitignore`.
- [x] Actualizar README y setup.
- [x] Crear `AGENTS.md` y documentos fuente de verdad.
- [x] Ejecutar y dejar en verde `docker compose config`.
- [x] Ejecutar y dejar en verde `docker compose run --rm backend mvn clean test`.
- [x] Ejecutar validacion local `mvn clean test` mientras Docker Desktop no esta disponible.

## Producto

- [ ] Definir modelo minimo de usuario.
- [ ] Definir modelo minimo de publicacion.
- [ ] Documentar errores y respuestas API.
- [ ] Agregar datos semilla ficticios.

## No iniciar todavia

- [ ] Sistema visual.
- [ ] Pantallas finales.
- [ ] Capacitor.

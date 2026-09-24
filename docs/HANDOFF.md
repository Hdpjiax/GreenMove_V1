# Handoff

## 2026-09-24 - Base tecnica

### Cambios

- Migracion inicial movida a la ruta Flyway esperada.
- Configuracion Docker corregida para Flyway activo y `ddl-auto=validate`.
- MySQL eliminado del POM.
- PostgreSQL/PostGIS conservado.
- Paquetes Java iniciados bajo `mx.edu.greenmove`.
- Tipos oficiales unificados: `UBER_SPLIT`, `OWN_CAR`, `RIDE_REQUEST`.
- Documentos fuente de verdad creados o actualizados.

### Pruebas

- `docker compose config`: OK. Docker emitio una advertencia de permisos al leer `C:\Users\Antonio Garcia\.docker\config.json`, pero genero la configuracion.
- `docker compose run --rm backend mvn clean test`: bloqueado porque Docker Desktop/daemon no esta corriendo (`//./pipe/docker_engine` no existe).
- `mvn clean test` local en `backend`: OK, `BUILD SUCCESS`; Maven reporto que no hay tests definidos todavia.

### Pendientes

- Completar modelo relacional real en migraciones futuras.
- Convertir placeholders Java a entidades, repositorios, servicios y controladores reales.
- Iniciar Docker Desktop y repetir `docker compose run --rm backend mvn clean test`.
- Implementar diseno solo despues de cerrar la base tecnica.

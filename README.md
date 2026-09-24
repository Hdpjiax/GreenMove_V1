# Greenmove

Greenmove es una aplicacion universitaria mobile-first para coordinar traslados entre estudiantes. La base tecnica actual conserva el esqueleto Vue/Ionic y Spring Boot, con PostgreSQL/PostGIS y migraciones Flyway.

## Stack base

- Frontend: Vue 3, Vite e Ionic Vue.
- Backend: Java 21, Spring Boot y Maven.
- Base de datos: PostgreSQL con PostGIS.
- Migraciones: Flyway en `backend/src/main/resources/db/migration`.
- Desarrollo local: Docker Compose.

## Tipos oficiales de publicacion

- `UBER_SPLIT`: Comparto Uber.
- `OWN_CAR`: Tengo auto.
- `RIDE_REQUEST`: Necesito raite.

No hay pagos, comisiones, conductores profesionales ni marketplace de choferes dentro del alcance del MVP.

## Primeros comandos

```powershell
.\setup.ps1
docker compose config
docker compose up database
docker compose run --rm backend mvn clean test
```

## Documentos fuente de verdad

- `docs/PRODUCT.md`: alcance de producto y vocabulario.
- `docs/DESIGN_SYSTEM.md`: direccion visual futura; no implementada en esta fase.
- `docs/API.md`: contrato humano inicial de la API.
- `docs/openapi.yaml`: contrato OpenAPI base.
- `docs/DECISIONS.md`: decisiones tecnicas y de producto.
- `docs/TASKS.md`: tareas pequenas con criterios de aceptacion.
- `docs/HANDOFF.md`: bitacora de cambios, pruebas y pendientes.

Antes de cambiar rutas, modelos o tipos, actualiza los documentos correspondientes y ejecuta las pruebas.

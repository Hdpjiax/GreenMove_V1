# Decisiones

## 2026-09-24 - Base tecnica Greenmove

- Se conserva Spring Boot con Maven para backend.
- Se conserva Vue 3/Vite/Ionic Vue para frontend.
- Se usa PostgreSQL con PostGIS; MySQL queda fuera del proyecto.
- Se usa Flyway para migraciones en `backend/src/main/resources/db/migration`.
- Hibernate debe validar el esquema con `spring.jpa.hibernate.ddl-auto=validate`.
- Los tipos oficiales son `UBER_SPLIT`, `OWN_CAR` y `RIDE_REQUEST`.
- El renombre de RAITE a Greenmove sera progresivo, evitando reemplazos globales ciegos.

## 2026-09-24 - Diseno visual en pausa

- No se implementa el diseno en esta fase.
- La prioridad es dejar la base tecnica verificable con Docker Compose y pruebas.

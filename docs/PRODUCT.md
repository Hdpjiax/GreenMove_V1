# Producto Greenmove

## Alcance

Greenmove coordina traslados entre estudiantes mediante un muro universitario. El MVP debe permitir publicar, buscar y responder a tres situaciones de movilidad, sin pagos dentro de la app.

## Tres publicaciones oficiales

| Codigo | Etiqueta visible | Descripcion |
| --- | --- | --- |
| `UBER_SPLIT` | Comparto Uber | Un estudiante ya tomara Uber y busca dividir costo. |
| `OWN_CAR` | Tengo auto | Un estudiante ofrece lugares y paradas con cooperacion voluntaria. |
| `RIDE_REQUEST` | Necesito raite | Un estudiante solicita que alguien pase por el. |

## Vocabulario permitido

- estudiante
- companero
- persona que publica
- solicitante
- participante
- cooperacion sugerida
- dividir costo
- lugares disponibles

## Vocabulario a evitar

- chofer profesional
- cliente
- tarifa cobrada
- ganancias
- comision
- marketplace de conductores

## Fuera de alcance del MVP

- Pagos, wallet, comisiones o retencion de dinero.
- Seguimiento GPS continuo.
- Verificacion gubernamental de identidad.
- Optimizacion automatica de rutas con IA.
- Marketplace de conductores.
- Viajes anonimos o cuentas no universitarias.

## Base tecnica vigente

- Frontend: Vue 3, Vite, Ionic Vue.
- Backend: Java 21, Spring Boot, Maven.
- Base de datos: PostgreSQL con PostGIS.
- Migraciones: Flyway.
- Desarrollo local: Docker Compose.

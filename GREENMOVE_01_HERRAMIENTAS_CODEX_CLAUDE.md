# Greenmove — Herramientas, configuración y skills para Codex + Claude Code

> Guía operativa para Windows + VS Code. Complementa a `GREENMOVE_02_PLAN_MAESTRO_EJECUCION.md`.

## 1. Resultado buscado

Construir Greenmove desde cero usando como referencia:

- La estructura del ZIP `RAITE_CAMPUS_ESTRUCTURA_INICIAL`: frontend, backend, database y docs.
- Las diez pantallas y el lenguaje visual del ZIP de Stitch.
- Un solo repositorio compartido por Codex Desktop y Claude Code en VS Code.
- Web móvil primero, PWA instalable y, al final, empaquetado Android/iOS con Capacitor.

Greenmove **no es Uber ni una plataforma de conductores**. Es un muro universitario con solo tres publicaciones:

1. **Comparto Uber**: un estudiante ya tomará Uber y busca dividir costo.
2. **Tengo auto**: un estudiante ofrece lugares y paradas con cooperación voluntaria.
3. **Necesito raite**: un estudiante solicita que alguien pase por él.

No habrá pagos dentro de la app. La cuota mostrada es informativa y el acuerdo ocurre directamente entre estudiantes.

---

## 2. Decisión técnica recomendada

| Capa | Elección principal | Motivo |
|---|---|---|
| Frontend | Vue 3 + TypeScript + Vite + Ionic Vue | Aprovecha el esqueleto existente y favorece UI móvil |
| Estilos | Tailwind CSS + tokens propios | Traduce el diseño de Stitch sin copiar HTML desechable |
| Estado remoto | TanStack Query para Vue | Caché, reintentos y estados de carga consistentes |
| Formularios | VeeValidate + Zod | Validación compartible y tipada |
| Mapas | MapLibre GL JS | Mapa vectorial abierto y personalizable |
| App nativa | Capacitor | Convierte la misma web en Android/iOS sin reescribirla |
| Backend | Java 21 + Spring Boot + Maven | Encaja con la estructura entregada y luce sólido académicamente |
| Base de datos | PostgreSQL + PostGIS | Relaciones, consultas geográficas y crecimiento futuro |
| Migraciones | Flyway | Esquema versionado y reproducible |
| API | REST + OpenAPI | Contrato claro para dos agentes y pruebas automáticas |
| Tiempo real | WebSocket/SSE solo para estados y chat | Evita sobreingeniería del MVP |
| Desarrollo local | Docker Compose | PostgreSQL idéntico para todo el equipo |
| CI | GitHub Actions | Build, pruebas, accesibilidad y seguridad en cada PR |
| Despliegue sugerido | Frontend en Cloudflare Pages; API + PostgreSQL en Railway | Arranque simple; cambiar según presupuesto escolar |

### Por qué no migrar ahora a React

El ZIP base ya usa Vue 3 e Ionic Vue. Migrar a React no mejora el producto y consume tokens, tiempo y pruebas. El diseño de Stitch es HTML/Tailwind y puede convertirse igual de bien a componentes Vue. La originalidad vendrá del sistema visual, las microinteracciones y la lógica, no del nombre del framework.

---

## 3. Cómo “conectar” Codex Desktop y Claude Code correctamente

No se conectan como dos chats que se hablan en vivo. La integración estable es:

```text
Codex Desktop ─┐
               ├─ mismo repositorio Git ─ contratos/docs ─ CI
Claude Code ───┘
```

Ambos deben abrir la **misma carpeta raíz**, pero nunca editar simultáneamente los mismos archivos. Para trabajo paralelo, usar ramas o worktrees separados.

### 3.1 Requisitos en Windows

Instalar:

- [Git for Windows](https://git-scm.com/download/win)
- [Node.js LTS](https://nodejs.org/en/download)
- [Java 21 Temurin](https://adoptium.net/temurin/releases/?version=21)
- [Docker Desktop](https://docs.docker.com/desktop/setup/install/windows-install/)
- [VS Code](https://code.visualstudio.com/download)
- [Claude Code para VS Code](https://docs.anthropic.com/en/docs/claude-code/ide-integrations)
- Codex Desktop y, opcionalmente, [Codex CLI](https://developers.openai.com/codex/cli)

Comprobar en PowerShell:

```powershell
git --version
node --version
npm --version
java --version
docker --version
```

### 3.2 Crear el repositorio compartido

```powershell
mkdir greenmove
cd greenmove
git init
git branch -M main
```

Copiar dentro la estructura base y renombrar textos, paquetes y referencias de `raite-campus` a `greenmove` de forma controlada. No hacer reemplazo global ciego.

Abrir la carpeta `greenmove` en Codex Desktop y en VS Code. En Claude Code, confirmar que el directorio de trabajo sea esa misma raíz.

### 3.3 Ramas de propiedad

```powershell
git checkout -b codex/architecture
git worktree add ..\greenmove-claude -b claude/design-system main
```

- Codex trabaja en `greenmove` sobre `codex/*`.
- Claude trabaja en `greenmove-claude` sobre `claude/*`.
- Integrar por PR o cherry-pick solo después de pruebas.
- Nunca dar a ambos agentes la orden “arregla todo el proyecto”.

### 3.4 Archivos de coordinación obligatorios

| Archivo | Quién lo mantiene | Función |
|---|---|---|
| `AGENTS.md` | Codex | Reglas globales que Codex lee automáticamente |
| `CLAUDE.md` | Claude | Reglas globales de Claude Code |
| `docs/PRODUCT.md` | Producto | Alcance, tres publicaciones y exclusiones |
| `docs/DESIGN_SYSTEM.md` | Claude | Tokens, componentes y estados visuales |
| `docs/openapi.yaml` | Codex | Contrato frontend/backend |
| `docs/DECISIONS.md` | Ambos | ADR cortos: decisión, razón y fecha |
| `docs/HANDOFF.md` | Agente saliente | Qué cambió, pruebas, pendientes y archivos tocados |
| `docs/TASKS.md` | Orquestador | Tareas pequeñas con dueño y criterio de aceptación |

---

## 4. Modelos recomendados y ahorro

### Codex

| Trabajo | Modelo | Esfuerzo |
|---|---|---|
| Uso diario, features, backend, integración | **GPT-6 Sol** | Medium |
| Arquitectura crítica, migraciones complejas, auditoría final | **GPT-6 Astra** | Light/Low al inicio; High solo si falla |
| Renombres, tests repetitivos, documentación, extracción | **GPT-6 Luna** | High con tarea estrecha |

Selección recomendada: 80% Sol, 15% Luna, 5% Astra. No usar Astra para CRUD rutinario. La disponibilidad depende de la cuenta y el cliente. Referencia: [modelos de Codex](https://developers.openai.com/codex/models).

### Claude Code

| Trabajo | Modelo | Uso |
|---|---|---|
| Implementación UI diaria y refactor de componentes | **Claude Sonnet 5** | Principal por equilibrio velocidad/calidad |
| Revisión visual/arquitectónica difícil | **Claude Opus 5.5** | Solo hitos o bugs difíciles |
| Búsqueda, inventarios y cambios mecánicos | **Claude Haiku 4.5** | Subagentes baratos y rápidos |

Si aparece Claude Fable 5.1 y el plan lo permite, reservarlo para razonamiento de largo horizonte, no para maquetar tarjetas. Referencia: [modelos Claude](https://docs.anthropic.com/en/docs/about-claude/models/overview).

### Reglas que reducen tokens de ambos

1. Una tarea = un objetivo = máximo 3–8 archivos.
2. Dar rutas exactas y criterio de aceptación; no pegar todo el repositorio.
3. Guardar decisiones en archivos y pedir “lee solo X, Y y Z”.
4. Usar un agente barato para explorar y uno fuerte para decidir.
5. No pedir a ambos que implementen lo mismo; uno implementa y el otro revisa el diff.
6. Ejecutar pruebas locales antes de pedir una segunda revisión.
7. Entregar diffs y errores concretos, no capturas largas ni logs completos.
8. Reiniciar contexto al cambiar de fase y conservar `HANDOFF.md`.
9. Limitar agentes paralelos a tareas sin archivos compartidos.
10. Prohibir “mejora todo”, “hazlo más bonito” o “termina la app” sin checklist.

Plantilla económica:

```text
Objetivo: [un resultado verificable].
Lee únicamente: [rutas].
Puedes editar: [rutas].
No cambies: [rutas/contratos].
Criterios de aceptación:
- [prueba o comportamiento 1]
- [prueba o comportamiento 2]
Ejecuta: [comandos de validación].
Entrega: resumen, archivos cambiados, pruebas y riesgos. Sin explicación extensa.
```

---

## 5. Herramientas UX/UI — 7 opciones

No instalar las siete dentro del bundle. La tabla separa herramientas de creación, inspección y validación.

| Herramienta | Rol | Uso en Greenmove | Enlace |
|---|---|---|---|
| Google Stitch | Generación e iteración de pantallas | Fuente visual y `DESIGN.md` | [Stitch](https://stitch.withgoogle.com/) |
| Stitch MCP | Consultar proyectos/diseños desde agentes compatibles | Iteración de diseño sin pegar pantallas | [Configuración MCP](https://stitch.withgoogle.com/docs/mcp/setup/) |
| Penpot | Diseño colaborativo open source | Wireframes y prototipo editable | [GitHub](https://github.com/penpot/penpot) |
| Storybook | Catálogo de componentes/estados | Revisar tarjetas, botones, sheets y vacíos | [GitHub](https://github.com/storybookjs/storybook) |
| Lucide | Iconos SVG consistentes | Sustituir emojis/iconos improvisados | [GitHub](https://github.com/lucide-icons/lucide) |
| Contrast Grid | Contraste de combinaciones | Validar amarillo/morado/verde con negro | [Sitio](https://contrast-grid.eightshapes.com/) |
| axe DevTools/core | Accesibilidad automática | WCAG, roles, labels y contraste | [GitHub](https://github.com/dequelabs/axe-core) |

**Núcleo recomendado:** Stitch + Storybook + Lucide + axe. Penpot es opcional si el equipo quiere editar a mano.

---

## 6. Herramientas frontend — 7 opciones

| Herramienta | Función | Instalación/uso | Enlace |
|---|---|---|---|
| Vue 3 | Componentes | Ya existe; migrar JS a TS gradualmente | [Docs](https://vuejs.org/) |
| Vite | Build y desarrollo | Ya existe; conservar | [GitHub](https://github.com/vitejs/vite) |
| Ionic Vue | Shell y patrones móviles | Navegación, safe areas, modales | [Docs](https://ionicframework.com/docs/vue/overview) |
| Tailwind CSS | Tokens/utilidades | Usar config, no CDN de las maquetas | [GitHub](https://github.com/tailwindlabs/tailwindcss) |
| TanStack Query | Datos remotos | Feed, detalle, perfil y mutaciones | [Vue Query](https://tanstack.com/query/latest/docs/framework/vue/overview) |
| VeeValidate + Zod | Formularios y contratos | Registro y tres publicadores | [VeeValidate](https://vee-validate.logaretm.com/) / [Zod](https://github.com/colinhacks/zod) |
| MapLibre GL JS | Mapa vectorial | Pines, rutas y bottom sheet | [GitHub](https://github.com/maplibre/maplibre-gl-js) |

Agregar Capacitor al cerrar el MVP web, no el día uno:

```powershell
npm install @capacitor/core @capacitor/cli
npx cap init Greenmove mx.edu.greenmove
npm install @capacitor/android @capacitor/ios
npx cap add android
```

Referencia: [instalación de Capacitor](https://capacitorjs.com/docs/getting-started).

---

## 7. Herramientas backend — 7 opciones

| Herramienta | Función | Regla Greenmove | Enlace |
|---|---|---|---|
| Spring Boot | API | Mantener controladores delgados | [GitHub](https://github.com/spring-projects/spring-boot) |
| Spring Security | Autenticación/autorización | Correo verificado + JWT/refresh seguro | [Docs](https://docs.spring.io/spring-security/reference/) |
| Spring Data JPA | Persistencia | Repositorios, paginación y proyecciones | [Docs](https://spring.io/projects/spring-data-jpa) |
| Bean Validation | Validación servidor | Nunca confiar en el frontend | [Hibernate Validator](https://hibernate.org/validator/) |
| springdoc-openapi | Contrato y Swagger UI | Generar/validar API | [GitHub](https://github.com/springdoc/springdoc-openapi) |
| MapStruct | DTO ↔ entidad | Evitar exponer entidades JPA | [GitHub](https://github.com/mapstruct/mapstruct) |
| Testcontainers | Integración real | Probar con PostgreSQL, no H2 | [GitHub](https://github.com/testcontainers/testcontainers-java) |

---

## 8. Herramientas de base de datos — 7 opciones

| Herramienta | Función | Uso | Enlace |
|---|---|---|---|
| PostgreSQL | Base relacional | Fuente de verdad | [Sitio](https://www.postgresql.org/) |
| PostGIS | Geografía | Puntos, distancia y radio | [Sitio](https://postgis.net/) |
| Flyway | Migraciones | `V1__...sql`, nunca editar migración aplicada | [GitHub](https://github.com/flyway/flyway) |
| Docker Compose | Entorno local | DB reproducible | [Docs](https://docs.docker.com/compose/) |
| pgAdmin | Inspección visual | Solo desarrollo | [Sitio](https://www.pgadmin.org/) |
| DBeaver Community | Cliente alternativo | Consultas y ERD | [GitHub](https://github.com/dbeaver/dbeaver) |
| dbdiagram | Diagrama ER | Presentación académica y revisión | [Sitio](https://dbdiagram.io/) |

---

## 9. Herramientas QA — 7 opciones

| Herramienta | Cobertura | Criterio | Enlace |
|---|---|---|---|
| Vitest | Unitarias frontend | Stores, utilidades y validadores | [GitHub](https://github.com/vitest-dev/vitest) |
| Vue Testing Library | Componentes | Probar como usuario, no internals | [Docs](https://testing-library.com/docs/vue-testing-library/intro/) |
| Playwright | E2E y responsive | 360×800, 390×844, tablet y desktop | [GitHub](https://github.com/microsoft/playwright) |
| axe-core | Accesibilidad | Cero violaciones críticas | [GitHub](https://github.com/dequelabs/axe-core) |
| Lighthouse CI | PWA/rendimiento | Presupuestos automáticos | [GitHub](https://github.com/GoogleChrome/lighthouse-ci) |
| JUnit 5 + Mockito | Unitarias backend | Servicios y permisos | [JUnit](https://junit.org/junit5/) / [Mockito](https://github.com/mockito/mockito) |
| REST Assured + Testcontainers | API/integración | Casos felices y prohibidos con DB real | [REST Assured](https://github.com/rest-assured/rest-assured) |

---

## 10. Seguridad, calidad y DevOps — 7 opciones

| Herramienta | Uso | Enlace |
|---|---|---|
| GitHub Actions | CI por PR | [Docs](https://docs.github.com/actions) |
| Dependabot | Actualización de dependencias | [Docs](https://docs.github.com/code-security/dependabot) |
| OWASP Dependency-Check | CVE Java | [GitHub](https://github.com/dependency-check/DependencyCheck) |
| Semgrep Community | Reglas SAST | [GitHub](https://github.com/semgrep/semgrep) |
| Trivy | Imágenes/contenedores | [GitHub](https://github.com/aquasecurity/trivy) |
| ESLint + Prettier | Calidad frontend | [ESLint](https://eslint.org/) / [Prettier](https://prettier.io/) |
| Spotless | Formato Java | [GitHub](https://github.com/diffplug/spotless) |

---

## 11. MCP: qué conectar y qué no

MCP conecta un agente con herramientas/contexto externo; no convierte automáticamente a Codex y Claude en compañeros de chat. Referencias: [MCP en Codex](https://developers.openai.com/codex/mcp) y [MCP en Claude Code](https://docs.anthropic.com/en/docs/claude-code/mcp).

Conectar solo:

1. **Stitch MCP**, para leer/generar diseños cuando esté disponible en la cuenta.
2. **GitHub MCP**, si el equipo trabajará con issues/PR desde el agente.
3. **PostgreSQL de desarrollo en modo lectura**, solo para inspección; las mutaciones van por Flyway.
4. **Playwright/browser**, para QA visual controlado.

No conectar producción, cuentas personales ni credenciales de alumnos durante el desarrollo escolar. Guardar secretos en `.env.local` y proporcionar únicamente `.env.example` sin valores.

---

## 12. Skill reutilizable para Codex

Codex usa `AGENTS.md` para reglas permanentes del repositorio y skills para flujos repetibles. Documentación: [AGENTS.md](https://developers.openai.com/codex/agent-configuration/agents-md) y [Skills](https://developers.openai.com/codex/build-skills).

Crear una skill llamada `build-mobile-first-campus-app` con esta estructura:

```text
build-mobile-first-campus-app/
├── SKILL.md
├── agents/openai.yaml
├── references/
│   ├── design-system.md
│   ├── architecture.md
│   └── quality-gates.md
└── scripts/
    └── verify-project.ps1
```

Contenido propuesto de `SKILL.md`:

```markdown
---
name: build-mobile-first-campus-app
description: Diseñar, implementar y verificar aplicaciones universitarias mobile-first con frontend Vue/Ionic, backend Spring Boot, PostgreSQL, contratos OpenAPI, accesibilidad y Capacitor. Usar al crear features completas, convertir maquetas Stitch a componentes, revisar arquitectura o preparar una web para Android/iOS.
---

# Flujo

1. Leer AGENTS.md, PRODUCT.md, DESIGN_SYSTEM.md, openapi.yaml y la tarea asignada.
2. Confirmar alcance, archivos permitidos y criterios de aceptación.
3. Reutilizar tokens y componentes; no copiar HTML de prototipo directamente.
4. Implementar el corte vertical mínimo: datos, API, UI, errores y pruebas.
5. Validar móvil primero en 360, 390 y 430 px; después tablet y desktop.
6. Ejecutar pruebas relevantes, lint, tipos y build.
7. Entregar diff resumido, comandos ejecutados, resultados y riesgos.

# Guardas

- No inventar endpoints fuera de OpenAPI.
- No cambiar migraciones aplicadas; crear una nueva.
- No usar layouts genéricos ni gradientes decorativos sin token.
- No introducir pagos ni rol de conductor profesional.
- No usar datos personales reales.
- No declarar terminado si falta un estado: carga, vacío, error, offline o éxito.
```

En Codex Desktop, crear/instalar la skill desde la interfaz de Skills o siguiendo la ubicación que muestre la versión instalada. No asumir una ruta fija entre versiones. Mantener `AGENTS.md` dentro del repositorio para que el proyecto también funcione sin la skill global.

### `AGENTS.md` mínimo del proyecto

```markdown
# Greenmove

Lee docs/PRODUCT.md, docs/DESIGN_SYSTEM.md y docs/openapi.yaml antes de editar.
Greenmove conecta estudiantes mediante tres tipos de publicación: UBER_SPLIT, OWN_CAR y RIDE_REQUEST. No modelar conductores profesionales ni pagos internos.

## Arquitectura
- frontend: Vue 3 + TypeScript + Ionic + Tailwind.
- backend: Java 21 + Spring Boot.
- database: PostgreSQL/PostGIS + Flyway.
- mobile: Capacitor después de aprobar el MVP web.

## Trabajo
- Tareas pequeñas, rutas explícitas y sin cambios colaterales.
- No editar archivos asignados a otro agente.
- Actualizar OpenAPI antes de cambiar contrato.
- Añadir pruebas y ejecutar lint/typecheck/test/build.
- Registrar decisiones no obvias en docs/DECISIONS.md.

## Diseño
- Mobile-first, táctil, accesible y original.
- Seguir los tokens Greenmove; no copiar el HTML Stitch como producción.
- Cubrir carga, vacío, error, offline, éxito y permisos denegados.
```

---

## 13. Skill reutilizable para Claude Code

Claude Code admite skills con carga progresiva y subagentes que precargan skills. Referencias: [Skills](https://docs.anthropic.com/en/docs/claude-code/skills) y [subagentes](https://docs.anthropic.com/en/docs/claude-code/sub-agents).

Guardar en el proyecto como:

```text
.claude/skills/greenmove-ui/SKILL.md
```

Contenido:

```markdown
---
name: greenmove-ui
description: Convertir diseños Stitch y sistemas visuales neo-brutalistas en interfaces Vue/Ionic mobile-first, accesibles, originales y listas para producción. Usar al crear o revisar pantallas, componentes, tokens, responsive, Storybook y pruebas visuales.
---

# Flujo obligatorio

1. Leer CLAUDE.md, docs/PRODUCT.md y docs/DESIGN_SYSTEM.md.
2. Inspeccionar la referencia visual y describir jerarquía, tokens y estados antes de codificar.
3. Construir componentes semánticos; no pegar una página HTML monolítica.
4. Usar tokens CSS/Tailwind; no colores, radios o sombras arbitrarios.
5. Diseñar primero 390x844 y verificar 360x800, 430x932, 768x1024 y 1440x900.
6. Añadir estados de carga, vacío, error, éxito, offline y permiso denegado.
7. Verificar teclado, foco visible, labels, contraste y objetivos táctiles >= 44x44.
8. Ejecutar Storybook/tests/build y devolver solo cambios, evidencia y pendientes.

# Identidad

- Neo-Brutalist Pop Universitario, no dashboard SaaS.
- Fondo marfil, amarillo energético, morado comunitario y verde impacto.
- Bordes negros 2–3 px, sombras sólidas desplazadas y Plus Jakarta Sans.
- Densidad móvil controlada, lenguaje mexicano universitario y CTA evidente.
- Evitar gradientes genéricos, glassmorphism indiscriminado y tarjetas idénticas.

# Dominio

Solo UBER_SPLIT, OWN_CAR y RIDE_REQUEST. Nunca llamar conductor profesional a un estudiante. La cooperación es informativa y no se procesa en Greenmove.
```

### `CLAUDE.md` mínimo

```markdown
# Greenmove rules

Before editing, read docs/PRODUCT.md, docs/DESIGN_SYSTEM.md, docs/openapi.yaml and docs/TASKS.md.
Own the frontend design system and accessibility. Do not change backend contracts or database migrations unless the task explicitly assigns them.
Use Vue 3 + TypeScript + Ionic + Tailwind. Keep Stitch as visual reference, not production code.
Every UI task must cover mobile breakpoints, interaction states, accessibility and tests.
Return concise handoff notes in docs/HANDOFF.md.
```

### Subagente Claude especializado

Guardar `.claude/agents/ui-reviewer.md`:

```markdown
---
name: ui-reviewer
description: Revisa diffs de interfaz Greenmove por fidelidad visual, accesibilidad, responsive y estados.
skills:
  - greenmove-ui
memory: project
---

Revisa únicamente el diff entregado. No implementes. Reporta hallazgos por severidad, archivo, evidencia y corrección mínima. Rechaza layouts SaaS genéricos, valores fuera de tokens, objetivos táctiles pequeños y estados faltantes.
```

---

## 14. Prompts de arranque separados

### Prompt para Codex Desktop

```text
Trabaja como arquitecto e integrador principal de Greenmove. Lee AGENTS.md y los docs enlazados. Inspecciona la tarea actual en docs/TASKS.md. Implementa solo los archivos asignados a Codex. Conserva Vue/Ionic en frontend, Spring Boot en backend y PostgreSQL/Flyway. Mantén exactamente tres tipos de publicación: UBER_SPLIT, OWN_CAR y RIDE_REQUEST; no hay conductores profesionales ni pagos internos. Antes de editar, declara contrato y pruebas; al finalizar ejecuta validaciones y actualiza HANDOFF.md. No toques archivos bajo trabajo de Claude.
```

### Prompt para Claude Code en VS Code

```text
Usa la skill greenmove-ui. Lee CLAUDE.md, PRODUCT.md, DESIGN_SYSTEM.md, openapi.yaml y tu tarea. Convierte la referencia Stitch en componentes Vue/Ionic originales y accesibles; no pegues el HTML generado. Implementa solo los archivos asignados a Claude y no cambies contratos backend. Verifica 360/390/430 px, tablet y desktop; cubre carga, vacío, error, offline y éxito. Ejecuta pruebas y deja un handoff corto con archivos, comandos, evidencia y pendientes.
```

### Prompt de revisión cruzada barato

```text
Revisa el diff desde [commit A] hasta [commit B]. No edites. Busca únicamente: regresiones de contrato, archivos fuera de propiedad, falta de pruebas, accesibilidad crítica y ruptura móvil. Devuelve máximo 10 hallazgos con severidad, ruta y corrección mínima.
```

---

## 15. Checklist de configuración terminada

- [ ] Ambos agentes abren el mismo repositorio o worktrees del mismo repositorio.
- [ ] `AGENTS.md` y `CLAUDE.md` existen y no se contradicen.
- [ ] `PRODUCT.md`, `DESIGN_SYSTEM.md` y `openapi.yaml` son la fuente de verdad.
- [ ] Cada tarea declara dueño y archivos permitidos.
- [ ] PostgreSQL corre por Docker Compose.
- [ ] Secretos están fuera de Git.
- [ ] CI ejecuta frontend, backend, E2E, accesibilidad y seguridad.
- [ ] Skills fueron guardadas en cada herramienta y probadas con una tarea pequeña.
- [ ] No se usa un modelo fuerte para trabajo mecánico.
- [ ] No se inicia Capacitor hasta aprobar el MVP web responsive.

---

## 16. Fuentes oficiales principales

- [Codex: mejores prácticas](https://developers.openai.com/codex/learn/best-practices)
- [Codex: AGENTS.md](https://developers.openai.com/codex/agent-configuration/agents-md)
- [Codex: Skills](https://developers.openai.com/codex/build-skills)
- [Codex: MCP](https://developers.openai.com/codex/mcp)
- [Claude Code: integración VS Code](https://docs.anthropic.com/en/docs/claude-code/ide-integrations)
- [Claude Code: Skills](https://docs.anthropic.com/en/docs/claude-code/skills)
- [Claude Code: subagentes](https://docs.anthropic.com/en/docs/claude-code/sub-agents)
- [Claude Code: control de costos](https://docs.anthropic.com/en/docs/claude-code/costs)
- [Google Stitch: DESIGN.md](https://stitch.withgoogle.com/docs/design-md/overview/)
- [Google Stitch: MCP](https://stitch.withgoogle.com/docs/mcp/setup/)
- [Capacitor: inicio](https://capacitorjs.com/docs/getting-started)


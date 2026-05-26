# TP12 - Portfolio final DevOps

## Datos del trabajo

- Equipo y usuario desde donde ejecute: `eze@cuya`
- Carpeta de trabajo: `/home/eze/Documentos/operaciones/tp12`
- Repositorio remoto: `https://github.com/trepiol/devops-portfolio`
- Usuario Git usado en el repositorio: `trepio <ezequiel.cuya@estudiantes.unahur.edu.ar>`
- Fecha de realizacion: 2026-05-26

## Objetivo

En este TP arme el portfolio final del recorrido DevOps. La idea fue dejar un repositorio central con links reales a todos los trabajos, un README presentable, un workflow de GitHub Actions que valide los repos, y un README de perfil para GitHub.

## Paso 1 - Revise los repos existentes

Antes de escribir el portfolio revise que repos estaban publicados en GitHub.

Prompt:

```bash
eze@cuya:~/Documentos/operaciones$ gh repo list trepiol --limit 100 --json name,url,defaultBranchRef
```

Evidencia resumida:

```text
devops-TP01      https://github.com/trepiol/devops-TP01      main
devops-TP02      https://github.com/trepiol/devops-TP02      main
devops-TP04      https://github.com/trepiol/devops-TP04      main
devops-TP05      https://github.com/trepiol/devops-TP05      main
devops-TP06      https://github.com/trepiol/devops-TP06      main
devops-TP09      https://github.com/trepiol/devops-TP09      main
devops-TP10      https://github.com/trepiol/devops-TP10      main
devops-TP11      https://github.com/trepiol/devops-TP11      main
devops-gitflow   https://github.com/trepiol/devops-gitflow   main
```

Comentario: el TP03 estaba como `devops-gitflow`, y el TP07 forma parte del repo `devops-TP06` porque ahi vive el pipeline CI/CD.

## Paso 2 - Complete el repo faltante de TP08

Detecte que no estaba el repo publico `devops-TP08`. Para que el portfolio no tenga un link roto, cree un repo de respaldo con los entregables existentes del TP08.

Prompt:

```bash
eze@cuya:~/Documentos/operaciones/devops-TP08$ git init
eze@cuya:~/Documentos/operaciones/devops-TP08$ git config user.name trepio
eze@cuya:~/Documentos/operaciones/devops-TP08$ git config user.email ezequiel.cuya@estudiantes.unahur.edu.ar
eze@cuya:~/Documentos/operaciones/devops-TP08$ git add .
eze@cuya:~/Documentos/operaciones/devops-TP08$ git commit -m 'TP08: respaldo de monitoreo para portfolio'
eze@cuya:~/Documentos/operaciones/devops-TP08$ gh repo create devops-TP08 --public --source=. --remote=origin --push
```

Evidencia:

```text
https://github.com/trepiol/devops-TP08
To github.com:trepiol/devops-TP08.git
 * [new branch]      HEAD -> main
```

Interpretacion: ahora el portfolio puede apuntar a un repo real para TP08 y el pipeline puede validarlo.

## Paso 3 - Cree el repo central del portfolio

Prompt:

```bash
eze@cuya:~/Documentos/operaciones$ mkdir -p tp12/.github/workflows tp12/docs tp12/scripts
eze@cuya:~/Documentos/operaciones$ cd tp12
```

Estructura final:

```text
tp12/
|-- README.md
|-- LICENSE
|-- .github/
|   `-- workflows/
|       `-- portfolio-check.yml
|-- docs/
|   |-- profile-readme.md
|   |-- interview-notes.md
|   |-- portfolio-checklist.md
|   `-- verificacion.txt
|-- scripts/
|   `-- verificar.sh
|-- ENTREGA_TP12.md
|-- ENTREGA_TP12.html
`-- ENTREGA_TP12.pdf
```

## Paso 4 - README principal

El `README.md` quedo como carta de presentacion del portfolio. Incluye:

- Stack tecnologico.
- Links reales a los TPs.
- Separacion por etapas.
- Proyecto integrador Notes App.
- Plataformas usadas.
- Referencia al workflow de validacion.

Ejemplo de links reales:

```text
TP03 -> https://github.com/trepiol/devops-gitflow
TP06 -> https://github.com/trepiol/devops-TP06
TP08 -> https://github.com/trepiol/devops-TP08
TP11 -> https://github.com/trepiol/devops-TP11
TP12 -> https://github.com/trepiol/devops-portfolio
```

## Paso 5 - Pipeline de GitHub Actions

Archivo:

```text
.github/workflows/portfolio-check.yml
```

El workflow tiene tres jobs:

| Job | Funcion |
| --- | --- |
| `check-repos` | Verifica que los repos existan y tengan `README.md`. |
| `lint-readme` | Verifica secciones obligatorias del README central. |
| `generate-summary` | Genera un resumen del portfolio en GitHub Actions. |

Fragmento relevante:

```yaml
REPOS=(
  "TP01:devops-TP01"
  "TP02:devops-TP02"
  "TP03:devops-gitflow"
  "TP04:devops-TP04"
  "TP05:devops-TP05"
  "TP06:devops-TP06"
  "TP07:devops-TP06"
  "TP08:devops-TP08"
  "TP09:devops-TP09"
  "TP10:devops-TP10"
  "TP11:devops-TP11"
  "TP12:devops-portfolio"
)
```

Comentario: TP07 apunta al repo `devops-TP06` porque el CI/CD fue agregado sobre la app multi-contenedor.

## Paso 6 - README de perfil y docs extra

Tambien deje documentacion auxiliar:

```text
docs/profile-readme.md
docs/interview-notes.md
docs/portfolio-checklist.md
```

El `profile-readme.md` sirve como base para el README del perfil de GitHub. `interview-notes.md` resume preguntas que puedo defender y `portfolio-checklist.md` deja los puntos de control del portfolio.

## Paso 7 - Verificacion local del portfolio

Prompt:

```bash
eze@cuya:~/Documentos/operaciones/tp12$ bash scripts/verificar.sh
```

Evidencia:

```text
=== Verificacion Portfolio - TP12 ===

--- Git ---
  [OK]   Git user: trepio <ezequiel.cuya@estudiantes.unahur.edu.ar>

--- Archivos del portfolio ---
  [OK]   README.md existe
  [OK]   .github/workflows/portfolio-check.yml existe
  [OK]   docs/profile-readme.md existe
  [OK]   docs/interview-notes.md existe
  [OK]   docs/portfolio-checklist.md existe

--- Secciones del README ---
  [OK]   Seccion: Sobre este portfolio
  [OK]   Seccion: Stack tecnologico
  [OK]   Seccion: Proyectos por TP
  [OK]   Seccion: Proyecto integrador
  [OK]   Seccion: Pipeline del portfolio
  [OK]   Seccion: Plataformas usadas

--- Repos remotos ---
  [OK]   trepiol/devops-TP01 existe
  [OK]   trepiol/devops-TP02 existe
  [OK]   trepiol/devops-gitflow existe
  [OK]   trepiol/devops-TP04 existe
  [OK]   trepiol/devops-TP05 existe
  [OK]   trepiol/devops-TP06 existe
  [OK]   trepiol/devops-TP08 existe
  [OK]   trepiol/devops-TP09 existe
  [OK]   trepiol/devops-TP10 existe
  [OK]   trepiol/devops-TP11 existe

--- Workflow YAML ---
  [OK]   portfolio-check.yml contiene los jobs esperados

Portfolio OK
```

Interpretacion: el script confirma que el portfolio tiene los archivos pedidos, el README contiene las secciones principales, los repos remotos existen y el usuario Git configurado es el correcto.

## Error o exito relevante interpretado

Mensaje relevante:

```text
Portfolio OK
```

Interpretacion: no es solo un mensaje estetico. Significa que pasaron todos los checks locales: identidad Git, archivos obligatorios, secciones del README, repos remotos y estructura del workflow.

Tambien fue importante este resultado:

```text
https://github.com/trepiol/devops-TP08
```

Interpretacion: se corrigio el unico hueco detectado en los repos del portfolio antes de publicar el TP12.

## Desvios o cambios respecto de la guia

- Use `tp12` como carpeta local en vez de `~/devops-portfolio`, para mantener el mismo orden de carpetas que los TPs anteriores.
- El remoto si se llama `devops-portfolio`, como pide la idea del TP.
- Para TP03 use `devops-gitflow` porque ese es el repo real publicado.
- Para TP07 apunte a `devops-TP06`, porque el pipeline CI/CD esta dentro de ese repo.
- Cree `devops-TP08` porque faltaba como repo publico y el portfolio necesitaba un link real.
- Evite placeholders como `TU_USUARIO` y reemplace todo por `trepiol`.

## Version 2 propuesta

Comandos de reemplazo para validar el portfolio localmente antes de hacer push:

```bash
gh repo list trepiol --limit 100
bash scripts/verificar.sh
git status --short
git add .
git commit -m 'portfolio: README final con pipeline de validacion'
git push
```

Version 2 del workflow:

```yaml
workflow_dispatch:
schedule:
  - cron: "0 9 * * 1"
push:
  branches:
    - main
```

Justificacion tecnica: `workflow_dispatch` permite correr el check manualmente, `schedule` revisa el portfolio una vez por semana, y `push` evita subir cambios que rompan el README o los links.

## Novedades o sorpresas

- Me sorprendio ver que el TP07 no necesitaba repo propio porque vive dentro del TP06.
- Fue una novedad que el portfolio no sea solo un README lindo: tambien se puede validar con un pipeline.
- Me resulto importante detectar el repo faltante de TP08 antes de entregar.
- Tambien me quedo mas claro que un portfolio tecnico tiene que mostrar evidencia verificable, no solo decir que se usaron herramientas.

## Cierre

El TP12 quedo armado como portfolio final. Tiene README central, links reales a todos los trabajos, workflow de validacion, README de perfil, checklist, script local de verificacion y evidencia del usuario Git correcto.

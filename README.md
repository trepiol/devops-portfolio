<div align="center">

# DevOps Portfolio - Path Operaciones1

[![Portfolio Health Check](https://github.com/trepiol/devops-portfolio/actions/workflows/portfolio-check.yml/badge.svg)](https://github.com/trepiol/devops-portfolio/actions/workflows/portfolio-check.yml)
[![TP07 CI/CD](https://github.com/trepiol/devops-TP06/actions/workflows/cicd.yml/badge.svg)](https://github.com/trepiol/devops-TP06/actions)
[![Licencia MIT](https://img.shields.io/badge/licencia-MIT-green.svg)](LICENSE)

</div>

---

## Sobre este portfolio

Aprendi DevOps desde cero en Operaciones1 usando herramientas gratuitas y repositorios publicos.
Cada TP tiene un entregable concreto que muestra una parte del recorrido: Linux, Git, Docker, CI/CD, monitoreo, Kubernetes, Helm, Terraform y portfolio final.

Este portfolio junta todos los trabajos en un solo lugar para que se pueda revisar el camino completo y no solo archivos separados.

---

## Stack tecnologico

| Categoria | Herramientas |
| --- | --- |
| OS / Scripting | Linux Ubuntu, Bash |
| Control de versiones | Git, GitHub, Gitflow |
| Contenedores | Docker, Docker Compose |
| CI/CD | GitHub Actions |
| Monitoreo | Prometheus, Grafana, cAdvisor |
| Orquestacion | Kubernetes, kubectl, Helm |
| IaC | Terraform, provider Docker |
| Backend | Python, Flask, Gunicorn |
| Base de datos | PostgreSQL |
| Proxy / Frontend | Nginx |
| Configuracion | YAML, HCL, JSON |

---

## Proyectos por TP

### TP01 al TP04 - Fundamentos

| TP | Proyecto | Tecnologias | Link |
| --- | --- | --- | --- |
| 1 | Script de automatizacion del sistema | Bash, Linux | [ver repo](https://github.com/trepiol/devops-TP01) |
| 2 | Gestion de usuarios y permisos | Linux, chmod, useradd | [ver repo](https://github.com/trepiol/devops-TP02) |
| 3 | Flujo Gitflow completo | Git, GitHub, branching | [ver repo](https://github.com/trepiol/devops-gitflow) |
| 4 | YAML multi-entorno y diagnostico de red | YAML, Bash, ping, dig, curl | [ver repo](https://github.com/trepiol/devops-TP04) |

### TP05 al TP08 - Contenedores y CI/CD

| TP | Proyecto | Tecnologias | Link |
| --- | --- | --- | --- |
| 5 | API Python en Docker | Docker, Flask, Gunicorn | [ver repo](https://github.com/trepiol/devops-TP05) |
| 6 | App multi-contenedor | Docker Compose, PostgreSQL, Nginx | [ver repo](https://github.com/trepiol/devops-TP06) |
| 7 | Pipeline CI/CD completo | GitHub Actions, pytest, Docker Hub | [ver repo](https://github.com/trepiol/devops-TP06) |
| 8 | Stack de monitoreo | Prometheus, Grafana, metricas | [ver repo](https://github.com/trepiol/devops-TP08) |

### TP09 al TP12 - Kubernetes e IaC

| TP | Proyecto | Tecnologias | Link |
| --- | --- | --- | --- |
| 9 | App en Kubernetes | kubectl, Deployments, Services, PVC | [ver repo](https://github.com/trepiol/devops-TP09) |
| 10 | Helm Chart e Ingress | Helm, Ingress NGINX, HPA | [ver repo](https://github.com/trepiol/devops-TP10) |
| 11 | Infraestructura como codigo | Terraform, modulos, state | [ver repo](https://github.com/trepiol/devops-TP11) |
| 12 | Portfolio final | GitHub Actions, integracion | [este repo](https://github.com/trepiol/devops-portfolio) |

---

## Proyecto integrador: Notes App

La app que fui construyendo TP a TP termino como una aplicacion real de notas con backend, base de datos, frontend, CI/CD, monitoreo, Kubernetes, Helm e infraestructura como codigo.

```text
Codigo
  -> GitHub Actions
  -> Docker Hub
  -> Docker Compose / Kubernetes
  -> Helm + Ingress
  -> Prometheus + Grafana
  -> Terraform para infraestructura local
```

Repo principal: [devops-TP06](https://github.com/trepiol/devops-TP06)

---

## Como ver cada proyecto

Cada repositorio tiene, como minimo:

- `README.md` con el resumen del trabajo.
- Entregable o evidencia del TP.
- Scripts o comandos de verificacion cuando el TP lo requiere.
- Commits con usuario Git identificable.

---

## Pipeline del portfolio

Este repositorio incluye un workflow de GitHub Actions que:

- Verifica que los repos del portfolio existen.
- Comprueba que cada repo tenga `README.md`.
- Valida secciones importantes del README central.
- Genera un resumen automatico del estado del portfolio.

Workflow: [.github/workflows/portfolio-check.yml](.github/workflows/portfolio-check.yml)

---

## Plataformas usadas

- [Killercoda](https://killercoda.com): laboratorios con terminal en navegador.
- [KodeKloud](https://kodekloud.com): cursos y practicas guiadas.
- [roadmap.sh/devops](https://roadmap.sh/devops): guia de aprendizaje.
- [GitHub](https://github.com): repositorios y GitHub Actions.
- [Docker Hub](https://hub.docker.com): registry de imagenes.

---

## Contacto

GitHub: [github.com/trepiol](https://github.com/trepiol)

#!/usr/bin/env bash
set -uo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ERRORS=0

ok() {
  echo "  [OK]   $1"
}

fail() {
  echo "  [FAIL] $1"
  ERRORS=$((ERRORS + 1))
}

echo "=== Verificacion Portfolio - TP12 ==="
echo ""

echo "--- Git ---"
GIT_USER="$(git -C "$ROOT_DIR" config user.name 2>/dev/null || true)"
GIT_EMAIL="$(git -C "$ROOT_DIR" config user.email 2>/dev/null || true)"
if [ "$GIT_USER" = "trepio" ] && [ "$GIT_EMAIL" = "ezequiel.cuya@estudiantes.unahur.edu.ar" ]; then
  ok "Git user: $GIT_USER <$GIT_EMAIL>"
else
  fail "Git user inesperado: $GIT_USER <$GIT_EMAIL>"
fi

echo ""
echo "--- Archivos del portfolio ---"
for file in README.md .github/workflows/portfolio-check.yml docs/profile-readme.md docs/interview-notes.md docs/portfolio-checklist.md; do
  if [ -f "$ROOT_DIR/$file" ]; then
    ok "$file existe"
  else
    fail "$file no existe"
  fi
done

echo ""
echo "--- Secciones del README ---"
for sec in "Sobre este portfolio" "Stack tecnologico" "Proyectos por TP" "Proyecto integrador" "Pipeline del portfolio" "Plataformas usadas"; do
  if grep -q "$sec" "$ROOT_DIR/README.md"; then
    ok "Seccion: $sec"
  else
    fail "Falta seccion: $sec"
  fi
done

echo ""
echo "--- Repos remotos ---"
REPOS=(
  "devops-TP01"
  "devops-TP02"
  "devops-gitflow"
  "devops-TP04"
  "devops-TP05"
  "devops-TP06"
  "devops-TP08"
  "devops-TP09"
  "devops-TP10"
  "devops-TP11"
)

for repo in "${REPOS[@]}"; do
  if gh repo view "trepiol/$repo" --json nameWithOwner,defaultBranchRef >/tmp/tp12-repo.json 2>/dev/null; then
    ok "trepiol/$repo existe"
  else
    fail "trepiol/$repo no encontrado"
  fi
done

echo ""
echo "--- Workflow YAML ---"
if python3 - <<'PY' >/dev/null 2>&1
import pathlib
text = pathlib.Path('.github/workflows/portfolio-check.yml').read_text(encoding='utf-8')
required = ['Portfolio Health Check', 'check-repos', 'lint-readme', 'generate-summary']
missing = [item for item in required if item not in text]
raise SystemExit(1 if missing else 0)
PY
then
  ok "portfolio-check.yml contiene los jobs esperados"
else
  fail "portfolio-check.yml incompleto"
fi

echo ""
if [ "$ERRORS" -eq 0 ]; then
  echo "Portfolio OK"
else
  echo "$ERRORS checks fallaron"
fi

exit "$ERRORS"

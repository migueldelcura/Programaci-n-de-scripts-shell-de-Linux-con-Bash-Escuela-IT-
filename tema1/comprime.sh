#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
fecha=$(date +%m_%Y)
tar cvzf "/mnt/comprimidos/$fecha.gz" ~/curso
echo Finalizado

#!/usr/bin/env bash
set -euo pipefail

BASELINE_IMAGE="phase-3-container-security:baseline"
HARDENED_IMAGE="phase-3-container-security:hardened"

mkdir -p reports sbom

echo "[+] Building baseline image..."
docker build -f Dockerfile.baseline -t "$BASELINE_IMAGE" .

echo "[+] Building hardened image..."
docker build -f Dockerfile.hardened -t "$HARDENED_IMAGE" .

echo "[+] Comparing image sizes..."
docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}" | grep "phase-3-container-security" > reports/image-size-comparison.txt

echo "[+] Scanning baseline image with Trivy..."
trivy image --severity HIGH,CRITICAL --format table "$BASELINE_IMAGE" | tee reports/baseline-vulnerability-report.txt

echo "[+] Scanning hardened image with Trivy..."
trivy image --severity HIGH,CRITICAL --format table "$HARDENED_IMAGE" | tee reports/hardened-vulnerability-report.txt

echo "[+] Generating SBOM..."
trivy image --format cyclonedx --output sbom/hardened-image-sbom.json "$HARDENED_IMAGE"

echo "[+] Validating non-root runtime user..."
docker run --rm "$HARDENED_IMAGE" id > reports/non-root-validation.txt

echo "[+] Scan complete."



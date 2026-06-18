
# Phase 3 — Container Image Security Scanner

An automated DevSecOps project for scanning, hardening, and validating container images.

## Objectives

This project demonstrates:

- Docker image vulnerability scanning with Trivy
- Minimal image comparison
- SBOM generation
- Vulnerability report creation
- Remediation documentation
- Non-root container runtime validation 

## Tools Used

- Docker
- Trivy
- GitHub Actions
- Python
- Pytest
- CycloneDX SBOM

## Project Structure

```text
phase-3-container-image-security-scanner/
├── app/
├── tests/
├── scripts/
├── docs/
├── reports/
├── sbom/
├── screenshots/
├── .github/workflows/
├── Dockerfile.baseline
├── Dockerfile.hardened
├── requirements.txt
└── README.md
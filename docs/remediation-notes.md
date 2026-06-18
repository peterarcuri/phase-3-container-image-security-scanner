# Remediation Notes

## Security Findings Reviewed

This project compares a baseline Python container image against a hardened minimal image.

## Remediation Actions

- Replaced full Python base image with `python:3.13-slim`
- Added a dedicated non-root user
- Removed root runtime execution
- Used `--no-cache-dir` during package installation
- Generated an SBOM for dependency visibility
- Produced vulnerability reports using Trivy
- Compared image size to demonstrate attack surface reduction

## Portfolio Value

This project demonstrates container image hardening, vulnerability scanning, SBOM generation, runtime validation, and remediation documentation.
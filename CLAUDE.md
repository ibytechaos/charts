# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Helm chart repository for deploying Stable Diffusion WebUI on Kubernetes. The repository contains a single chart that packages Stable Diffusion with a companion UI and automatic model retrieval capabilities.

## Common Commands

### Helm Chart Operations
```bash
# Package the chart
helm package stable-diffusion/

# Install the chart
helm install stable-diffusion stable-diffusion/

# Upgrade the chart
helm upgrade stable-diffusion stable-diffusion/

# Test the chart templates
helm template stable-diffusion stable-diffusion/

# Lint the chart
helm lint stable-diffusion/

# Update chart index
helm repo index . --url https://your-repo-url
```

### Chart Development
```bash
# Validate chart syntax
helm template stable-diffusion stable-diffusion/ --dry-run

# Debug chart rendering
helm install stable-diffusion stable-diffusion/ --debug --dry-run
```

## Architecture

### Chart Structure
- `stable-diffusion/` - Main Helm chart directory
  - `Chart.yaml` - Chart metadata (version 1.0.6, appVersion 1.5.0)
  - `values.yaml` - Default configuration values
  - `templates/` - Kubernetes resource templates
    - `statefulset.yaml` - Main application deployment
    - `service.yaml` - Service configuration
    - `ingress.yaml` - Ingress configuration
    - `configmap.yaml` - Environment configuration
    - `serviceaccount.yaml` - Service account setup
    - `_helpers.tpl` - Template helpers and naming conventions

### Key Components
- **StatefulSet**: Deploys the `universonic/stable-diffusion-webui` container
- **Persistent Storage**: Uses hostPath volumes for models, extensions, and outputs
- **GPU Support**: Configured with nodeSelector for NVIDIA GPU nodes
- **Networking**: Exposes port 7860 internally, configurable ingress at `iserver.local`

### Configuration
- Default storage class: `local-path`
- Persistent volumes for models (`/data/sd/models`), extensions (`/data/extensions`), and outputs (`/data/outputs`)
- CLI flags: `--extra-models-cpu --optimized-turbo`
- Ingress enabled by default with host `iserver.local`

## Chart Repository
- Packaged charts are stored in `charts/` directory
- `index.yaml` contains chart repository metadata
- Current packaged version: `stable-diffusion-1.0.6.tgz`
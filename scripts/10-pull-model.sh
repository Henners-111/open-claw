#!/usr/bin/env bash
set -euo pipefail
echo "[10] Pulling cloud model gpt-oss:20b-cloud..."
echo "If prompted login to Ollama Cloud..."
ollama login || true
ollama pull gpt-oss:20b-cloud || true
ollama list || true
echo "[10] Model pull attempted."

#!/usr/bin/env bash
set -e

DATA_DIR="$(pwd)/data"
LOCAL_DATA_DIR="$(pwd)/local_data"

case "$1" in

  build_generator)
    docker build -t generator ./generator
    ;;

  run_generator)
    mkdir -p "$DATA_DIR"
    docker run --rm \
      -v "$DATA_DIR":/data \
      generator
    ;;

  create_local_data)
    mkdir -p "$LOCAL_DATA_DIR"
    python3 generator/generate.py "$LOCAL_DATA_DIR"
    ;;

  build_reporter)
    docker build -t reporter ./reporter
    ;;

  run_reporter)
    mkdir -p "$DATA_DIR"
    docker run --rm \
      -v "$DATA_DIR":/data \
      reporter
    ;;

  structure)
    find . -not -path './.git/*' | sort | sed 's|[^/]*/|  |g'
    ;;

  clear_data)
    rm -f "$DATA_DIR"/*.csv "$DATA_DIR"/*.html
    ;;

  inside_generator)
    mkdir -p "$DATA_DIR"
    docker run --rm \
      -v "$DATA_DIR":/data \
      --entrypoint sh \
      generator -c "ls -la /data"
    ;;

  inside_reporter)
    mkdir -p "$DATA_DIR"
    docker run --rm \
      -v "$DATA_DIR":/data \
      --entrypoint sh \
      reporter -c "ls -la /data"
    ;;

  report_server)
    mkdir -p "$DATA_DIR"
    docker run -d --rm \
      --name report_server \
      -v "$DATA_DIR":/usr/share/nginx/html:ro \
      -p 8080:80 \
      nginx:alpine
    ;;
esac
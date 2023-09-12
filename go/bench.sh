#! /usr/bin/env bash

REPO="${REPO:-opentelemetry-go}"


if [ ! -e "${REPO}/go.mod" ]; then 
    ## clone otel-go main
    git clone --depth 1 --branch main https://github.com/open-telemetry/${REPO}.git 
fi

mkdir bench-output 2>/dev/null || true

if [ -e "bench-output/${REPO}.txt" ]; then 
    rm "bench-output/${REPO}.txt"
fi
for dir in $(grep -r "func Bench" ${REPO}/ -l | sed -s 's#/[a-z0-9\._]*\.go$##' | sort | uniq); do
    echo -n "$dir "
    #go -C "${dir}" test -bench ./... -run=^$ >> "bench-output/${REPO}.txt"
    echo "- done"
done
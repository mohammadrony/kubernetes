#!/bin/bash
# Replace DEPLOYMENT_NAME and NAMESPACE with real value.

# Java
kubectl patch deployment/DEPLOYMENT_NAME --namespace NAMESPACE --patch '{"spec": {"template": {"metadata": {"annotations": {"instrumentation.opentelemetry.io/inject-java": "opentelemetry/java-instrumentation"}}}}}'

# Node.js
kubectl patch deployment/DEPLOYMENT_NAME --namespace NAMESPACE --patch '{"spec": {"template": {"metadata": {"annotations": {"instrumentation.opentelemetry.io/inject-nodejs": "opentelemetry/nodejs-instrumentation"}}}}}'

# Remove annotation
kubectl patch deployment/DEPLOYMENT_NAME --namespace NAMESPACE --type='json' -p='[{"op": "remove", "path": "/spec/template/metadata/annotations"}]'

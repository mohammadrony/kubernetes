# Minio Tenant

## Create Tenant

- Open Minio Operator
- Select Create Tenant
- Setup
  - Name: `my-minio-tenant`
  - Namespace: `namespace`
  - Storage Class: `local-storage`
  - Number of Servers: 2
  - Drives per Server: 2
  - Total Size: 100
  - Erasure Code Parity: `EC:2`. [[concept](https://min.io/docs/minio/kubernetes/upstream/operations/concepts/erasure-coding.html)]
  - CPU Request: 1
  - Memory Request: 2
  - CPU Limit: 2
  - Memory Limit: 2

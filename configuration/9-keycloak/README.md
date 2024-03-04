# Keycloak

## Installation

Method 1

[codecentric | Keycloak-X](https://artifacthub.io/packages/helm/codecentric/keycloakx)

```bash
helm repo add codecentric https://codecentric.github.io/helm-charts
helm repo update
```

```bash
helm show values codecentric/keycloakx > values.codecentric.yml
```

```bash
helm install keycloakx codecentric/keycloakx --namespace keycloak --create-namespace --values values.codecentric.yml
```

Method 2

[Bitnami | Keycloak](https://artifacthub.io/packages/helm/bitnami/keycloak)

```bash
helm show values oci://registry-1.docker.io/bitnamicharts/keycloak > values.bitnami.yml
```

```bash
helm install keycloak oci://registry-1.docker.io/bitnamicharts/keycloak --namespace keycloak --create-namespace --values values.bitnami.yml
```

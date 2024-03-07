# Keycloak

## Install codecentric chart

### Install with Existing database

[Keycloak-X | ArtifactHub](https://artifacthub.io/packages/helm/codecentric/keycloakx)

```bash
helm repo add codecentric https://codecentric.github.io/helm-charts
helm repo update
```

```bash
helm show values codecentric/keycloakx > values.keycloakx.yaml
```

Custom configuration

```bash
vi values.keycloakx.yaml
```

Update

```yaml
resources:
  requests:
    cpu: "500m"
    memory: "512Mi"
  limits:
    cpu: "2000m"
    memory: "2048Mi"

ingress:
  enabled: true
  ingressClassName: "nginx"
  rules:
    host: "sso.example.com"

database:
  vendor: postgres
  hostname: keycloak-db-postgresql
  port: 5432
  username: postgres
  password: postgres
  database: keycloak

dbchecker:
  enabled: true

prometheusRule:
  enabled: true

autoscaling:
  enabled: true
```

```bash
helm upgrade --install keycloakx codecentric/keycloakx --namespace security --create-namespace --values values.keycloakx.yaml
```

### Install with PostgreSQL database

#### Install PostgreSQL database

[Keycloak-X | GitHub](https://github.com/codecentric/helm-charts/tree/master/charts/keycloakx/examples/postgresql)

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```

```bash
helm show values bitnami/postgresql > values.postgresql.yaml
```

Custom configuration

```bash
vi values.postgresql.yaml
```

Update values from `keycloak-db-values.yaml` file.

```bash
helm upgrade --install keycloak-db bitnami/postgresql --namespace security --create-namespace --values values.postgresql.yaml
```

#### Install Keycloakx

```bash
helm repo add codecentric https://codecentric.github.io/helm-charts
helm repo update
```

```bash
helm show values codecentric/keycloakx > values.keycloakx.yaml
```

Custom configuration

```bash
vi values.keycloakx.yaml
```

Update values from `keycloak-server-values.yaml` file.

```bash
helm upgrade --install keycloak codecentric/keycloakx --namespace security --create-namespace --values values.keycloakx.yaml
```

Remove Keycloak

```bash
helm uninstall keycloak
helm uninstall keycloak-db
```

## Install Bitnami chart

[Bitnami | Keycloak](https://artifacthub.io/packages/helm/bitnami/keycloak)

```bash
helm show values oci://registry-1.docker.io/bitnamicharts/keycloak > values.keycloak.yaml
```

```bash
helm upgrade --install keycloak oci://registry-1.docker.io/bitnamicharts/keycloak --namespace security --create-namespace --values values.keycloak.yaml
```

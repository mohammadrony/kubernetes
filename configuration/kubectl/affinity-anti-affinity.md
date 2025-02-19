# Affinity Anti-affinity

Node affinity

```yaml
# Pod will be scheduled in a node having 'disk-type=ssd' label
spec:
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: disk-type
            operator: In
            values:
            - ssd
```

```yaml
# Pod will try to schedule in a node having 'disk-type=ssd' label
spec:
  affinity:
    nodeAffinity:
      preferredDuringSchedulingIgnoredDuringExecution:
        - weight: 100
          preference:
            matchExpressions:
              - key: disk-type
                operator: In
                values:
                  - ssd
```

Pod affinity

```yaml
# Pod will be scheduled in a node having 'app=frontend' labeled pod 
spec:
  affinity:
    podAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
      - labelSelector:
          matchExpressions:
          - key: app
            operator: In
            values:
            - frontend
          # matchLabels:
          #   app: frontend
        topologyKey: kubernetes.io/hostname
```

```yaml
# Pod will try to schedule in a node having 'app=backend' labeled pod 
spec:
  affinity:
    podAffinity:
      preferredDuringSchedulingIgnoredDuringExecution:
      - weight: 100
        podAffinityTerm:
          labelSelector:
            matchExpressions:
            - key: app
              operator: In
              values:
              - backend
            # matchLabels:
            #   app: backend
          topologyKey: kubernetes.io/hostname
```

Pod anti-affinity

```yaml
# Pod won't be scheduled in a node having 'app=frontend' labeled pod 
spec:
  affinity:
    podAntiAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
      - labelSelector:
          matchExpressions:
          - key: app
            operator: In
            values:
            - frontend
          # matchLabels:
          #   app: frontend
        topologyKey: kubernetes.io/hostname
```

```yaml
# Pod will try not to schedule in a node having 'app=backend' labeled pod 
spec:
  affinity:
    podAntiAffinity:
      preferredDuringSchedulingIgnoredDuringExecution:
      - weight: 100
        podAffinityTerm:
          labelSelector:
            matchExpressions:
            - key: app
              operator: In
              values:
              - backend
            # matchLabels:
            #   app: backend
          topologyKey: kubernetes.io/hostname
```

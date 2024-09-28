# Volume Claim

Remove claim reference

```bash
PV=pvname
kubectl patch pv $PV --type='json' -p='[{"op": "remove", "path": "/spec/claimRef"}]'
```

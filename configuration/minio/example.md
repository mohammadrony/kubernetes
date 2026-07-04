# Example

## Alias

```bash
mc alias set myminio https://minio.example.com ACCESS_KEY SECRET_KEY
```

## Bucket

Create bucket

```bash
mc mb myminio/mybucket
```

List buckets

```bash
mc ls myminio
```

## Object

Upload file

```bash
mc cp file.txt myminio/mybucket
```

Download file

```bash
mc cp myminio/mybucket/file.txt .
```

List objects

```bash
mc ls myminio/mybucket
```

Remove object

```bash
mc rm myminio/mybucket/file.txt
```

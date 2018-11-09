# Create User in Kubernetes
# https://www.linkedin.com/pulse/adding-users-quick-start-kubernetes-aws-jakub-scholz


```
$ openssl genrsa -out raju.pem 2048
$ openssl req -new -key raju.pem -out raju.csr -subj "/CN=raju"
$ cat raju.csr | base64 | tr -d '\n'
-----
Take O/p of the above command and keep it in following file
.....
$ vi csr.yaml
apiVersion: certificates.k8s.io/v1beta1
kind: CertificateSigningRequest
metadata:
  name: user-request-jakub
spec:
  groups:
  - system:authenticated
  request: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ1ZEQ0NBVHdDQVFBd0R6RU5NQXNHQTFVRUF3d0VjbUZxZFRDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRApnZ0VQQURDQ0FRb0NnZ0VCQUorSDhkMWhUeCs4OWs4b2sva3JNVUt2VjQ5VVpkZXk2dEpFQlkrTUh1TEFBOEtkCkltNmFkYlhPNFBzOHZaUUlURTRIdWptSzVyQ1FXMkFxN204ZENuWjk4QnlCaU5weGJaYWJwS0hmbWcyS0d2dTkKM0N0dUtCbHM1bm9wVGwyTWNpZzRuMm96VktFODM0QVljM084ZVZodlorVzYvWXNDZUliSHUrNEJTNWM5Y2E5RgpYaFVTU1l6TmpKMzNSSU5pb3AwT0NQRk9YK3pIcU1HdWYyQnV1eDdlWWhMUXp5Q2ZjM3RNeUVBMEkxRXZWVmJJCjZCNkxqczZ5bXZlSUFsN0ZRTkJvNVl1RGRyaXVEcjJ4eFRqbDYvaDArbmhFNzhUK3dFSFlycVRZcVRUQjgyWSsKeWtJZklYSFZrYVdDaEx0SUFsVTEzZGVHWmJURWJpVTlLbjdXb0RVQ0F3RUFBYUFBTUEwR0NTcUdTSWIzRFFFQgpDd1VBQTRJQkFRQXNSMzhidDhLSzkvYUlvaTJzZFNYQ3g0WCtkVkZuckw4eEVuNEIwNDZTK1ljejJMQVpERkxwCkFwTGhVUmd3RDh6ejZhaWlOb2FvcnJ5ajZNMVpKL1JML1F1RnRIVjVCSitJRHdZQ3JSSGxMZkt2WGRDMWJKMm0KbjNWbDFTMVk5ZTlZazNIMGo2dkNLZXNCTkE2LzRQMXo4TWRQendkbXFUc0x2SkxLZWxmb2JOVytWbmVoazh4Uwo0RkJpS0liQkZJTE9pcm9SaDBzcWU1TCtsbFZ5UGxYNVRqd0ZtWnlBdmVxMk52TlNESDFqd3F3YUlOYVpXWnZFCkUvLzFzd3VsV1Ezc1I5YUpUcmJiMGllYmJpMWhPVlhRU3lRdDF1NHJBYmJIVVVRZ3RPTGlUT3ZyODZqMENBRE4KaHJTMU54c3NqeVRVbHZkeTVSMUkxc2MybjZEdllYUG4KLS0tLS1FTkQgQ0VSVElGSUNBVEUgUkVRVUVTVC0tLS0tCg==
  usages:
  - digital signature
  - key encipherment
  - client auth



$ kubectl create -f csr.yml
$ kubectl config set-cluster  demo --insecure-skip-tls-verify=true --server=https://35.194.81.89
$ kubectl config set-credentials raju --client-certificate=raju.crt --client-key=raju.pem --embed-certs=true
$ kubectl config  set-context raju --cluster=demo --user=raju
$ kubectl config use-context raju

```

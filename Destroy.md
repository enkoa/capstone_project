# Destroy the Deployment

This section shows how to shutdown the MongoDB pod and its other resources: secret, service, storageclass, persistentvolume, persistentvolumeclaim.
After that, we will the cluster and node pool made by Terraform in GKE.

## Shutdown pod and other resources

To shutdown the pod and all of the other resources, run the following commands in the same order:

```
kubectl delete secret mongodb-cred
```
```
kubectl delete deployment mongodb
```
```
kubectl delete service mongodb-service
```
```
kubectl delete storageclass mongodb-storage
```
```
kubectl delete persistentvolume mongodb-pv
```
```
kubectl delete persistentvolumeclaim mongodb-claim
```

Or for convience, you may use the Makefile. In which case you would run:

```
make clean
```
```
make clean_storage
```

![image](https://user-images.githubusercontent.com/59161665/113667051-d8f1d700-9675-11eb-8793-4eb681ace30d.png)

## Check resources

We need to make sure that the pod and the resources we made are trule gone

### Kubectl check
You may check to make sure your resources and pod are successfully shutdown any of the following command:



```
kubectl get pod
```
```
kubectl get storageclass
```
```
kubectl get persistentvolume
```
```
kubectl get persistentvolumeclaim
```
```
kubectl get secret
```
```
kubectl get deployment
```
```
kubectl get service
```

![image](https://user-images.githubusercontent.com/59161665/113667520-8a910800-9676-11eb-88b1-44ea5edef49a.png)


### GKE Check

We can check whether or not all of the resources are delete by looking at the GKE in the Google Cloud Platform.

Checking pod:

![image](https://user-images.githubusercontent.com/59161665/113667696-c5933b80-9676-11eb-800f-c9b330ca8321.png)

Checking Service:

![image](https://user-images.githubusercontent.com/59161665/113667734-d0e66700-9676-11eb-8b1f-09bf354217d6.png)

Checking Secret:

![image](https://user-images.githubusercontent.com/59161665/113667765-dcd22900-9676-11eb-927d-923141d3cdd5.png)

Checking PersistentVolumeClaim:

![image](https://user-images.githubusercontent.com/59161665/113667796-e8bdeb00-9676-11eb-9dc4-32b35260fffb.png)

Checking StorageClass:

![image](https://user-images.githubusercontent.com/59161665/113667821-f2475300-9676-11eb-9a46-30f0c64c3051.png)

With everything gone, we have successfully shutdown our Pod deployment section.

## Shutdown GKE Cluster and Node Pool

To shutdown the Cluster and Node pool, we will need to go back to the directory that contain our Terraform binary and our Terraform file:

![image](https://user-images.githubusercontent.com/59161665/113668035-494d2800-9677-11eb-8b32-fd1f7c0d0e15.png)

To shutdown the GKE Cluster and Node Pool, simply run:

```
terraform destroy
```

![image](https://user-images.githubusercontent.com/59161665/113668196-81546b00-9677-11eb-99f8-2456a574d76f.png)

Then press yes, upon prompt:

![image](https://user-images.githubusercontent.com/59161665/113668232-8c0f0000-9677-11eb-8d4d-999a3003678a.png)

## Wait

Destroying an infrastructure should take around the same time it is build.

![image](https://user-images.githubusercontent.com/59161665/113668674-371fb980-9678-11eb-9517-fded2aa6c8aa.png)

![image](https://user-images.githubusercontent.com/59161665/113668913-9251ac00-9678-11eb-9f06-6347917d0b91.png)

## Done!

You have successfully shutdown kubernetes pod and destroy the gke infrastructure!


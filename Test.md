# Testing the Pod

This section is about testing the deployed MongoDB pod to make sure that the data manipulated by the database is persist even when the pod is shutdown.

## Requirements

* MongoDB bash/mongo shell: https://docs.mongodb.com/manual/mongo/#download-the-mongo-shell
* A MongoDB pod deployed in GKE

## Check for running Pod

```
kubectl get pod
```

![image](https://user-images.githubusercontent.com/59161665/113660666-413abb80-966a-11eb-8a29-e691c1a24164.png)

## Accessing the database

Go to the Google Kubernetes Engine and click on Services & Ingress. Then click on the service that is deployed for the MongoDB.
If you do not have a service deployed for the database, see the Deployment.md file for how to do so.

### Port Forwarding

Scroll to the bottom and click on Port Forwarding:

![image](https://user-images.githubusercontent.com/59161665/113659691-3717bd80-9668-11eb-966d-f0f60692c21b.png)

Run the command shown to forward the read port of the database to your localhost:8080

![image](https://user-images.githubusercontent.com/59161665/113659706-40a12580-9668-11eb-93ab-84b056d381b0.png)

Below is the command I used which is for Linux:

![image](https://user-images.githubusercontent.com/59161665/113659943-bdcc9a80-9668-11eb-9a33-5b7860cfdd60.png)

### Open on your localhost

Open another terminal and enter the command:

```
mongo localhost:8080
```

![image](https://user-images.githubusercontent.com/59161665/113660072-f9fffb00-9668-11eb-8230-8658e1d02b83.png)

## Authenticate the database

Use the database that we set up when we made the pod

```
use admin
```

Authenticate using the following mongo command. First field is the username and the second field is the password.

```
db.auth("admin", "password")
```

![image](https://user-images.githubusercontent.com/59161665/113660378-89a5a980-9669-11eb-81fe-c440268fcb1d.png)

We get a 1. This means that we have successfully authenticate ourself.

## Create dummy data

To test for persistency, we will create a dummy data.
Use the following command to create a dummy collection in our database:

```
db.createCollection("dummy")
```

Use the following command to confirm that our collection has been made:

```
show collections
```
![image](https://user-images.githubusercontent.com/59161665/113660546-f3be4e80-9669-11eb-95cd-539e7dcd426b.png)

## Exit the database

```
exit
```

![image](https://user-images.githubusercontent.com/59161665/113660575-09cc0f00-966a-11eb-909f-b45935051f39.png)

## Delete the pod

Go back to the first terminal and exit the port forwarding with Ctrl+C.
Delete our pod along with its credential and service using the command in order:

```
kubectl delete secret mongodb-cred
kubectl delete deployment mongodb
kubectl delete service mongodb-service
```

For convience, you can also the Makefile command:

```
make clean
```

![image](https://user-images.githubusercontent.com/59161665/113660851-97a7fa00-966a-11eb-913a-2c87c2eea8cb.png)

## Make a new MongoDB Pod

Now we re-deploy a new MongoDB pod using the commands(same command used to deploy in Deployment.md):

```
kubectl apply -f secret.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

Or for convience, like before, you may use the Makefile that we've provided:

```
make deploy
```

![image](https://user-images.githubusercontent.com/59161665/113661011-ea81b180-966a-11eb-83cb-d000ffbc4c71.png)

## Check Pod

Make sure your new pod was successfully made and is running using the command:

```
kubectl get pod
```

![image](https://user-images.githubusercontent.com/59161665/113661071-0be29d80-966b-11eb-8e78-c7db39c10711.png)

## Access the database once more

### Port forwarding

Once more, forward your port using the command given in GKE:

![image](https://user-images.githubusercontent.com/59161665/113659706-40a12580-9668-11eb-93ab-84b056d381b0.png)

Or Linux:

![image](https://user-images.githubusercontent.com/59161665/113661196-44827700-966b-11eb-8024-b89720f3a076.png)

### Authenticate the Database

Once more, enter the database with the localhost:8080 in your second terminal:

```
mongo localhost:8080
```

Use the same database and authenticate using the same username and password:

```
use admin
```

```
db.auth("admin", "password")
```

![image](https://user-images.githubusercontent.com/59161665/113661463-c5417300-966b-11eb-950f-5bacf4e0fa72.png)

## Check the data

Now we check to see if our dummy collection that we made earlier has persisted to our second MongoDB pod:

```
show collections
```

![image](https://user-images.githubusercontent.com/59161665/113661566-f7eb6b80-966b-11eb-8fab-e607165aad7e.png)

Indeed, our dummy collection shows up. This means that our database has persisted between shutdown of MongoDB's kubernetes pod.






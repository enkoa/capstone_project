# Testing the Pod

This section is about testing the deployed MongoDB pod to make sure that the data manipulated by the database is persist even when the pod is shutdown.

## Requirements

* MongoDB bash/mongo shell: https://docs.mongodb.com/manual/mongo/#download-the-mongo-shell
* A MongoDB pod deployed in GKE

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


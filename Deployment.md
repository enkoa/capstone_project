# Deployment

## Setting Up GCP Project

We will setup the GCP Project with a Service Account to enable Terraform to access our GCP resources.

### Go to GCP Cloud Console

![image](https://user-images.githubusercontent.com/59161665/113643275-91eced00-9647-11eb-8c69-2fc775bf2269.png)

### Press the Dropdown Bar

![image](https://user-images.githubusercontent.com/59161665/113643532-28211300-9648-11eb-860c-0a8798b65593.png)

### Press New Project 

![image](https://user-images.githubusercontent.com/59161665/113643590-45ee7800-9648-11eb-9679-f5424d90696f.png)

### Set up the Project with a billing account

![image](https://user-images.githubusercontent.com/59161665/113643736-91a12180-9648-11eb-8480-10794049325e.png)

### Go to IAM & Admin and select Service Accounts

![image](https://user-images.githubusercontent.com/59161665/113645531-aaabd180-964c-11eb-9374-015a2bbd3468.png)

### Create a Service Account

![image](https://user-images.githubusercontent.com/59161665/113645673-ee9ed680-964c-11eb-8e58-3bb5f958ce23.png)

### Go to IAM & Admin and select IAM

![image](https://user-images.githubusercontent.com/59161665/113645783-27d74680-964d-11eb-9fc5-3ebba5191899.png)

### Press Add

![image](https://user-images.githubusercontent.com/59161665/113645839-43dae800-964d-11eb-8f89-d71639ce6864.png)

### Enter the created Service Accounts and Grant it the role of Kubernetes Engine Service Agent

![image](https://user-images.githubusercontent.com/59161665/113645946-6ff66900-964d-11eb-879f-72e094ef6003.png)

## Done!

We should be done with the setup on the GCP side 

## Terraform: Cluster Deployment

In this section, we will create the GKE cluster and node pool using Terraform.
Make sure your terraform binary file is in the same folder as your terraform file.

### GCP information

Open the variables.tf file:
* Enter your GCP Project ID by overwriting REPLACE_ME 
* Enter your Service account as shown in the member section of the IAM page by overwriting REPLACE_ME

### Run Terraform init

``` bash
terraform init
```

![image](https://user-images.githubusercontent.com/59161665/113648055-99b18f00-9651-11eb-837b-0c50458f790c.png)

![image](https://user-images.githubusercontent.com/59161665/113648095-a9c96e80-9651-11eb-97cd-ae15009b65a6.png)

### Run Terraform plan

``` bash
terraform plan
```

This will print out the changes you want to make to your infrastructure.

![image](https://user-images.githubusercontent.com/59161665/113648268-f4e38180-9651-11eb-9d6d-10e4d4751a25.png)

### Run Terraform apply

``` bash
terraform apply
```

![image](https://user-images.githubusercontent.com/59161665/113648347-1ba1b800-9652-11eb-9df7-8b211262d96c.png)

When prompted for "yes", type yes and press enter.

![image](https://user-images.githubusercontent.com/59161665/113648407-307e4b80-9652-11eb-8d66-b6203238cba0.png)

### Wait!

The total time should be around 5-8 minutes:
* Cluster: Around 3 minutes
* Node Pool: Around 2-5 minutes

![image](https://user-images.githubusercontent.com/59161665/113649124-7e478380-9653-11eb-8c85-fc0f174497aa.png)

![image](https://user-images.githubusercontent.com/59161665/113649237-af27b880-9653-11eb-8b8f-7eeef2469f32.png)

You should get the above orange text if Terraform has beb successfully applied.

### Go to Google Kubernetes Engine(GKE) and go to Cluster

![image](https://user-images.githubusercontent.com/59161665/113648649-8ce16b00-9652-11eb-897e-4fffd78c7fc7.png)

### Check Cluster and Node Pool

Make sure the cluster is created with the given name; in this case it is "my-gke-cluster".

![image](https://user-images.githubusercontent.com/59161665/113649303-cf577780-9653-11eb-97b6-ff96435f6418.png)

Click on "my-gke-cluster" and make sure the node pool is created with the given name; in this case it is "default-node-pool".

![image](https://user-images.githubusercontent.com/59161665/113649380-f57d1780-9653-11eb-95bc-3bb0b460e6ce.png)

![image](https://user-images.githubusercontent.com/59161665/113649457-15144000-9654-11eb-9b96-80506f60c118.png)

Below the Node Pools is the number of nodes, which should be greater than or equal to your  mininmum node count and less than or equal to your maximum node count

## Done!

You have successfully created kubernetes clusters and node pools in GKE using Terraform!

## Kubectl: Deploying MongoDB in k8s pod

In this section, we will connect kubectl to our cluster that was previously created in GKE. Then we will create StorageClass, PersistentVolume, and PersistentVolumeClaim for the MongDB pod. This allow its content to persist even after pod shutdown. Then we will proceed to deploy the MongoDB pod.

### Connecting kubectl to your GKE Cluster

![image](https://user-images.githubusercontent.com/59161665/113649955-024e3b00-9655-11eb-902d-42e73513df22.png)

![image](https://user-images.githubusercontent.com/59161665/113656032-9e317400-9660-11eb-805c-b7f5b0b78246.png)

Run the command given by the GKE. In my project the command would be:

![image](https://user-images.githubusercontent.com/59161665/113656153-df298880-9660-11eb-97cc-5a510b68cdea.png)

### Check your connection

Use the following command to check that your kubectl has been configured correctly:

```bash
kubectl config get-contexts
```

![image](https://user-images.githubusercontent.com/59161665/113656386-670f9280-9661-11eb-9948-e6dd43b1a667.png)

### Go into the mongodb directory

```bash
cd mongodb
```

### Deploy the pod

Apply the yaml file in the following order:

```bash
kubectl apply -f storage.yaml
```
```
kubectl apply -f volume.yaml
```
```
kubectl apply -f volumeclaim.yaml
```
```
kubectl apply -f secret.yaml
```
```
kubectl apply -f deployment.yaml
```
```
kubectl apply -f service.yaml
```

For convience, a Makefile is already been made and can run the yaml file in those order as well:

```bash
make storage
```
```
make deploy
```

![image](https://user-images.githubusercontent.com/59161665/113658152-1e59d880-9665-11eb-9036-6fab3f64f970.png)

### Check to make sure your result was made

#### StorageClass

```
kubectl get storageclass
```

![image](https://user-images.githubusercontent.com/59161665/113658450-b1930e00-9665-11eb-9130-8810f1399386.png)

#### PersistentVolume

```
kubectl get persistentvolume
```

![image](https://user-images.githubusercontent.com/59161665/113658415-a2ac5b80-9665-11eb-8af8-e2a00e44a65e.png)

#### PersistentVolumeClaim

```
kubectl get persistentvolumeclaim
```

![image](https://user-images.githubusercontent.com/59161665/113658551-e1daac80-9665-11eb-8793-c3871853f54c.png)

#### Secret

```
kubectl get secret
```
![image](https://user-images.githubusercontent.com/59161665/113658610-f454e600-9665-11eb-9c9d-5fc2d4aabe47.png)

#### Deployment(This is also checking to see if the k8s pod has been launched)

```
kubectl get deployment
```
![image](https://user-images.githubusercontent.com/59161665/113658635-0040a800-9666-11eb-8220-20d15d0926f9.png)

#### Service

```
kubectl get service
```
![image](https://user-images.githubusercontent.com/59161665/113658711-25cdb180-9666-11eb-8b71-661a6b760302.png)

### Check on GKE

You can click on any of the following deployment to get more information about them, though they'll mostly contain information already provided by the yaml file.

#### Secret

![image](https://user-images.githubusercontent.com/59161665/113658976-b5736000-9666-11eb-9e45-41027f9ff0a7.png)

#### StorageClass

![image](https://user-images.githubusercontent.com/59161665/113658843-704f2e00-9666-11eb-8bcb-9948d946d7ed.png)

#### PersistentVolumeClaim

![image](https://user-images.githubusercontent.com/59161665/113658880-82c96780-9666-11eb-965b-02a69b2211c7.png)

#### Service

![image](https://user-images.githubusercontent.com/59161665/113658909-9aa0eb80-9666-11eb-9bf2-ee1393885ceb.png)

#### Pod

![image](https://user-images.githubusercontent.com/59161665/113658786-4dbd1500-9666-11eb-81f1-53c1ea365887.png)

## Done!

You have successfully deployed a MongoDB container pod in the Google's Kubernetes Engine!

To test the MongoDB pod for data persistency between shutdown, check out Test.md.
To destroy the pod deployed and the GKE Cluster, check out Destroy.md.

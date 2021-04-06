# Capstone Project for Software Engineering

## Description

In this project, we will be deploying an instance of a containerized MongoDB to a kubernetes environment in the cloud using Terraform. In addition to deploying MongoDB, each instance data will be persist upon pod shutdown.

## Software Requirements

* any provider to host kubernetes environments (AWS, GCP, Azure). This tutorial will only include GCP. This requires enable billing
* gcloud CLI tool: https://cloud.google.com/sdk/docs/install
* kubectl CLI tool: https://kubernetes.io/docs/tasks/tools/
* Terraform CLI tool: https://www.terraform.io/downloads.html

## Setting Up GCP Project

### Go to GCP Cloud Console

![image](https://user-images.githubusercontent.com/59161665/113643275-91eced00-9647-11eb-8c69-2fc775bf2269.png)

### Create a new Project and enable billing
1.
![image](https://user-images.githubusercontent.com/59161665/113643532-28211300-9648-11eb-860c-0a8798b65593.png)
2.
![image](https://user-images.githubusercontent.com/59161665/113643590-45ee7800-9648-11eb-9679-f5424d90696f.png)
3.
![image](https://user-images.githubusercontent.com/59161665/113643736-91a12180-9648-11eb-8480-10794049325e.png)

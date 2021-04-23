# Provider info
# Enter your project ID into the REPLACE_ME section
variable "project_id" {
	default		= "REPLACE_ME"
}
variable "region" {
	default		= "us-central1"
}

# Cluster specs
# Feel fre to change any of the fields to meet your respective 
# cluster specs.
#
# Enter your Service Accoun into the REPLACE_ME section
variable "cluster_name" {
	default		= "my-gke-cluster"
}
# set of virtualization hardward. 
# More detail on different machine types: https://cloud.google.com/compute/docs/machine-types
variable "machine_type" {
	default		= "n1-standard-1"
}
# minimum number of nodes. Minimum is 0.
variable "min_count" {
	default		= 1
}
# maximum number of nodes. GKE standard max is 1000 nodes per cluster. 
variable "max_count" {
	default		= 3
}
# Size of the disk_type
# For zonal "pd-standard": minimum is 10GB, maximum is 64TB
# For regional "pd-standard": minimum is 200GB, maximum is 64TB
# For list of all disk type and their possible disk size: https://cloud.google.com/compute/docs/disks
variable "disk_size_gb" {
	default		= 50
}
# type of persistent disk(pd) for the node
# For different type of persistent disk: https://cloud.google.com/kubernetes-engine/docs/how-to/custom-boot-disks
variable "disk_type" {
	default		= "pd-standard"
}
# Node image. This is the operating system image that run on each node. COS = Container-Optimized OS with Docker.
# For different type of image: https://cloud.google.com/kubernetes-engine/docs/concepts/node-images
variable "image_type" {
	default		= "COS"
}
# starting number of node if your gke cannot support up to the maximum number of nodes
variable "initial_node_count" {
	default		= 1
}
# Google Cloud Platform IAM account
variable "service_account" {
	default		= "REPLACE_ME"
}

variable "ip_range_pods" { 
	default 	= ""
}
variable "ip_range_services" {
	default		= ""
}
variable "network" { 
	default 	= "default"
}
variable "subnetwork" {
	default		= ""
}







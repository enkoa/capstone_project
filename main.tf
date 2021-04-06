module "gke" {
	source 				= "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"

	project_id			= var.project_id
	name				= var.cluster_name
	region				= var.region
	network				= var.network
	subnetwork			= var.subnetwork
	ip_range_pods			= var.ip_range_pods
	ip_range_services		= var.ip_range_services

	create_service_account 		= false
	remove_default_node_pool 	= true

	node_pools = [
		{
			name 			= "default-node-pool"
			machine_type 		= var.machine_type
			min_count		= var.min_count
			max_count		= var.max_count
			disk_size_gb 		= var.disk_size_gb
			disk_type		= var.disk_type
			image_type		= var.image_type
			auto_repair		= true
			auto_upgrade		= true
			service_account 	= var.service_account
			preemptible		= true
			initial_node_count 	= var.initial_node_count
		},
	]
	node_pools_oauth_scopes = {
    		all = []
   		default-node-pool = [
      		"https://www.googleapis.com/auth/cloud-platform",
    		]
 	}

  	node_pools_labels = {
    		all = {}
		default-node-pool = {
      		default-node-pool = true
    		}
  	}

  	node_pools_metadata = {
    		all = {}
    		default-node-pool = {
      		node-pool-metadata-custom-value = "my-node-pool"
    		}
  	}

  	node_pools_taints = {
    		all = []
    		default-node-pool = [
      	{
        		key    = "default-node-pool"
        		value  = true
        		effect = "PREFER_NO_SCHEDULE"
      	},
    		]
  	}

  	node_pools_tags = {
    		all = []
    		default-node-pool = [
      		"default-node-pool",
    		]
  	}

}


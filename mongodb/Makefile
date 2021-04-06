storage:
	kubectl apply -f storage.yaml
	kubectl apply -f volume.yaml
	kubectl apply -f volumeclaim.yaml

deploy:
	kubectl apply -f secret.yaml
	kubectl apply -f deployment.yaml
	kubectl apply -f service.yaml
	
	
clean:
	kubectl delete secret mongodb-cred
	kubectl delete deployment mongodb
	kubectl delete service mongodb-service

clean_storage:
	kubectl delete storageclass mongodb-storage
	kubectl delete persistentvolume mongodb-pv
	kubectl delete persistentvolumeclaim mongodb-claim
	

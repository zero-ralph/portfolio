create_infra:
	terraform init
	terraform validate
	terraform plan -var-file=dev.tfvars 
	terraform apply -var-file=dev.tfvars -auto-approve

destroy_infra:
	terraform destroy -var-file=dev.tfvars -auto-approve


recreate_infra:
	make destroy_infra
	make create_infra
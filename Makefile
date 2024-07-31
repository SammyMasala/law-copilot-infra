tf-plan-management:
	terraform workspace select management
	terraform plan

tf-apply-management:
	terraform workspace select management
	terraform apply

tf-plan-staging:
	terraform workspace select staging
	terraform plan

tf-apply-staging:
	terraform workspace select staging
	terraform apply

tf-plan-production:
	terraform workspace select production
	terraform plan

tf-apply-production:
	terraform workspace select production
	terraform apply
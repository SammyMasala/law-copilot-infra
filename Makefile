tf-plan-staging:
	terraform workspace select staging
	terraform plan

tf-plan-production:
	terraform workspace select production
	terraform plan
# Makefile for Terraform project

.PHONY: all init plan apply destroy validate

ENV_VAR_FILE := "./environments/dev/dev.tfvars"
BACKEND_CONF := "./environments/dev/dev_backend.tf"

all: validate plan apply

init:
	@echo "[INFO] Initializing Terraform with config ${BACKEND_CONF}, environment file ${ENV_VAR_FILE}"
	@cd terraform && terraform init -reconfigure -backend-config=${BACKEND_CONF} -no-color

plan:
	@echo "[INFO] Planning Terraform execution"
	@cd terraform && terraform plan -no-color -var-file=${ENV_VAR_FILE} -out=plan.out

apply:
	@echo "[INFO] Applying Terraform changes"
	@cd terraform && terraform apply -no-color -auto-approve plan.out

validate:
	@echo "[INFO] Validating Terraform code"
	@cd terraform && terraform validate -no-color -var-file=${ENV_VAR_FILE}

destroy:
	@echo "[INFO] Destroying Terraform-managed infrastructure"
	@cd terraform && terraform destroy -no-color -auto-approve -var-file=${ENV_VAR_FILE}

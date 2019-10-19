GOOGLE_APPLICATION_CREDENTIALS=/home/n0npax/flowers-255011-dfe7de1a6709.json
.PHONY: all
fmt:
	terraform fmt .

init:
	terraform init .

plan: fmt init
	terraform $@ --var-file ../dev.tfvars --var-file ../common.tfvars

apply: fmt init
	terraform $@ --var-file ../dev.tfvars --var-file ../common.tfvars --auto-approve

destroy: init
	terraform $@ --var-file ../dev.tfvars --var-file ../common.tfvars --auto-approve

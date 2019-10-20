# Build and deploy apps

## CI/CD

Cretes triggers for platform and appliaction uServices. Setups proper permission for CI/CD.

### Platform

Runs terraform plan/apply. Terraform state file is stored in `gcs` bucket

#### IAM

All changes to IAM should to be applied by running make apply localy(using admin account).
For security reasons cloudbuild can modify just specified resources.

### App

Any application under `apps` directory which contain cloudbuild.yaml file will be configured in cloudbuild.

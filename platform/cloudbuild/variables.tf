variable "location" {
  type    = "string"
  default = "australia-southeast1"
}

variable "project_id" {
  type = "string"
}

variable "branch" {
  type = string
}

variable "env" {
  type = string
}

variable "cloudbuild_sa" {
  type = string
}

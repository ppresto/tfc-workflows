
variable "prefix" {
  description = "Name prefix to add to the resources"
  default     = "tfc-agent"
}

# Workspace Variables
variable "tfe_hostname" {default     = "app.terraform.io"}
variable "organization" { default = "presto-projects" }
variable "tfe_token" {}
variable "oauth_token_id" {}
variable "repo_org" {}
variable "repo_branch" { default = "master"}
variable "global_remote_state" {default = ""}

variable "aws_default_region" {}
variable "aws_secret_access_key" {}
variable "aws_access_key_id" {}

variable "iam_teams" {
  default = {
    "team1" = {
      "name" : "team1",
      "env" : "dev",
      "gsa" : "gsa-tfc-team1",
      "namespace" : "tfc-team1",
      "k8s_sa" : "tfc-team1-dev",
      "roles" : ["compute.admin","storage.objectAdmin"],
    },
    "team2" = {
      "name" : "team2",
      "env" : "dev",
      "gsa" : "gsa-tfc-team2",
      "namespace" : "tfc-team2",
      "k8s_sa" : "tfc-team2-dev",
      "roles" : ["storage.objectAdmin"],
    }
  }
}
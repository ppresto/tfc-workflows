module "tfc_policies_ws" {
    source = "../modules/workspace-mgr-vcs"
    agent_pool_id     = ""
    organization = var.organization
    workspacename = "tfc_policyset"
    workingdir = "governance/third-generation/aws/"
    tfversion = "1.0.5"
    queue_all_runs = false
    auto_apply = true
    identifier     = "${var.repo_org}/terraform-guides"
    oauth_token_id = var.oauth_token_id
    repo_branch         = "master"
    global_remote_state = false
    env_variables = {
        "CONFIRM_DESTROY" : 1
    }
    env_variables_sec = {}
    tf_variables = {
        "project_name" = "Sentinel_Policy_as_Code"
        "prefix" = "presto"
        "tfe_organization" = var.organization
        "repo_org" = var.repo_org
        "tfe_hostname" = "app.terraform.io"
    }
    tf_variables_sec = {
        "tfe_token"      = var.tfe_token
        "oauth_token_id" = var.oauth_token_id
    }
}

// Add Sentinel Policy Set
resource "tfe_policy_set" "org" {
  #count                  = "${var.policies_org ? 1 : 0}"
  name                   = "policy"
  description            = "Organization Policies"
  organization           = var.organization
  policies_path          = "governance/third-generation/aws/"
  workspace_ids          = [
    "${local.workspaces["patspets_dev"]}",
    "${local.workspaces["webapp_vcs"]}"
  ]

  vcs_repo {
    identifier         = "${var.repo_org}/terraform-guides"
    branch             = "master"
    ingress_submodules = false
    oauth_token_id     = "${var.oauth_token_id}"
  }
}

data "tfe_workspace_ids" "all" {
  names        = ["*"]
  organization = var.organization
}

locals {
  workspaces = "${data.tfe_workspace_ids.all.ids}" # map of names to IDs
}

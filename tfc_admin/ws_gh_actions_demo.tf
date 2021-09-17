data "tfe_team" "test" {
  name         = "owner"
  organization = var.organization
}

resource "tfe_team_token" "owner" {
  team_id = data.tfe_team.test.id
}

module "ghactions_workspace" {
    source = "../modules/workspace-mgr-api"
    agent_pool_id     = ""
    organization = var.organization
    workspacename = "gh-actions-demo"
    workingdir = ""
    tfversion = "1.0.5"
    queue_all_runs = false
    auto_apply = true
    identifier     = "${var.repo_org}/learn-terraform-github-actions"
    oauth_token_id = var.oauth_token_id
    repo_branch         = var.repo_branch
    global_remote_state = true
    env_variables = {
        "CONFIRM_DESTROY" : 1
        "AWS_DEFAULT_REGION"      : var.aws_default_region
        "AWS_ACCESS_KEY_ID"       : var.aws_access_key_id
    }
    env_variables_sec = {
    "AWS_SECRET_ACCESS_KEY"        : var.aws_secret_access_key
    }
    tf_variables = {
    "prefix" = "presto"
    }
    tf_variables_sec = {
        "tfe_token"      = tfe_team_token.owner.token
    }
}
module "webapp_ghactions_ws" {
    source = "../modules/workspace-mgr-api"
    agent_pool_id     = ""
    organization = var.organization
    workspacename = "webapp"
    workingdir = "webapp"
    tfversion = "1.0.5"
    queue_all_runs = false
    auto_apply = true
    identifier     = "${var.repo_org}/tfc-workflows"
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
     "TF_API_TOKEN"      = tfe_team_token.owner.token
    }
    tf_variables_sec = {
        "tfe_token"      = tfe_team_token.owner.token
    }
}
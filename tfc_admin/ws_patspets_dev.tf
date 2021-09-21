module "patspets_ws" {
    source = "../modules/workspace-mgr-vcs"
    agent_pool_id     = ""
    organization = var.organization
    workspacename = "patspets_dev"
    workingdir = "tfe/"
    tfversion = "1.0.5"
    queue_all_runs = false
    auto_apply = true
    identifier     = "${var.repo_org}/patspets"
    oauth_token_id = var.oauth_token_id
    repo_branch         = "dev"
    global_remote_state = true
    env_variables = {
        "CONFIRM_DESTROY" : 1
        "AWS_DEFAULT_REGION"      : var.aws_default_region
    }
    env_variables_sec = {}
    tf_variables = {
    "prefix" = "presto-projects"
    "organization" = var.organization
    }
    tf_variables_sec = {}
}
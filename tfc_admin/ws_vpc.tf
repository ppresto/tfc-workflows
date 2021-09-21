module "vpc_ws" {
    source = "../modules/workspace-mgr-vcs"
    agent_pool_id     = ""
    organization = var.organization
    workspacename = "vpc"
    workingdir = "vpc"
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
    }
    env_variables_sec = {}
    tf_variables = {
    "prefix" = "presto-projects"
    }
    tf_variables_sec = {}
}
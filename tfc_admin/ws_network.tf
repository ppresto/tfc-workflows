module "vpc_ws" {
    source = "../modules/workspace-mgr-vcs"
    agent_pool_id     = ""
    organization = var.organization
    workspacename = "vpc"
    workingdir = ""
    tfversion = "0.11.14"
    queue_all_runs = false
    auto_apply = true
    identifier     = "${var.repo_org}/tf-aws-standard-network"
    oauth_token_id = var.oauth_token_id
    repo_branch         = "master"
    global_remote_state = true
    env_variables = {
        "CONFIRM_DESTROY" : 1
        "AWS_DEFAULT_REGION"      : var.aws_default_region
    }
    env_variables_sec = {}
    tf_variables = {
    "prefix" = "presto-projects"
    "organization" = var.organization
    "ssh_key_name" = "ppresto-ptfe-dev-key"
    }
    tf_variables_sec = {}
}
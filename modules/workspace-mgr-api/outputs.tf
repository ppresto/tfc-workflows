output "Workspace" {
  value = var.workspacename
}
output "ws-id" {
  value = tfe_workspace.ws-api.id
}
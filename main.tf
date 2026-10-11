resource "google_service_directory_service_iam_binding" "service_directory_service_iam_bindings" {
  for_each = var.service_directory_service_iam_bindings

  members = each.value.members
  name    = each.value.name
  role    = each.value.role

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}


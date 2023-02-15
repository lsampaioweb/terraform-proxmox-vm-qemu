# output "all" {
#   value       = module.project
#   description = "The returned values."
# }

# output "_expected" {
#   value       = values(var.test_cases)[*].target_node
#   description = "The expected values."
# }

# output "_returned" {
#   value       = values(module.project)[*].target_node
#   description = "The returned values."
# }

output "result" {
  value = [for key, value in var.test_cases :
    var.test_cases[key].target_node == module.project[key].target_node &&
    var.test_cases[key].name == module.project[key].name &&
    var.test_cases[key].clone == module.project[key].clone
  ]
  description = "The comparison of the expected and returned values."
}

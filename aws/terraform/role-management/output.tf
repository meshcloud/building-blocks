output "summary" {
    description = "Summary of building block outputs in Markdown format."
    value = <<EOF

**Approval**: ${var.approval == true ? "The role assignement request was approved" : "The role assignment request was **rejected**."}
EOF
} 
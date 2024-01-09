resource "null_resource" "sg_integration" {
  provisioner "local-exec" {
    command = <<EOF

curl -o sg-cli https://raw.githubusercontent.com/StackGuardian/sg-cli/main/sg-cli
chmod +x sg-cli

./sg-cli stack create --org ${var.sg_organization} --workflow-group ${var.sg_workflow_group} --run --output-json --wait --patch-payload '{"ResourceName": "${var.customer_id}_${var.project_id}_${var.building_block_uuid}","TemplatesConfig": {"templates": [{"VCSConfig": {"iacInputData": {"schemaType": "RAW_JSON","data": {"sg_subscription_id": "${var.subscription_id}","sg_tenant_id": "${var.tenant_id}"}}}}]}}' -- payload.json > output.txt

if grep -qi 'Stack name not unique' output.txt
then
  echo "Stack Name: ${var.customer_id}_${var.project_id}_${var.building_block_uuid} already exists. Running APPLY on existing Stack"
  ./sg-cli stack apply --org ${var.sg_organization} --workflow-group ${var.sg_workflow_group} --stack-id ${var.customer_id}_${var.project_id}_${var.building_block_uuid} --output-json --wait > output.txt
fi

cat output.txt
rm output.txt
EOF
  }
}

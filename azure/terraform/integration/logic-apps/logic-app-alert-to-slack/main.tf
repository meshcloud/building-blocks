locals {
  logicapp_name = "alert-to-slack"
}
resource "azurerm_resource_group" "workflow_rg" {
  name     = "rg-${var.location}-workflow"
  location = var.location
}

resource "azurerm_resource_group_template_deployment" "rg_worklow_deployment" {
  name                = local.logicapp_name
  resource_group_name = azurerm_resource_group.workflow_rg.name
  deployment_mode     = "Incremental"
  template_content    = <<TEMPLATE
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "logicAppName": {
      "type": "string",
      "defaultValue": "${local.logicapp_name}",
      "metadata": {
        "description": "The name for the logic app."
      }
    },
    "slackConnectionName": {
      "type": "string",
      "defaultValue": "SlackConnection",
      "metadata": {
        "description": "The name for the Slack connection."
      }
    },
    "slackChannel": {
      "type": "string",
      "defaultValue": "${var.slackchannel}",
      "metadata": {
        "description": "The Slack channel to post to."
      }
    },
    "location": {
      "type": "string",
      "defaultValue": "${azurerm_resource_group.workflow_rg.location}",
      "metadata": {
        "description": "Location for all resources."
      }
    }
  },
  "variables": {},
  "resources": [
    {
      "type": "Microsoft.Web/connections",
      "apiVersion": "2018-07-01-preview",
      "location": "[parameters('location')]",
      "name": "[parameters('slackConnectionName')]",
      "properties": {
        "api": {
          "id": "[subscriptionResourceId('Microsoft.Web/locations/managedApis', parameters('location'), 'slack')]"
        },
        "displayName": "slack"
      }
    },
    {
      "type": "Microsoft.Logic/workflows",
      "apiVersion": "2019-05-01",
      "name": "[parameters('logicAppName')]",
      "dependsOn": [
        "[resourceId('Microsoft.Web/connections', parameters('slackConnectionName'))]"
      ],
      "location": "[parameters('location')]",
      "properties": {
        "definition": {
          "$schema": "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#",
          "contentVersion": "1.0.0.0",
          "parameters": {
            "$connections": {
              "defaultValue": {},
              "type": "Object"
            }
          },
          "triggers": {
            "manual": {
              "type": "request",
              "kind": "Http",
              "inputs": {
                "schema": {
                  "$schema": "http://json-schema.org/draft-04/schema#",
                  "properties": {
                    "context": {
                      "properties": {
                        "name": {
                          "type": "string"
                        },
                        "portalLink": {
                          "type": "string"
                        },
                        "resourceName": {
                          "type": "string"
                        }
                      },
                      "required": [
                        "name",
                        "portalLink",
                        "resourceName"
                      ],
                      "type": "object"
                    },
                    "status": {
                      "type": "string"
                    }
                  },
                  "required": [
                    "status",
                    "context"
                  ],
                  "type": "object"
                }
              }
            }
          },
          "actions": {
            "Post_Message": {
              "type": "ApiConnection",
              "inputs": {
                "host": {
                  "connection": {
                    "name": "@parameters('$connections')['slack']['connectionId']"
                  }
                },
                "method": "post",
                "path": "/chat.postMessage",
                "queries": {
                  "channel": "[parameters('slackChannel')]",
                  "text": "Azure Alert - '@{triggerBody()['data']['essentials']['description']}' '@{triggerBody()['data']['alertContext']['AlertData']['BudgetName']}' '@{triggerBody()['data']['alertContext']['AlertData']['BudgetThreshold']}' '@{triggerBody()['data']['alertContext']['AlertData']['NotificationThresholdAmount']}' '@{triggerBody()['data']['alertContext']['AlertData']['Scope']}' "
                }
              }
            }
          },
          "outputs": {}
        },
        "parameters": {
          "$connections": {
            "value": {
              "slack": {
                "id": "[subscriptionResourceId('Microsoft.Web/locations/managedApis', parameters('location'), 'slack')]",
                "connectionId": "[resourceId('Microsoft.Web/connections', parameters('slackConnectionName'))]"
              }
            }
          }
        }
      }
    }
  ],
  "outputs": {
    "WebHookURI": {
      "type": "string",
      "value": "Use 'listCallbackURL(resourceId('Microsoft.Logic/workflows/triggers', parameter('logicAppName'), 'manual'), '2019-05-01').value' to retrieve the callback URL, the value contains a secret and is not recommended in an output."
    }
  }
}
TEMPLATE

  // NOTE: whilst we show an inline template here, we recommend
  // sourcing this from a file for readability/editor support
}



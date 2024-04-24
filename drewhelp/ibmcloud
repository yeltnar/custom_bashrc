# how to update code engine container with cli 

### login (make sure to note account)
`ibmcloud login --sso`

### set resource group (check here https://cloud.ibm.com/account/resource-groups)
`ibmcloud target -g $RESOURCE_GROUP`
### eg
`ibmcloud target -g cc-664003u337-wuntljx4`

### project (check here https://cloud.ibm.com/codeengine/projects)
`ibmcloud ce project select -n cc-664003u337-wuntljx4-codeengine`

### install code engine plugin 
`ibmcloud plugin install code-engine`

### list applications 
`ibmcloud ce app list`

### deploy new version of the app
`ibmcloud ce app update --name oncor-backend`

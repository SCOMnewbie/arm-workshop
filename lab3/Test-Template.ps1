<#
OK, so our template is now looking pretty good. The major issue with it is that it does not ensure that the storageAccount will be unique and therefore the success of the deployment cannot be assured. Let’s fix that by using a variable and some of the functions that are available.
#>
$Rg = "lab3"
$location = "West Europe"
$template = '.\azuredeploy.json'
$ParamFile = '.\azuredeploy.parameters.json'

az group create -g $rg -l $location

az group deployment validate -g $rg --template-file $template  --parameters $ParamFile

#az group delete -g $rg -y --no-wait
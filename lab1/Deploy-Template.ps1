<#
OK, so our template is now looking pretty good. The major issue with it is that it does not ensure that the storageAccount will be unique and therefore the success of the deployment cannot be assured. Let’s fix that by using a variable and some of the functions that are available.
#>
$Rg = "lab1"
$location = "West Europe"
$job = "job2"
$storageAccount = "fanfteststgacc"
$template = '.\azuredeploy.json'

az group create -g $rg -l $location
#Won't work with the message New-AzureRmResourceGroupDeployment : 21:28:31 - Error: Code=InvalidTemplate; Message=Deployment template validation failed:..
#New-AzureRmResourceGroupDeployment -Name $job -storageAccount $storageAccount -accounttype "Premium_RAGRS" -TemplateFile $template -ResourceGroupName $rg
#Will work
New-AzureRmResourceGroupDeployment -Name $job -storageAccount $storageAccount -TemplateFile $template -ResourceGroupName $rg


#az group delete -g $rg -y --no-wait
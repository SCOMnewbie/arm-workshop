$Rg = "lab1"
$location = "West Europe"
$job = "job2"
$storageAccount = "fanfteststgacc"
$template = '.\azuredeploy.json'

az group create -g $rg -l $location
#Won't work with the message New-AzureRmResourceGroupDeployment : 21:28:31 - Error: Code=InvalidTemplate; Message=Deployment template validation failed:..
New-AzureRmRe
#Will work
New-AzureRmResourceGroupDeployment -Name $job -storageAccount $storageAccount -TemplateFile $template -ResourceGroupName $rg


#az group delete -g $rg -y --no-wait
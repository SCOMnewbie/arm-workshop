<#
OK, so our template is now looking pretty good. The major issue with it is that it does not ensure that the storageAccount will be unique and therefore the success of the deployment cannot be assured. Let’s fix that by using a variable and some of the functions that are available.
#>
$Rg = "lab1"
$location = "West Europe"
$job = "job3"
$storageAccount = "fanfteststgacc"
$template = '.\azuredeploy.json'

az group create -g $rg -l $location

#Will work
New-AzureRmResourceGroupDeployment -Name $job -TemplateFile $template -ResourceGroupName $rg

#Let's try with splatting > no additionnal param should work
$HashArguments = @{
    Name              = "Job3"
    TemplateFile      = $template
    ResourceGroupName = $rg
}
New-AzureRmResourceGroupDeployment @HashArguments

#Won't work too long string
az group create -g $rg -l $location
$HashArguments = @{
    Name              = "Job3"
    storageNamePrefix = "bliblabloobly"
    TemplateFile      = $template
    ResourceGroupName = $rg
}
New-AzureRmResourceGroupDeployment @HashArguments
#Error: New-AzureRmResourceGroupDeployment : 23:34:26 - Error: Code=InvalidTemplate; Message=Deployment template validation failed: 'The provided value for the template
#parameter 'storageNamePrefix' at line '7' and column '30' is not valid. Length of the value should be less than or equal to '10'. Please see

#az group delete -g $rg -y --no-wait
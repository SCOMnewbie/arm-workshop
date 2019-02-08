<#
OK, so our template is now looking pretty good. The major issue with it is that it does not ensure that the storageAccount will be unique and therefore the success of the deployment cannot be assured. Let’s fix that by using a variable and some of the functions that are available.
#>
$Rg = "lab1"
$location = "West Europe"
$template = '.\azuredeploy.json'
$ParamFile = '.\azuredeploy.parameters.json'

az group create -g $rg -l $location

#Seems buggy with my current version
Test-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile $template -TemplateParameterFile $ParamFile
#Use CLI instead
az group deployment validate -g $rg --template-file $template  --parameters $ParamFile

$HashArguments = @{
    Name                  = $('job.' + ((Get-Date).ToUniversalTime()).tostring("MMddyy.HHmm"))
    #storageNamePrefix = "FANFarm"
    TemplateFile          = $template
    TemplateParameterFile = $ParamFile
    ResourceGroupName     = $rg
}
$Deployment = New-AzureRmResourceGroupDeployment @HashArguments
$Deployment

#Generate a hashtable
$Deployment.Outputs
$Deployment.Outputs['storageName']
$Deployment.Outputs['storageName'].Value
#will give the stg acc name


#az group delete -g $rg -y --no-wait
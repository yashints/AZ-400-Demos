@description('Location of the app service plan')
param appServicePlanLocation string

@description('The app service plan name')
param appServicePlanName string

@description('The app service plan sku name')
param appServicePlanSkuName string

@description('The app service plan capacity')
param appServicePlanCapacity int

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: appServicePlanName
  location: appServicePlanLocation
  sku: {
    name: appServicePlanSkuName
    capacity: appServicePlanCapacity
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

output appServicePlanId string = appServicePlan.id

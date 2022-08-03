@description('Name of the app service plan')
param appServiceName string

@description('Location of the app service plan')
param appServiceLocation string

@description('Name of the slot that we want to create in our App Service')
param appServiceSlotName string

@description('The Server Farm Id for our App Plan')
param serverFarmId string

@description('Name of the Azure Container Registry that this App will pull images from')
param acrName string

@description('The docker image and tag')
param dockerImageAndTag string = '/hellobluegreenwebapp:latest'

// This is the ACR Pull Role Definition Id: https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles#acrpull
var acrPullRoleDefinitionId = subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '7f951dda-4ed3-4680-a7ca-43fe172d538d')

var appSettings = [
  {
    name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE'
    value: 'false'
  }
  {
    name: 'WEBSITES_PORT'
    value: '80'
  }
  {
    name: 'DOCKER_REGISTRY_SERVER_URL'
    value: 'https://${containerRegistry.properties.loginServer}'
  }
  {
    name: 'DOCKER_REGISTRY_SERVER_USERNAME'
    value: containerRegistry.name
  }
  {
    name: 'DOCKER_REGISTRY_SERVER_PASSWORD'
    value: containerRegistry.listCredentials().passwords[0].value
  }
]

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2021-09-01' existing = {
  name: acrName
}

resource appService 'Microsoft.Web/sites@2021-02-01' = {
  name: appServiceName
  location: appServiceLocation
  kind: 'app,linux,container'
  properties: {
    serverFarmId: serverFarmId
    siteConfig: {
      appSettings: appSettings
      linuxFxVersion: 'DOCKER|${containerRegistry.properties.loginServer}/${dockerImageAndTag}'
    }
  }

  resource blueSlot 'slots' = {
    name: appServiceSlotName
    location: appServiceLocation
    kind: 'app,linux,container'
    properties: {
      serverFarmId: serverFarmId
      siteConfig: {
        appSettings: appSettings
      }
    }
  }
}

@description('The container registry location')
param registryLocation string

@description('The container registry name')
param registryName string

@description('The container registry sku name')
param registrySku string

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2021-06-01-preview' = {
  name: registryName
  location: registryLocation
  sku: {
    name: registrySku
  }
  properties: {
    adminUserEnabled: true
  }
}

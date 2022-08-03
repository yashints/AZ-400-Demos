param subscriptionId string
param kvResourceGroup string
param kvName string
param location string = resourceGroup().location

resource kv 'Microsoft.KeyVault/vaults@2019-09-01' existing = {
  name: kvName
  scope: resourceGroup(subscriptionId, kvResourceGroup)
}

module sql './sql.bicep' = {
  name: 'deploySQL'
  params: {
    adminLogin: kv.getSecret('adminLogin')
    adminPassword: kv.getSecret('adminPassword')
    location: location
  }
}

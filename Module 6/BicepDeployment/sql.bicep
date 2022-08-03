@description('The name of the SQL logical server.')
param sqlServerName string = 'BicepSQLServer400'

@description('The name of the SQL Database.')
param sqlDBName string = 'MySQLDB'

@description('The administrator username of the SQL logical server.')
@secure()
param adminLogin string

@description('The administrator password of the SQL logical server.')
@secure()
param adminPassword string

@description('Location for all resources.')
param location string = resourceGroup().location

resource sqlServer 'Microsoft.Sql/servers@2021-08-01-preview' = {
  name: sqlServerName
  location: location
  properties: {
    administratorLogin: adminLogin
    administratorLoginPassword: adminPassword
  }
}

resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2021-08-01-preview' = {
  parent: sqlServer
  name: sqlDBName
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
}

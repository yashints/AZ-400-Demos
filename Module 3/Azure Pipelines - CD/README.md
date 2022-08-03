# Azure Pipeline deployment demo

This demo is designed to show case the ability to deploy a software to an environment.

## Before the class

Make sure you have an Azure DevOps account and organisation, an active GitHub account. Also create a personal access token in GitHub with with scopes (`admin:repo_hook`, `repo`, `user`) just in case you wanted to use `az devops login`.

If you do not have the extension, simply run the following:

```bash
az extension add --name azure-devops
```

> Fill out [this form to get parallel jobs for your project](https://aka.ms/azpipelines-parallelism-request).

You will also need two service connections, one for docker and one to deploy the web app. Follow [these instructions for docker registry](https://docs.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml#docker-registry-service-connection) and [these instructions for a generic one](https://docs.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml#azure-resource-manager-service-connection). Don't forget to grant permission to all pipelines before creating the service connections.

## During the class

Run the commands in the `run.azcli` file, then navigate to your Azure DevOps project. Then follow the following steps:

- Go to Pipelines and create a new pipeline.
- Select **GitHub** for the source code and then select your repository that you forked.
  > If you get redirected to GitHub to sign in, follow the steps and also install the Pipeline App if prompted.
- When you are navigated back to your pipeline setup, you should see a template like following getting created:

  ```yaml
  trigger:
    - master

  resources:
    - repo: self

  variables:
    # Container registry service connection established during pipeline creation
    dockerRegistryServiceConnection: "dockerserviceconnection"
    imageRepository: "aspcoredocker"
    containerRegistry: "azpipelinecddemo.azurecr.io"
    dockerfilePath: "$(Build.SourcesDirectory)/app/Dockerfile"
    tag: "$(Build.BuildId)"

    # Agent VM image name
    vmImageName: "ubuntu-latest"

  stages:
    - stage: Build
      displayName: Build and push stage
      jobs:
        - job: Build
          displayName: Build
          pool:
            vmImage: $(vmImageName)
          steps:
            - task: Docker@2
              displayName: Build and push an image to container registry
              inputs:
                command: buildAndPush
                repository: $(imageRepository)
                dockerfile: $(dockerfilePath)
                containerRegistry: $(dockerRegistryServiceConnection)
                tags: |
                  $(tag)
                  latest
  ```

- Replace the name of the container registry with `mycontainerregistry` or whatever you chose when you created it. Update the image repository name to something meaningful if you prefer too.
- Click on show assistant and select the **Azure Web App for Containers** from the list. Then fill the subscription (or select the ARM service connection), app name which is `azpipelinecddemowa`, and image name which should be `$(containerRegistry)/$(imageRepository):latest`. Press **Add** and view the snippet getting added to your `yaml` file. Make sure you clicked the right place before adding the script since `yaml` is indent and whitespace sensitive.
- Your `yaml` file should look like this:

  ```yaml
  trigger:
    - master

  pool: local

  resources:
    - repo: self

  variables:
    # Container registry service connection established during pipeline creation
    dockerRegistryServiceConnection: "azurecrsc"
    azureServiceConnection: "azuresc"
    imageRepository: "aspcoredocker"
    containerRegistry: "azpipelinecddemo.azurecr.io"
    dockerfilePath: "$(Build.SourcesDirectory)/app/Dockerfile"
    tag: "$(Build.BuildId)"
    webAppName: "azpipelinecddemowa"

  stages:
    - stage: Build
      displayName: Build and push stage
      jobs:
        - job: Build
          displayName: Build
          steps:
            - task: Docker@2
              displayName: Build and push an image to container registry
              inputs:
                command: buildAndPush
                repository: $(imageRepository)
                dockerfile: $(dockerfilePath)
                containerRegistry: $(dockerRegistryServiceConnection)
                tags: |
                  $(tag)
                  latest
            - task: AzureWebAppContainer@1
              displayName: "Azure Web App on Container Deploy"
              inputs:
                azureSubscription: $(azureServiceConnection)
                appName: $(webAppName)
                imageName: $(containerRegistry)/$(imageRepository):latest
  ```

- Save your pipeline and run it.
- Show case the result and the deployed web app.

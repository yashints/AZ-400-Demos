# Publishing packages to Azure Artifacts from Pipeline

This demo shows how to publish packages into Azure Artifacts from Azure Pipelines.

## Prerequisites

Have an Azure DevOps account and Azure CLI installed.

## Before class

Create a personal access token in your Azure DevOps by [following the instructions here](https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=Linux), for simplicity, set the scope to full access.

Replace the PAT with the variable in the scripts file called `run.azcli` and run the commands in a bash terminal.

## During the class

In your Azure DevOps project, create a new Feed, then create a new pipeline from the `ci.yaml` file in the project. Replace the `<projectName>/<feedName>` with the project and the name of the feed you just created. Save the pipeline and run it.

> 💡**Note:** If you faced an error pushing the package to your feed, it might be because of permission issues for your service account. [Use the instructions here](https://docs.microsoft.com/en-us/azure/devops/artifacts/feeds/feed-permissions?view=azure-devops#configure-feed-settings) to give the project/org service account contributor access to your feed.

# Blue green deployment demo

This demo uses GitHub **Actions** and **Azure App Services** to show case how to deploy an application using blue green deployment strategy.

## Prerequisites

You will need an active GitHub account and Azure subscription.

## Before the class

Run the commands in `run.azcli` up to line #12. Capture the output of the last command and use it to create a secret in your GitHub repository called `AZURE_CREDENTIALS`. Create another secret for the name of the resource group called `AZURE_RG`.

## During the class

Copy the content of the folder into a new folder and get rid of the git files. Then run the script from line #14 to #24.

> **Note**: If you have closed your terminal you need to run the first few lines to create the variables again.

Once the files are pushed up, there will be a new workflow triggered and an App Service Plan, App Service, and a Container Registry will get created in your resource group.

At this point you need to create three more secrets in your GitHub repository:

- `REGISTRY_LOGIN_SERVER`
- `REGISTRY_USERNAME`
- `REGISTRY_PASSWORD`

You can run the script from line #26 onwards.

Now trigger the deploy action and walk the learners through what is happening. In a nutshell we're deploying to the staging slot first, then validate and swap it with production.

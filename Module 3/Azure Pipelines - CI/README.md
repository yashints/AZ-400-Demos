# Azure Pipelines Demo

This demo will showcase an Azure DevOps pipeline and runs it off of a GitHub repository.

## Before the class

Make sure you have an Azure DevOps account and an organization created. Also create a personal access token in GitHub with with scopes (`admin:repo_hook`, `repo`, `user`) just in case you wanted to use `az devops login`.

If you do not have the extension, simply run the following:

```bash
az extension add --name azure-devops
```

> Fill out [this form to get parallel jobs for your project](https://aka.ms/azpipelines-parallelism-request).

## During the class

Open the `run.azcli` file and run the commands. Then navigate to Azure DevOps and perform the following steps:

- Navigate to your project.
- Go to pipelines, then select **New pipeline**.
- Select **GitHub** from the list of source code location.
- If you're redirected to GitHub to login, follow the prompts.
- Select the repository by searching for `pipelines-dotnet-core` and authorize the installation of Azure Pipelines app if prompted.
- In most cases Azure Pipeline will analyse your repository and suggest `ASP.Net Core`, but if it didn't just click on **show more** and select the option.
- Review the pipeline file and describe to students what's going on.
- Click save and run, when asked enter a commit message and select save and run again.
- Review the results.

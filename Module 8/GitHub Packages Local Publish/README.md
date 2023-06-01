# GitHub packages demo

In this demo we will publish a package to an organisation and then link it to a repository.

## Before the class

Have an active GitHub org, user and a PAT with `package:write` permission ready.

## During the class

Run the commands in the `run.azcli`. When prompted enter the package name in the format of `@orgname/packagename` and the rest.

Edit the `package.json` file and add the following snippet at the end:

```json
"publishConfig": {
  "registry": "https://npm.pkg.github.com"
}
```

Then run the `npm publish` command.

## Connect to a repository

If you already have a repository you can use that, otherwise commit the code here to a new repository, then navigate to your GitHub org, select the packages tab, select your package and click on **Connect Repository** button.

Once done review the content of README being shown on the package name.

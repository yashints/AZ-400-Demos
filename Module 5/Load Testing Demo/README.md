# Load test demo

This demo show cases how to automate performance regression testing with **Azure Load Testing Preview** and **GitHub Actions**.

## Prerequisites

Have an active GitHub account and Azure subscription handy. Also make sure you have Azure CLI and GitHub CLI installed.

## Before the class

Run the commands within `run.azcli` script. Open a browser and navigate to your GitHub repository. Go to the Actions section and trigger the action.

## During the class

Open a browser and navigate to your GitHub repository. Go to the Actions section and trigger it again. Show the learners what is happening and then go to the Azure Portal and show the test results.

Once done, go to the Code tab, open the `SampleApp.yml` and add the following snippet to the end of the file:

```yaml
failureCriteria:
  - avg(response_time_ms) > 100
  - percentage(error) > 20
```

You've now specified pass/fail criteria for your load test. The test will fail if at least one of these conditions is met:

The aggregate average response time is greater than 100 ms.
The aggregate percentage of errors is greater than 20%.

Commit and push the changes to the main branch of the repository, then trigger the action again.

Wait for the action to fail, then change the snippet in the `SampleApp.yml` file to:

```yaml
failureCriteria:
- avg(response_time_ms) > 5000
- percentage(error) > 20
```

Trigger the failed action only and show the results.

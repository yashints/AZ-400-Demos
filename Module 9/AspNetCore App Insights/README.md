# App insights demo

## Prerequisites

Have an Azure Account and DotNet CLI installed.

## Before the class

Run the commands in the `run.azcli` and capture the value of the connection string.

## During the class

Open the application using VS Code or Visual Studio. Open the `Program.cs` and add the following lines after the comment `// Add services to the container.`:

```cs

```

Next open the `appSettings.json` and add the following, replacing the connection string you got earlier:

```json
"ApplicationInsights": {
    "ConnectionString": "[The connection string goes here]"
  },
```

Next open the `HomeController.cs` and replace it with the following:

```cs
using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using ApplicationInsightsDemo.Models;
using Microsoft.ApplicationInsights;

namespace ApplicationInsightsDemo.Controllers;

public class HomeController : Controller
{
  private readonly ILogger<HomeController> _logger;
  private readonly TelemetryClient _insights;

  public HomeController(ILogger<HomeController> logger, TelemetryClient insights)
  {
    _logger = logger;
    _insights = insights;
  }

  public IActionResult Index()
  {
    _logger.LogInformation("Navigated to Index");
    TimeSpan span = new TimeSpan(1, 2, 1, 0, 0);
    _insights.TrackDependency("DependencyType", "myDependency", "myCall", DateTime.Now, span, false);
    return View();
  }

  public IActionResult Privacy()
  {
    return View();
  }

  [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
  public IActionResult Error()
  {
    return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
  }
}
```

Now run your application, open the page, navigate to the privacy page and back to home page. Wait a few mins and then show the results in the application insights page in Azure. There would be a dependency in the application map and you can show the logs in the search tab.

Feel free to add more if you like.

---
uuid: 47e8890e-1dde-4c95-bb3a-56eb09f18b1a
taxonomy-category-names:
- Development and Tooling
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Using Object Data with React Charts

Here you'll use [Objects](../objects.md), [Headless APIs](../objects/understanding-object-integrations/using-custom-object-apis.md), and [custom element remote applications](../integrating-external-applications/creating-a-basic-custom-element.md) to create a dynamic chart for data dashboards. First, you'll set up a new DXP instance with [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) enabled for Object API calls. Then, you'll create an Object for receiving and storing data. After adding data to the Object using REST APIs, you'll download and build the provided React [FusionCharts](https://www.fusioncharts.com/dev/getting-started/react/your-first-chart-using-react) application. Once the code is compiled, you'll host the generated `.js` file in the Liferay Document Library and copy its WebDAV URL. Finally, you'll use this URL to create a remote app for the React chart and deploy it as a Page widget.

The chart is configured to call the Object via Headless API every five seconds, which returns the Object's data and updates the chart dynamically.

![Use Liferay Objects with React charts to create dynamic visuals for data dashboard.](./using-object-data-with-react-charts/images/01.gif)

## Setting Up Liferay DXP

```{include} /_snippets/run-liferay-dxp.md
```

Then, follow these steps to add the `/o/c/*` URL pattern to the *Default Portal CORS Configuration*:

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Security Tools*.

1. Go to the *Portal Cross-Origin Resource Sharing (CORS)* tab and click *Default Portal CORS Configuration*.

   ![Click Default Portal CORS Configuration](./using-object-data-with-react-charts/images/02.png)

1. Add a *URL Pattern* with the `/o/c/*` value and click *Save*. This enables CORS for all Object APIs.

   ![Add the /o/c/* URL Pattern for Object APIs.](./using-object-data-with-react-charts/images/03.png)

## Creating an Object for the React Chart

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Objects*.

1. Click the *Add* button (![Add Button](../../images/icon-add.png)) and enter these values:

   | Field | Value |
   | :--- | :--- |
   | Label | X3J8-Object |
   | Plural Label | X3J8-Objects |
   | Name | X3J8Object |

   ```{note}
   The provided React app uses these values.
   ```

1. Select the new *Object* draft, click the *Field* tab, and add these *fields*:

   | Label | Field Name | Type | Required |
   | :--- | :--- | :--- | :--- |
   | Label | label | Text | &#10004; |
   | Value | value | Integer | &#10004; |

1. Click the *Details* tab and click *Publish*.

[Publishing an Object](../objects/creating-and-managing-objects/creating-objects.md#publishing-object-drafts) creates and activates a new application for receiving and storing data. You can now access it via the Liferay UI or Headless APIs.

## Adding Data to the Object using Headless APIs

1. Open Liferay's *API Explorer* (i.e., `localhost:8080/o/api`), click the *REST Applications* drop-down menu, and click *c/x3j8objects*.

1. Enter this data into the request body for the batch `POST` API:

   ```json
   [
     {
       "label": "FOO",
       "value": "250"
     },
     {
       "label": "BAR",
       "value": "200"
     },
     {
       "label": "GOO",
       "value": "150"
     },
     {
       "label": "BAZ",
       "value": "100"
     },
     {
       "label": "QUX",
       "value": "50"
     }
   ]
   ```

1. Click *Execute* to add the data entries to the Object.

Once you've finished adding data, you can set up the provided React server. This includes a FusionChart implementation that makes API calls to X3J8-Object and displays its data.

## Setting Up the React Chart

Follow these steps to download and build the React application:

1. Download and unzip the [React project](./liferay-x3j8.zip).

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/liferay-development/building-applications/liferay-x3j8.zip -O
   ```

   ```bash
   unzip liferay-x3j8.zip
   ```

   ```bash
   cd liferay-x3j8
   ```

1. Verify you have `node` and `yarn` installed. If you don't, run the following command and follow the prompts:

   ```bash
   ./setup_tutorial.sh
   ```

1. Navigate to the React application's folder and start the React server.

   ```bash
   cd x3j8-custom-element
   ```

   ```bash
   yarn start
   ```

   Once started, go to `localhost:3000` to view the React chart. It calls the `c/x3j8objects` service using Basic Authentication and retrieves the Object's data every five seconds.

   ![View the React chart at localhost:3000.](./using-object-data-with-react-charts/images/04.png)

1. Build the React project.

   ```bash
   yarn build
   ```

   This command creates an optimized production build, which includes the files necessary for running the application as a remote app.

1. Verify the build is successful and take note of the application's `.js` file.

   ```bash
   Creating an optimized production build...
   Compiled successfully.

   File sizes after gzip:

     523.77 kB  build/static/js/main.5a6819d5.js
     20 B       build/static/css/main.31d6cfe0.css
   ```

   ```{note}
   The `.css` file is unnecessary for this tutorial.
   ```

Once the code is compiled, you can host the application's `.js` file in the Liferay Document Library and copy its WebDAV URL.

## Hosting the Application's `.js` File

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Content & Data*, and click *Documents and Media*.

1. Drag and drop the `.js` file into the upload area.

   When uploaded to the Document Library, the file is assigned a unique WebDAV URL, which you'll use to create the remote app.

1. Click the *Info* icon (![Info Icon](../../images/icon-information.png)) and select the *uploaded file*.

1. Copy the file's *WebDAV URL* and save it for use in the next step.

   For example, `http://localhost:8080/webdav/guest/document_library/main.5a6819d5.js`.

   ![Copy the .js file's WebDAV URL.](./using-object-data-with-react-charts/images/05.png)

## Creating a Remote App for the React Chart

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), click the *Applications* tab, and select *Remote Apps*.

1. Click the *Add* button (![Add Button](../../images/icon-add.png)).

1. Enter these values:

   | Field | Value |
   | :--- | :--- |
   | Name | X3J8-Custom-Element |
   | Type | Custom Element |
   | HTML Element Name | `x3j8-custom-element` |
   | URL | WebDAV URL for the `.js` file |
   | Portlet Category Name | Remote Apps |

1. Click *Save*.

Once Saved, Liferay creates a widget for the remote app that you can deploy to Site Pages. This widget is listed under the application's Portlet Category Name (i.e., *Remote Apps* for this tutorial).

![You can deploy the remote app widget to Site Pages.](./using-object-data-with-react-charts/images/06.png)

## Related Topics

* [Objects Overview](../objects.md)
* [Headless Framework Integration](../objects/understanding-object-integrations/using-custom-object-apis.md)
* [Setting Up CORS](../../installation-and-upgrades/securing-liferay/securing-web-services/setting-up-cors.md)

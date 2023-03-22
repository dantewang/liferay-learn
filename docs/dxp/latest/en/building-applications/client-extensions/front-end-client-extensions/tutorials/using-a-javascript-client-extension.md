---
uuid: e26e34b4-ca1b-490b-b911-4ef92ad123ea
---
# Using a JavaScript Client Extension

{bdg-secondary}`Available Liferay 7.4 U45+/GA45+`

With a JavaScript (JS) client extension, you can run your own JavaScript on any page in Liferay without worrying about dependencies on Liferay code or developing a theme. Here you'll start with a JavaScript client extension (from a [sample workspace](https://github.com/liferay/liferay-portal/tree/master/workspaces/sample-workspace)).

## Prerequisites

To start developing client extensions,

1. Install Java (JDK 8 or JDK 11).

   ```{note}
   Check the [compatibility matrix](https://help.liferay.com/hc/en-us/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) for supported JDKs, databases, and environments. See [JVM Configuration](../../../../installation-and-upgrades/reference/jvm-configuration.md) for recommended JVM settings.
   ```

1. Download and unzip the sample workspace:

   ```bash
   curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
   ```

   ```bash
   unzip com.liferay.sample.workspace-latest.zip
   ```

All the necessary tools and a JS client extension are included in the sample workspace.

## Examine the Client Extension

The JS client extension is in the workspace's `client-extensions/sample-global-js/` folder. It's defined in the `client-extension.yaml` file:

```yaml
sample-global-js:
    name: Sample Global JS
    type: globalJS
    url: global.js
```

The client extension has the ID `sample-global-js` and contains the key configurations for a JS client extension, including the `type` and the JavaScript file to add. See the [JavaScript YAML configuration reference](../javascript-yaml-configuration-reference.md) for more information on the properties.

It also contains the `assemble` block:

```yaml
assemble:
    - from: assets
      include: "**/*"
      into: static
```

This specifies that everything in the `assets/` folder should be included as a static resource in the built client extension `.zip` file. The JavaScript code in a JS client extension is used as a static resource in Liferay.

The `assets/global.js` file contains this line of code:

```js
window.alert('Sample Global JS deployed.');
```

An alert box appears with the message when you open the page. Run additional JavaScript by adding to this file.

## Deploy the Client Extension to Liferay

```{include} /_snippets/run-liferay-portal.md
```

Once Liferay starts, run this command from the client extension's folder in the sample workspace:

```bash
../../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

This builds your client extension and deploys the zip to Liferay's `deploy/` folder.

```{note}
To deploy your client extension to Liferay Experience Cloud, use the Liferay Cloud [Command-Line Tool](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool) to run [`lcp deploy`](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool#deploying-to-your-liferay-cloud-environment).
```

```{tip}
To deploy all client extensions in the workspace simultaneously, run the command from the `client-extensions/` folder.
```

Confirm the deployment in your Liferay instance's console:

```
STARTED sample-global-js_1.0.0
```

Once your client extension is deployed successfully, configure Liferay to use it. 

## Use the Client Extension on a Page

Configure a page in Liferay to use your deployed client extension:

1. On a page in your instance, click the *Edit* icon ![Edit icon](../../../../images/icon-edit-pencil.png) at the top.

1. In the sidebar, navigate to the Page Design *Options* menu (![Page Design Options icon](../../../../images/icon-format.png)), and click the *Configuration* icon (![Configuration icon](../../../../images/icon-cog3.png)) at the top of the menu.

   ![Click the cog wheel icon in the Page Design Options menu to access this client extension's configurations.](./using-a-javascript-client-extension/images/01.png)

1. Click the *Advanced* tab and expand the *JavaScript* section toward the bottom of the page to find the *JavaScript Client Extensions* configuration section.

1. Click *Add JavaScript Client Extensions* to add the new client extension to the page head or page bottom.

   ![Add the JavaScript client extension. It appears in a list depending on whether you added it to the page head or page bottom.](./using-a-javascript-client-extension/images/02.png)

1. Click *Save*.

1. Optionally, publish the page so your JavaScript executes on the page outside of Edit mode.

Now your client extension is configured and active. On the page you configured, you can see the alert window pop up with the client extension's message.

![This example client extension creates an alert message pop-up when the page is loaded.](./using-a-javascript-client-extension/images/03.png)

```{tip}
If the alert window does not appear at first, do a hard refresh of the page to clear your browser's cache (`CTRL + SHIFT + R` for most browsers). If you change your client extension and redeploy it, you may need to remove it from the page and re-add it to see the changes.
```

## Next Steps

You have successfully used a JS client extension in Liferay. Next, try deploying other client extension types.

* [Using a CSS Client Extension](./using-a-css-client-extension.md)

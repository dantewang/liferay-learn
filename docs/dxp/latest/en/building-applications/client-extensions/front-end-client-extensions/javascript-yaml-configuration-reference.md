---
uuid: c79386c9-9344-49e3-bfd4-626b4f8750ed
---
# JavaScript YAML Configuration Reference

You can define a JavaScript client extension with a `client-extension.yaml` file.

## Usage Details

This `client-extension.yaml` file defines a JavaScript client extension:

```yaml
able-global-js:
    name: Able Global JS
    type: globalJS
    url: global.js
```

The required `url` property defines the JavaScript resource file's location. When enabled on a page, JavaScript at this path runs on each page load.

[The example workspace](https://github.com/liferay/liferay-portal/tree/master/workspaces/sample-default-workspace/client-extensions) includes a complete JavaScript client extension.

## YAML Properties

These properties are specific to JavaScript client extensions:

| Name | Data Type | Description |
| :--- | :--- | :--- |
| `url` | URL | (Required) The path to the JavaScript file added to the HEAD of the page when the client extension is enabled. The complete URI is prefixed by the `baseURL` value. |

See [Front-end Client Extension Properties](../front-end-client-extensions.md#front-end-client-extension-properties) for properties common to all front-end client extensions.

## Additional Information

* [Front-end Client Extensions](../front-end-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
* [Theme JS YAML Configuration Reference](./theme-js-yaml-configuration-reference.md)

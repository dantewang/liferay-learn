---
uuid: 9557c412-c225-497b-88dc-659fdc6b1864
---
# Object Action YAML Configuration Reference

You can define an object action client extension with a `client-extension.yaml` file.

## Usage Details

This `client-extension.yaml` defines an object action and an OAuth user agent:

```yaml
easy-object-action-1:
    name: Easy Object Action 1
    oAuth2ApplicationExternalReferenceCode: easy-oauth-application-user-agent
    resourcePath: /easy-object/action/1
    type: objectAction

easy-oauth-application-user-agent:
    type: oAuthApplicationUserAgent
```

The required `resourcePath` property defines the object action handler's location. Point to any implementation of an object action handler that's accessible as an external application (for example, a Java Spring Boot application). This value is combined with the `homePageURL` value of the associated OAuth2 application profile to form the complete URL.

Object action client extensions require OAuth2 application profiles to secure requests triggered by object actions in Liferay. The `client-extension.yaml` defines an additional [OAuth user agent client extension](../configuration-client-extensions/oauth-user-agent-client-extension-usage-and-properties.md) for this profile, and the `oAuth2ApplicationExternalReferenceCode` property references that client extension's `key` value.

[The sample workspace](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-etc) demonstrates adding an object action client extension.

## YAML Properties

These properties are specific to object action client extensions:

| Name                                   | Data Type            | Description |
| :------------------------------------- | :------------------- | :--- |
| `resourcePath`                           | String (partial URL) | (Required) The path to the object action handler. This value is combined with the OAauth2 application profile's `homePageURL` value for a complete URL. |
| `oAuth2ApplicationExternalReferenceCode` | String               | (Required) The external reference code for an OAuth2 application profile, needed for securing requests. |

## Additional Information

* [Microservice Client Extensions](../microservice-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
* [Workflow Action YAML Configuration Reference](./workflow-action-yaml-configuration-reference.md)

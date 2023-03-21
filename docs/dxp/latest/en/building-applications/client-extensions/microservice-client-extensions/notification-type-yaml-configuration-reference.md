---
uuid: 35e09fb2-fd22-49b3-b901-bd96c6c1a887
---
# Notification Type YAML Configuration Reference

You can define a notification type client extension with a `client-extension.yaml` file.

## Usage Details

This `client-extension.yaml` file defines a notification type and an OAuth user agent:

```yaml
zebra-notification-type:
oAuth2ApplicationExternalReferenceCode: zebra-oauth-user-agent
    resourcePath: /zebra/notification
    type: notificationType

zebra-oauth-user-agent:
    type: oAuthApplicationUserAgent
```

The required `resourcePath` property defines the notification handler's location. Point to any notification handler implementation that's accessible as an external application. This value is combined with the `homePageURL` value of the OAuth2 application profile to form the complete URL.

Notification type client extensions require OAuth2 application profiles to secure requests triggered by notifications in Liferay. The example above defines an additional [OAuth user agent client extension](../configuration-client-extensions/oauth-user-agent-client-extension-usage-and-properties.md) for this profile, and the `oAuth2ApplicationExternalReferenceCode` property references its `key` value.

[The sample workspace](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-etc) demonstrates adding a notification type client extension.

## YAML Properties

These properties are specific to notification type client extensions:

| Name                                   | Data Type            | Description |
| :------------------------------------- | :------------------- | :--- |
| `resourcePath`                           | String (partial URL) | (Required) The path to the notification handler. This value is combined with the OAauth2 application profile's `homePageURL` value for a complete URL. |
| `oAuth2ApplicationExternalReferenceCode` | String               | (Required) The external reference code for an OAuth2 application profile, needed for securing requests. |

## Additional Information

* [Microservice Client Extensions](../microservice-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)

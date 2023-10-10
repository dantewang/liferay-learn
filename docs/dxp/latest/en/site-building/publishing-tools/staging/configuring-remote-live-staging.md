---
uuid: faa4a458-c7c6-4b61-a08f-37cb58873c58
---
# Configuring Remote Live Staging

With Remote Live staging, your staging and live environments are hosted on separate Liferay servers. When enabled, the site or asset library used to configure staging becomes your staging environment, and the remote server becomes your live environment.

![Remote staging hosts the environments on separate Liferay servers.](./configuring-remote-live-staging/images/01.png)

Before enabling Remote Live staging, you must configure the Liferay servers you want to use for your staging and live environments. You must also create a new blank site or asset library on your remote server and use its ID during staging configuration.

## Preparing Your Liferay Servers

If you haven't already, follow these steps to configure your Liferay servers for Remote Live staging:

1. Specify a shared authentication key for your servers by adding the following properties to a [`portal-ext.properties`](../../../installation-and-upgrades/reference/portal-properties.md) file for both Liferay servers:

   ```
   tunneling.servlet.shared.secret=[secret]
   tunneling.servlet.shared.secret.hex=[value]
   ```

   Each property value depends on your chosen encryption algorithm and whether you use hexadecimal encoding (recommended) or printable ASCII characters (less secure). If you decide to not use hexadecimal encoding, the value for `tunneling.servlet.shared.secret` must be ASCII compliant.

   The following key lengths are supported by the available encryption algorithms:

   **AES**: 128, 192, and 256 bit keys

   **Blowfish**: 32 - 448 bit keys

   **DESede (Triple DES)**: 112 or 168 bit keys. Liferay's minimum key length does not support 56 bit keys. <!--Does this limit apply to Blowfish?-->

1. Add each server to the other's list of allowed servers by adding the following property to each server's `portal-ext.properties` file:

   ```properties
   tunnel.servlet.hosts.allowed=127.0.0.1,SERVER_IP,[OTHER_SERVER_IP]
   ```

   If the server has multiple IP addresses, each IP address must be added.

   ```{important}
   If you're validating IPv6 addresses, you must configure the app server's JVM to not force the usage of IPv4 addresses. For example, if you're using Tomcat, add the `-Djava.net.preferIPv4Stack=false` attribute in the `$TOMCAT_HOME\bin\setenv.[bat|sh]` file.
   ```

1. Update the remote instance's *Tunnel Authentication Verifier Configuration*.

   To do this, go to the *Control Panel* &rarr; *Configuration* &rarr; *System Settings* &rarr; *API Authentication* &rarr; *Tunnel Authentication*.

   Click */api/liferay/do* and insert the additional IP addresses you're using in the *Hosts Allowed* field. When finished, click on *Update*.

   ![Update the remote instance's Tunnel Authentication Verifier Configuration via the Control Panel.](./configuring-remote-live-staging/images/02.png)

   ```{note}
   While it is enabled by default, ensure each Liferay server's tunneling servlet [authentication verifier](../../../installation-and-upgrades/securing-liferay/securing-web-services/using-authentication-verifiers.md) is enabled.
   ```

   Alternatively, you can write this configuration into an OSGi file in your Liferay instance (e.g., `osgi/configs/com.liferay.portal.security.auth.verifier.tunnel.module.configuration.TunnelAuthVerifierConfiguration-default.config`):

   ```
   enabled=true
   hostsAllowed=127.0.0.1,SERVER_IP,[Local server IP address]
   serviceAccessPolicyName=SYSTEM_User_PASSWORD
   urlsIncludes=/api/liferay/do
   ```

1. Restart both Liferay servers to implement your changes.

Once restarted, both servers are ready for staging configuration.

```{important}
When applying patches to a remote staging environment, you must apply them to all your servers. Having servers on different patch levels is not a good practice and can lead to import failures and data corruption. It is essential that all servers are updated to the same patch level to ensure remote staging works correctly.
```

## Setting Up Remote Live Staging

Once you've prepared your Liferay servers, follow these steps to set up Remote Live staging for a site or asset library:

1. Open the Staging application in your site or asset library.

   For Sites, go to *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)) &rarr; *Publishing* &rarr; *Staging*.

   For asset libraries, go to *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)) &rarr; *Applications tab* &rarr; *Asset Libraries*. Then open the desired asset library and click on *Staging* under Publishing.

1. Select *Remote Live*. This reveals additional configuration fields.

   ![Select Remote Live staging.](./configuring-remote-live-staging/images/03.png)

1. Enter the following Remote Live Connection details:

   **Remote Host/IP**: Enter your Remote server's IP address into the *Remote Host/IP* field. This should match the `tunnel.servlet.hosts.allowed` property specified in your `portal-ext.properties` file.

   **Remote Port**: Enter the port for your remote DXP instance into the *Remote Port* field.

   **Remote Path Context**: Enter the *Remote Path Context*. This is only required if a non-root portal servlet context path is used on the remote Liferay server. Access to this context must not be blocked by a proxy or firewall.

   **Remote Site ID**/**Remote Asset Library ID**: Enter the *Site ID*/*Asset Library ID* for the desired target.

   ```{note}
   If you're configuring an IPv6 address, it must contain brackets when entered into the *Remote Host/IP* field (e.g., [0:0:0:0:0:0:0:1]).

   If the remote server is a cluster, you can set the Remote Host/IP to the cluster's load balanced IP address to increase the availability of the publishing process. See the [Configuring Remote Staging in a Clustered Environment](https://help.liferay.com/hc/en-us/articles/360018175251-Configuring-Remote-Staging-in-a-Clustered-Environment) for details.
   ```

1. Determine whether to use a secure network connection (i.e., HTTPS) for publishing pages from staging to live.

1. Determine whether to define manually the remote URL used for the site or asset library.

1. (For Sites Only) Select whether you want *Page Versioning* enabled.

   ![Enable Page Versioning.](./configuring-local-live-staging/images/04.png)

1. Select the *data* and *content* types you want to stage.

   Asset libraries only support staging data for the Documents and Media and Web Content applications.

   With sites, you can stage data for any of the following applications.

   ![Select the data and content types you want to stage.](./configuring-remote-live-staging/images/05.png)

   ```{warning}
   When applications are checked, their data is copied, and it may not be possible to edit them directly on the live site. When unchecking an application, first make sure that any changes in staging are published, since they may be lost. See [Managing Data and Content Types in Staging](./managing-data-and-content-types-in-staging.md) for more information.
   ```

1. Click *Save* to initiate the staging process. The duration of this process depends on the size of your site or asset library.

   ```{note}
   If your attempt to enable Remote Live staging fails, please verify that you've properly prepared your servers.
   ```

Once the process is complete, you are ready to use Remote Live staging. See [Site Staging UI Reference](./site-staging-ui-reference.md) for information about navigating the staging environment's publishing features.

## Remote Live Staging Permissions

When a user attempts to publish changes from staging to live, Liferay passes the user's email address, screen name, or user ID to the remote server to perform a permission check. To succeed, the publishing user must have identical credentials and permissions on both servers.

To give a local user permission to publish changes from staging to production/live, create an identical user account with identical permissions for the user on the remote server.

To simplify this process, you can use LDAP to copy selected user accounts from your local server to your remote server. See [Connecting to an LDAP Directory](../../../users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory.md) for more information.

## Configuring Remote Staging's Buffer Size

When you're using Remote Live staging and you are publishing a large amount of content, this process can be slow and cause a large amount of network traffic. To help with this, Liferay DXP transfers data piecemeal, instead of one large data dump. You can control the size of data transactions by setting the following portal property in your `portal-ext.properties` file:

```
staging.remote.transfer.buffer.size
```

This property sets the file block sizes for remote staging. If a LAR file used for remote staging exceeds this size, the file is split into multiple files prior to transmission and then reassembled on the remote server. The default buffer size is 10 megabytes.

## Disabling Remote Live Staging

Disabling Remote Live staging disables the connection between your environments without deleting any data. Since no data is erased and no processes are started, disabling Remote Live staging is almost instantaneous.

```{warning}
When you disable remote staging, you must ensure the live site or asset library is still accessible so both sides can communicate. Do not shut down your live environment. If the network connection is ever lost between environments, an error message appears and instructs you to forcibly disable staging.

Forcibly disabling staging erases your staging information from your staging server, not the content. The live environment remains in a locked state. A possible workaround is to create a new live site or asset library and import content to it, if necessary.
```

Follow these steps to disable Remote Live Staging:

1. Open the Staging application in your site or asset library.

1. Click the *Actions* button ( ![Actions button](../../../images/icon-actions.png) ) located in the Application bar and select *Staging Configuration*.

   ![Click the Actions button in the Application bar, and select Staging Configuration](./configuring-remote-live-staging/images/06.png)

1. Select *None* for your configuration and click *Save*.

## Related Topics

* [Staging Overview](../staging.md)
* [Site Staging UI Reference](./site-staging-ui-reference.md)
* [Managing Staging Permissions](./managing-staging-permissions.md)
* [Managing Data and Content Types in Staging](./managing-data-and-content-types-in-staging.md)

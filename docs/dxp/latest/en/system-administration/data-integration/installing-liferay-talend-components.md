---
uuid: d9c2bf46-3dc8-45df-a382-31243afd00fc
---
# Installing Liferay Talend Components

{bdg-warning}`Unsupported`

Liferay's components for Talend Open Studio can import and export data between Liferay DXP/Portal and external systems such as MySQL, SAP, and Salesforce, or even files. To use these components, you must add them to Talend Open Studio.

## Prerequisites

Installing the Liferay components requires JDK 1.8+, Apache Maven 3.3+, and a local copy of the [DXP/Portal code](https://github.com/liferay/liferay-portal/tree/7.4.x/modules/etl/talend). You'll also need [Talend Open Studio 7.1.1](https://download-mirror2.talend.com/esb/release/V7.1.1/TOS_ESB-20181026_1147-V7.1.1.zip) with [Components API v0.25.3](https://artifacts-oss.talend.com/nexus/content/repositories/TalendOpenSourceRelease/org/talend/components/components-api/0.25.3/) already installed.

## Talend Open Studio Configuration

After installing Talend Open Studio, ensure the `[TOS_ROOT]/configuration/config.ini` file does not set `maven.repository=global`. If it is present, delete the line or comment it out.

Since Maven has recently deprecated insecure repository connections, include the following script to the `[TOS_ROOT]/configuration/maven_user_setting.xml` file:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<settings>
  <localRepository>DO_NOT_CHANGE_THIS</localRepository>
  <mirrors>
    <mirror>
      <id>secure-central-mirror</id>
      <name>Secure Central Mirror Repository</name>
      <url>https://repo.maven.apache.org/maven2</url>
      <mirrorOf>central</mirrorOf>
    </mirror>
  </mirrors>
</settings>
```

The repository mirror location ensures the m2m plugin can connect securely to the repository. 

## Building the Talend Components

Before you can install the Talend components, you must run `mvn clean install` in the [modules/etl/talend](https://github.com/liferay/liferay-portal/tree/7.4.x/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend) folder of your local `liferay-portal` repository.

This generates a jar bundle file in the following directories/folders:

* `talend-definition/target/`
* `talend-common/target/`
* `talend-runtime/target/`

JAR files are also published to these local maven repository folders:

* `$USER_HOME/.m2/repository/com/liferay/com.liferay.talend`
* `$USER_HOME/.m2/repository/com/liferay/com.liferay.common`
* `$USER_HOME/.m2/repository/com/liferay/com.liferay.talend.definition`
* `$USER_HOME/.m2/repository/com/liferay/com.liferay.talend.runtime`

```{note}
The Maven build succeeds only if all tests pass. If you encounter errors, execute `mvn clean install -DskipTests` in the `talend-definition`, `talend-common`, and `talend-runtime` sub-folders individually. If all builds are successful, return to `modules/etl/talend` folder and run `mvn clean install`.
```

## Registering the Components in Talend Studio

Once the Maven build is successful, follow these steps to register the Liferay Components in Talend Open Studio.

1. Close Talend Open Studio, if open.

1. Copy the generated `com.liferay.talend.definition-x.y.z-SNAPSHOT.jar` bundle from the `liferay-portal/modules/etl/talend/talend-definition/target` folder to the `[TOS_ROOT]/plugins` folder.

1. Update the `osgi.bundles` key in the `[TOS_ROOT]/configuration/config.ini` file to include the newly added definition bundle.

   ```properties
   osgi.bundles=org.eclipse.equinox.common@2:start,org.eclipse.update.configurator@3:start,
   org.eclipse.equinox.ds@2:start,org.eclipse.core.runtime@start,org.talend.maven.resolver@start,
   org.ops4j.pax.url.mvn@start,org.talend.components.api.service.osgi@start,
   com.liferay.talend.definition-x.y.z-SNAPSHOT.jar@start
    ```

1. Remove any `org.eclipse*` files from the `[TOS_ROOT]/configuration/` folder.

1. Copy the `com.liferay.talend`, `com.liferay.talend.common`, and `com.liferay.talend.runtime` folders from your local `$USER_HOME/.m2/repository/com/liferay/` folder to your `$TOS_ROOT/configuration/.m2/repository/com/liferay/` folder.

1. Start Talend Open Studio. The Liferay components appear under *Business* &rarr; *Liferay* in the *Palette* tab.

   ![The components appear under Business &rarr; Liferay in the Palette tab.](liferay-talend-components-overview/images/01.png)

## Updating Liferay Components

If there are changes in the Liferay components codebase, you can update your components to the latest version by repeating the above steps, beginning with Building the Talend Components.

You must also remove and replace old files and folders:

* Remove the old `.jar` definition file in the `[TOS_ROOT]/plugins folder`.
* Replace the `com.liferay.talend`, `com.liferay.talend.common`, and `com.liferay.talend.runtime` folders in `[TOS_ROOT]/configuration/.m2/repository/com/liferay/`.

Once the components finish updating, you must update any existing Talend jobs that used the old components. This involves removing the Liferay components from the job and adding them again.

```{note}
Be sure to document each component's configurations before replacing them. This helps ensure that your job maintains the same functionality as before.
```

## Additional Information

* [Liferay Talend Components Overview](./liferay-talend-components-overview.md)
* [Designing Talend Jobs Using Liferay Components](./designing-talend-jobs-using-liferay-talend-components.md)

---
uuid: 0bf8520a-45b6-4c15-bae8-7893fd7dbc39
taxonomy-category-names:
- Development and Tooling
- Data Frameworks
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Enabling Assets

Many of Liferay's applications (e.g. Blogs, Documents and Media, Message Boards, etc.) are asset-enabled out of the box. You can publish assets with the [Asset Publisher widget](../../../../site-building/displaying-content/using-the-asset-publisher-widget/displaying-assets-using-the-asset-publisher-widget.md) or even create [Asset Libraries](../../../../content-authoring-and-management/asset-libraries.md). With the help of [Service Builder](../service-builder.md), you can asset-enable your custom application. See the sample project below to learn how.

## Get the Sample Code

```{include} /_snippets/run-liferay-dxp.md
```

Then, follow these steps:

1. Download and unzip [Enabling Assets](./liferay-s5e6.zip).

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/data-frameworks/asset-framework/liferay-s5e6.zip -O
   ```

   ```bash
   unzip liferay-s5e6.zip
   ```

1. From the module root, build and deploy.

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   !!! note
      This command is the same as copying the deployed jars to `/opt/liferay/osgi/modules` on the Docker container.

1. Confirm the deployment in the Liferay Docker container console.

   ```bash
   STARTED com.acme.s5e6.api_1.0.0 [1433]
   STARTED com.acme.s5e6.service_1.0.0 [1434]
   STARTED com.acme.s5e6.web_1.0.0 [1435]
   ```

1. Open your browser to `https://localhost:8080`.

1. Add the S5E6 Portlet to a page. You can find the example portlet under Sample Widgets.

1. Also add an Asset Publisher widget to the same page. You can find the widget under Content Management.

1. Add an entry with the S5E6 Portlet (e.g. `s5e6_name1` and `s5e6_description1`) and click `Submit`.

1. The S5E6 Portlet is asset-enabled and therefore the added entry appears automatically in the Asset Publisher widget.

   ![The added entry appears automatically in the Asset Publisher widget](./enabling-assets/images/01.png)

## Search Enabled Prerequisite

This tutorial assumes that you have a Service Builder application that is already search enabled. At minimum, your application needs:

`*ModelSearchConfigurator.java` - registers the search services to the search framework for the application's entities (e.g., the `com.acme.s5e6.search.S5E6EntryModelSearchConfigurator.java` class).

!!! note
   The `ModelSearchConfigurator` pattern applies to Liferay 2023.Q4+ and GA/Update 100+. Earlier versions used a `SearchRegistrar`. See [the Liferay 7.2 documentation](https://help.liferay.com/hc/en-us/articles/360032611231-Search-Service-Registration) to implement a `SearchRegistrar`.

`*ModelIndexerWriterContributor.java` - configures the reindexing and batch reindexing behavior of entries (e.g., the `com.acme.s5e6.search.S5E6EntryModelIndexerWriterContributor.java` class).

`*ModelSummaryContributor.java` - constructs the result summary for entries (e.g., the `com.acme.s5e6.search.S5E6EntryModelSummaryContributor.java` class).

See the [Developer Guide](../../../../using-search/developer-guide.md) in Using Search to learn more about enabling search.

## Modify the Service Model Definition

To enable assets, make the following changes to your entity:

1. Add the following data fields if you don't already have them defined:

   ```xml
   <!-- Group instance -->

   <column name="groupId" type="long" />

   <!-- Audit fields -->

   <column name="companyId" type="long" />
   <column name="userId" type="long" />
   <column name="userName" type="String" />
   <column name="createDate" type="Date" />
   <column name="modifiedDate" type="Date" />
   ```

   The Asset Framework requires these fields to keep track of your application's data.

1. Add an asset entry entity reference right before the closing `</entity>` tag. Later, you'll make a change so that when a new application entry is added, a corresponding entry is added to Liferay's `AssetEntry` table.

   ```xml
   <reference entity="AssetEntry" package-path="com.liferay.portlet.asset" />
   ```

3. Re-run Service Builder.

   ```bash
   ./gradlew s5e6-service:buildService
   ```

## Update the Service Layer

To add your custom entity as a Liferay asset, you must invoke the `assetEntryLocalService`'s `updateEntry()` method in your project's `-LocalServiceImpl` Java class. Calling `assetEntryLocalService.updateEntry()` adds a new row (corresponding to the application's entry) to the `AssetEntry` table. The `updateEntry()` method both adds and updates asset entries because it checks whether the asset entry exists and then takes appropriate action.


Here's what it looks like in the example project:

```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-service/src/main/java/com/acme/s5e6/service/impl/S5E6EntryLocalServiceImpl.java
:dedent: 2
:language: java
:lines: 64-73
```

If you check the Javadocs for the [`AssetEntryLocalServiceImpl` class](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-impl/com/liferay/portlet/asset/service/impl/AssetEntryLocalServiceImpl.html#updateEntry-long-long-java.util.Date-java.util.Date-java.lang.String-long-java.lang.String-long-long:A-java.lang.String:A-boolean-boolean-java.util.Date-java.util.Date-java.util.Date-java.util.Date-java.lang.String-java.lang.String-java.lang.String-java.lang.String-java.lang.String-java.lang.String-int-int-java.lang.Double-), you'll see that the method is overloaded. We use the version of `updateEntry()` that takes a `title` parameter so that we can set the asset entry's title.

Re-run Service Builder after making the change.

## Create an Asset Renderer

Assets are display versions of entities, so they contain fields such as `title`, `description`, and `summary`. Liferay uses these fields to display assets. Asset renderers translate an entity into an asset via these fields.

1. In you application, create a `-AssetRender` class that extends Liferay's `BaseJSPAssetRenderer` class. For example,

   ```java
   public class S5E6EntryAssetRenderer extends BaseJSPAssetRenderer<S5E6Entry> {

   }
   ```

2. Define the asset renderer class's constructor:

   ```java
   	public S5E6EntryAssetRenderer(S5E6Entry s5e6Entry) {
		_s5e6Entry = s5e6Entry;
	}
   ```

3. Connect your asset renderer to your asset by using the different getter methods:

   ```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-web/src/main/java/com/acme/s5e6/web/internal/asset/model/S5E6EntryAssetRenderer.java
   :dedent: 1
   :language: java
   :lines: 20-72
   ```

   Note that in this example the `getTitle()` method is set to the `name` attribute and `getSummary()` method is set to the `description` attribute of the application.

## Create an Asset Renderer Factory

After creating an asset renderer, you need to create a factory class to generate asset renderers for each asset instance.

1. In the same folder as above, create an `-AssetRendererFactory` class that extends Liferay's `BaseAssetRendererFactory` class. For example,

   ```java
   public class S5E6EntryAssetRendererFactory extends BaseAssetRendererFactory<S5E6Entry> {

   }
   ```

1. Create an `@Component` annotation above the class declaration. This annotation registers the factory instance for the asset. The `service` element should point to the `AssetRenderFactory.class` interface.

   ```java
   @Component(service = AssetRendererFactory.class)
   ```

1. Create a constructor for the factory class that presets attributes of the factory.

   ```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-web/src/main/java/com/acme/s5e6/web/internal/asset/model/S5E6EntryAssetRendererFactory.java
   :dedent: 1
   :language: java
   :lines: 24-29
   ```

   Set `setLinkable` to `true` so that other assets can select your asset as a related asset. Set `setSearchable` to `true` so that your assets can be found when searching.

1. Implement the `getAssetRenderer` method, which constructs a new `S5E6AssetRenderer` instance.

   ```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-web/src/main/java/com/acme/s5e6/web/internal/asset/model/S5E6EntryAssetRendererFactory.java
   :dedent: 1
   :language: java
   :lines: 31-43
   ```

1. Make sure to use the `@Reference` annotation to define the module's symbolic name.

   ```java
   @Reference(
   	target = "(osgi.web.symbolicname=com.acme.s5e6.web)"
   )
   ```

## Modify the Portlet

The `S5E6Portlet`'s `addS5E6Entry` method handles requests to add `S5E6Entry` instances.

```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-web/src/main/java/com/acme/s5e6/web/internal/portlet/S5E6Portlet.java
:dedent: 1
:language: java
:lines: 32-46
```

Since `addS5E6Entry` is a portlet action method, it takes `ActionRequest` and `ActionResponse` parameters. To make the service call to add a new entry, the `title` and `description` must be retrieved from the request. The `serviceContext` must also be retrieved from the request and passed as an argument in the service call.

The portlet's `view.jsp` contains a form with an `actionURL` that invokes the portlet's `addS5E6Entry` method.

```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-web/src/main/resources/META-INF/resources/view.jsp
:language: jsp
:lines: 18-28
```
The portlet is asset enabled. Your application's entries can now be found and displayed as assets.

## Related Topics

- [Asset Publisher widget](../../../../site-building/displaying-content/using-the-asset-publisher-widget/displaying-assets-using-the-asset-publisher-widget.md)
- [Asset Libraries](../../../../content-authoring-and-management/asset-libraries.md)
- [Service Builder](../service-builder.md)

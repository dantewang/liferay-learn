---
uuid: c4959577-5cab-4945-a4f5-6a98b89eae41
---
# Defining Entity Finder Methods

Finder methods retrieve entity objects from the database based on specified parameters. For each finder defined, Service Builder generates several methods to fetch, find, remove, and count entity instances based on the finder's parameters.

When supporting Liferay's multi-tenancy, it's important to be able to find its entities per Site.

## Creating Finders

Finders are easy to create:

```xml
<finder name="GroupId" return-type="Collection">
   <finder-column name="groupId" />
</finder> 
```

The example above is among the simplest of finders, and is one you should always add if you're supporting multi-tenancy. This finder returns a collection of objects that belong to the Site where your application has been placed. Service Builder generates finder-related methods (e.g., `fetchByGroupId`, `findByGroupId`, `removeByGroupId`, `countByGroupId`) for the your entities in the `*Persistence` and `*PersistenceImpl` classes. The first of these classes is the interface; the second is its implementation. For example, Liferay's Blogs application generates its entity finder methods in the `-Persistence` classes found in the [`blogs-api/src/main/java/com/liferay/blogs/service/persistence`](https://github.com/liferay/liferay-portal/tree/master/modules/apps/blogs/blogs-api/src/main/java/com/liferay/blogs/service/persistence) folder and the `-PersistenceImpl` classes in the [`blogs-service/src/main/java/com/liferay/blogs/service/persistence/impl`](https://github.com/liferay/liferay-portal/tree/master/modules/apps/blogs/blogs-service/src/main/java/com/liferay/blogs/service/persistence/impl) folder.

You're not limited to finding by one column, however; you can create multi-column finders:

```xml
<finder name="G_UT" return-type="BlogsEntry" unique="true">
	<finder-column name="groupId" />
	<finder-column name="urlTitle" />
</finder>
```

```{important}
DO NOT create finders that use entity primary key as parameters. They're unnecessary as Service Builder automatically generates `findByPrimaryKey` and `fetchByPrimaryKey` methods for all entity primary keys. On deploying a `*service` module, Service Builder creates indexes for all entity primary key columns and finder columns. Adding finders that use entity primary keys results in attempts to create multiple indexes for the same columns---Oracle DB, for example, reports these attempts as errors.
```

As you can see, using Service Builder to create finder methods for your entity isn't complicated. 

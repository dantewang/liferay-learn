# Defining Entity Columns

An entity's columns represent its attributes. These attributes map table fields to Java object fields. 

Here you'll examine the sample project from [Understanding Service Builder Generated Classes](../service-builder-basics/understanding-service-builder-generated-classes.md) to learn more details about columns.

Start by downloading and unzipping the example:

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/building-applications/data-frameworks/service-builder/service-builder-basics/liferay-w9b7.zip -O
   ```

   ```bash
   unzip liferay-w9b7.zip
   ```

Examine the `w9b7-service/service.xml` file:

```{literalinclude} ../service-builder-basics/understanding-service-builder-generated-classes/resources/liferay-w9b7.zip/w9b7-service/service.xml
:language: xml
```

To add attributes for your entity, add `<column />` tags to your entity definition:

```xml
<column name="w9b7EntryId" primary="true" type="long" />
```

When Service Builder runs, it generates a Hibernate configuration that handles the object-relational mapping. Service Builder creates a database field for each column you add to the `service.xml` file. It maps a database field type appropriate to the Java type specified for each column, and it does this across all the databases Liferay supports.  Service Builder also generates getter/setter methods in the model class for these attributes. If a column's `primary` (i.e., primary key) attribute is set to `true`, the column becomes the primary key for the entity. This is the case in the W9B7 application found in [Understanding and Extending Generated Classes](../service-builder-basics/understanding-service-builder-generated-classes.md). If you define multiple columns with the `primary` attribute set to true, the combination of columns makes up a compound primary key for the entity.

```{note}
[Implementing an Add Method](../service-builder-basics/understanding-service-builder-generated-classes.md#adding-a-local-service-method) demonstrates how to generate unique primary keys for entity instances.
```

## Create Entity Columns

Define the columns you need for your first entity. The W9B7 entity has only three attributes: a primary key, description, and name.

```xml
<column name="w9b7EntryId" primary="true" type="long" />

<column name="description" type="String" />
<column name="name" type="String" />
```

```{note}
On deploying a `*service` module, Service Builder automatically generates indexes for all entity primary keys.
```

Create a column for each attribute of your entity or entities, using the Java type you'll use in your application. Service Builder handles mapping it to SQL for you.

## Support Multi-tenancy

In addition to columns for your entity's primary key and attributes, add portal instance ID and site ID columns. Then you can support Liferay's multi-tenancy features, so that each portal instance and each Site in a portal instance can have independent sets of your application's data. To hold the site's ID, add a column called `groupId` of type `long`. To hold the portal instance's ID, add a column called `companyId` of type `long`:

```xml
<!-- Group instance -->

<column name="groupId" type="long" />
<column name="companyId" type="long" />
```

## Workflow Fields

You can support Liferay's [workflow system](https://learn.liferay.com/dxp/latest/en/process-automation/workflow/introduction-to-workflow.md) by adding the fields it needs to track an entity's progress:

```xml
<!-- Status fields -->

<column name="status" type="int" />
<column name="statusByUserId" type="long" />
<column name="statusByUserName" type="String" />
<column name="statusDate" type="Date" />
```

## Audit Entities

Finally, you can add columns to help audit your entities. To track each entity instance's owner, add a column called `userId` of type `long`. Create a column named `createDate` of type `Date` to note an entity instance's creation date. Add a column named `modifiedDate` of type `Date` to track the last time an entity instance was modified.

```xml
<!-- Audit fields -->

<column name="userId" type="long" />
<column name="userName" type="String" />
<column name="createDate" type="Date" />
<column name="modifiedDate" type="Date" />
```

Great! Your entities have columns that not only represent their attributes, but also support multi-tenancy, workflow, and auditing.

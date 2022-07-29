# What's New with Web Content Structures in 7.4?

As of Liferay 7.4, Web Content Structures have been migrated from using Dynamic Data Mapping (DDM) to Data Engine (DE) as the back-end framework for building forms.

![Web Content Structures are built using a form builder backed by the Data Engine framework.](./whats-new-with-web-content-structures-in-7-4/images/04.png)

The Data Engine framework brings new changes and enhancements to Web Content Structures.

## New and Improved Field Types

Field types have been added and improved as part of the move to Data Engine:

- The Select from List field's options can be ordered alphabetically (use the Advanced settings of the Select from List field).
- Configure a Numeric field as an integer or decimal field.
- The Grid field is a new field type in Web Content and Documents and Media. See the [Forms Field Type Reference](../../../process-automation/forms/creating-and-managing-forms/forms-field-types-reference.md).
- The HTML field was replaced by the Rich Text field, which includes a convenient tool bar.

```{warning}
**Boolean field versus Multiple Selection field:** Data Engine did not initially include a Boolean field. Instead, Boolean fields in upgraded Structures were migrated to use the Data Engine's Multiple Selection field, using the same label and just one option. Some issues can arise from this, for example if templates were built on Structures with Boolean fields. In Liferay 7.4 Update/GA 23, the Boolean field type is added to Data Engine. Upgraded Structures after Update 23 successfully convert 7.3 DDM Boolean fields to 7.4 DE Boolean fields in Web Content Structures. If your installation was upgraded before this change, you must manually change these single-option Multiple Selection fields to Boolean fields by editing the affected Structures. 
```

## Child Structures are Replaced by Structure Fieldsets

Structures backed by DDM could include child Structures that inherited all the parent's fields and settings. This relationship no longer exists in Liferay 7.4, because you can now create fieldsets, which similarly allow you to create reusable fieldsets for your Structures. Fieldsets improve the editing experience since they allow you to see what the Structure will look like as you edit.

```{warning}
- A fieldset is reusable across multiple Structures. Editing it within a single Structure causes changes to all the Structures at once.

- If a fieldset or Structure is being used in Web Content, editing produces a warning to Users:

   ![Be careful editing Structures and fieldsets with content references.](./whats-new-with-web-content-structures-in-7-4/images/09.png)
```

To work with fieldsets,

1. In the Web Content Structure form builder view, click the _Fieldsets_ tab.
1. Click _Create New Fieldset_. Name the fieldset.
1. Add and configure its fields. Click _Save_.

![Use Structures or dedicated fieldsets in your Structure.](./whats-new-with-web-content-structures-in-7-4/images/07.png)

When you begin creating a new Structure, any existing fieldset or Structure will be available to select in the Fieldsets tab. The Basic Web Content Structure is included as a fieldset out-of-the-box.

## Structure Definition Source Changes

Structures in DE are represented by JSON (it was XML in DDM). Instead of allowing source editing in the Web Content Structures UI, you can now import and export the Structure definition to work with the Structure's source JSON locally.

```{warning} 
Be careful working with the JSON Structure source as it can be more complicated than it appears at first glance. For example, when adding a field to the structure, you must update both the `dataDefinitionFields` array and the `defaultDataLayout` element. 
```

To export a Structure's JSON, 

1. Go to the Site Menu &rarr; Content and Data &rarr; Web Content.
1. Click the _Structures_ tab.
1. If there's no existing Structure, create one and save it.
1. In the main Structures list view, Open the Actions menu and click _Export as JSON_.

To import Structure JSON into an existing Structure (thus overwriting the existing Structure JSON),

1. Go to the Site Menu &rarr; Content and Data &rarr; Web Content.
1. Click the _Structures_ tab.
1. In the main Structures list view, Open the Structure's Actions menu and click _Import and Override_.
1. Upload the JSON file.

![Export and import the JSON of a Web Content Structure.](./whats-new-with-web-content-structures-in-7-4/images/01.png)

To import a new Structure, 

1. Go to the Site Menu &rarr; Content and Data &rarr; Web Content.
1. Click the _Structures_ tab.
1. Open the Options menu for Web Content in the upper right corner of the screen.
1. Click _Import Structure_.

   ![Import JSON Structure files.](./whats-new-with-web-content-structures-in-7-4/images/02.png)

## Flexible Structure Layout

Previously, Structure fields could be ordered on the form, and nested to create a hierarchical view of the form. The Data Engine representation of the Structure adds the ability to define columns.

![Create a Structure with two columns per row.](./whats-new-with-web-content-structures-in-7-4/images/08.png)

Add two form fields next to each other in the structure builder and drag the edge of a field to resize the columns.

In addition to columns, use Field Groups to lock a subset of the Structure's fields together for easy management. Create a Field group by dropping a field on top of another field.

## Setting the Structure Key

To set a custom Web Content Structure Key,

1. Go to System Settings &rarr; Web Content (under Content and Data) &rarr; Administration. Uncheck _Autogenerate Structure Key_.
1. Go to the Site menu &rarr; Content & Data &rarr; Web Content. Open the Structures tab and add a new Structure.
1. Add a field and name the Structure. To Manually set the Structure Key, open the Properties sidebar by clicking the configuration icon (![Configuration](../../../images/icon-cog3.png)).
1. Edit the _Structure Key_ field, adding your custom value (e.g., `MY_STRUCTURE_KEY`).
1. Save the Structure.

With the new Data Engine backed Structures, the export process strips the Structure Key out of the JSON. This means that importing the definition (for example, into a new Site) will not preserve the Structure Key. If you wish to keep the Structure Key across an export-import process or perhaps provide a new custom key, you must edit the exported JSON.

To add a custom Structure Key to the [exported JSON](#structure-definition-source-changes),

1. Open the exported JSON file (e.g., `Structure_my structure_42153_20220721144913685.json`).
1. Add a `"dataDefinitionKey"` element before the `"dataDefinitionField"` element:
   ```json
   {
      "availableLanguageIds": ["en_US"],
      "contentType": "journal",
      "dataDefinitionKey": "MY_STRUCTURE_KEY",
      "dataDefinitionFields": [{"..."}]
   }
   ```

1. [Import](#structure-definition-source-changes) the Structure definition file and verify that the key was imported by checking in the Properties tab.

   ![The Properties tab shows the Structure Key, whether it's a custom key or autogenerated by Liferay.](./whats-new-with-web-content-structures-in-7-4/images/11.png)

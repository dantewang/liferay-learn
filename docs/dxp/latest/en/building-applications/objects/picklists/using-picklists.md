# Using Picklists

{bdg-secondary}`Available Liferay 7.4+`

Picklists is an application for creating standard lists of values that are understood across the Liferay Portal. The process of creating a Picklist includes creating the initial list and adding items to it. Once these values are defined, they can be used in supported applications.

## Creating a Picklist

Follow these steps to create a Picklist:

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Picklists*.

1. Click the *Add* button (![Add Button](../../../images/icon-add.png)).

   ![Click the Add button to create a new Picklist.](./using-picklists/images/01.png)

1. Enter a *Name* for the Picklist, and click *Save*. This value identifies the list in the Liferay UI and can be localized after creation.

1. Click the new Picklist to edit it.

1. Under Items, click the *Add* button (![Add Button](../../../images/icon-add.png)).

   ![Click the Add button to add a new item to the Picklist.](./using-picklists/images/02.png)

1. In the modal window, enter a *Name* and *Key* for the item.

   **Name**: Determines the item's display name and can be localized after creation.

   **Key**: Determines the standard value understood by applications in the back-end and uses camel case.

   ```{note}
   Once created, an Item's key cannot be changed, but you can edit its name or delete it at any time.
   ```

   ![Enter a name and key, and then click Save.](./using-picklists/images/03.png)

1. Click *Save*. This immediately updates the Picklist with the new item.

1. Repeat the above steps to add additional items to the list.

   ![Add multiple items to a Picklist.](./using-picklists/images/04.png)

## Adding Picklist Fields to Objects

{bdg-secondary}`For 7.4 U56+/GA56+`

After creating a list, you can select it when creating Object fields. Select the *Picklist* or *Multiselect Picklist* field type and choose the list. See [Adding Fields to Objects](../creating-and-managing-objects/fields/adding-fields-to-objects.md) for more information.

![Users can select the Picklist when creating new Object fields.](./using-picklists/images/05.png)

When users access this field in an Object's layout, it appears as a drop-down menu that lists the Picklist's items.

![Picklists appear as drop-down menus in an Object's layout.](./using-picklists/images/06.png)

```{important}
A list cannot be deleted if it is used by an Object field, though list items can be edited and removed at any time.

Updating or deleting a Picklist item automatically updates all Object entries using the item value.
```

## Picklist APIs

Liferay provides headless APIs for creating and managing Picklists. You can view available Picklist APIs in Liferay's API Explorer at `localhost:8080/o/api` under `headless-admin-list-type`.

![Access Picklist APIs under headless-admin-list-type](./using-picklists/images/07.png)

With them, you can perform CRUD operations for both Picklist Definitions (`ListTypeDefinition`) and Picklist Entries (`ListTypeEntry`). See [Picklist API Basics](./picklists-api-basics.md) for more information.

## Picklist Fields in Object API Calls

{bdg-secondary}`For 7.4 U56+/GA56+`

When making POST, PATCH, and PUT API calls for Objects that include a Picklist field, you must use the following request payload formats for Picklists and Multiselect Picklists, respectively.

### Picklist Field Type

```json
{ 
      "picklistExample": {
        "key": "firstOption",
        "name": "First Option"
      }
}
```

### Multiselect Picklist Field Type

```json
{ 
      "picklistExample": [
        {
          "key": "firstOption",
          "name": "First Option"
        },
        {
          "key": "secondOption",
          "name": "Second Option"
        }
      ]
}
```

## Additional Information

* [Adding Fields to Objects](../creating-and-managing-objects/fields/adding-fields-to-objects.md)
* [Managing Picklist Permissions](./managing-picklist-permissions.md)
* [Picklist API Basics](./picklists-api-basics.md)

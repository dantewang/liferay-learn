# Displaying Object Entries

{bdg-secondary}`Available 7.4+`

With Liferay Objects, you can use existing DXP frameworks to display Object entries dynamically in Sites. This includes collection displays for multiple entries and display pages for individual entries.

When an Object is published, Liferay creates a Collection Provider for use with the [Collection Display fragment](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#adding-a-collection-display-fragment-to-a-page) to display multiple Object entries. You can also configure the fragment to style, filter, and paginate the collection. And since published Objects are integrated with the Info framework, you can select them as the content type for [Display Page Templates](../../site-building/displaying-content/using-display-page-templates.md). When selected, the Object is set as the template's mapping source, so you can easily map fragment fields to Object fields to create flexible page displays for individual Object entries.

Additionally, you can use FreeMarker to create [Information Templates for Objects](#creating-information-templates-for-objects). Once created, you can map fragment fields to your template to determine how entries are rendered in Content Pages and Display Pages.

```{note}
Information Templates can be used in Content Display fragments and any other fragment with [sub-elements](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md) (e.g., text, rich text) that can be mapped to Objects.
```

Together, these integrations enable users to leverage Liferay's WYSIWYG page building capabilities while delivering personalized user experiences.

## Using the Collection Provider for Objects

Once you've published an Object, follow these steps to use the Collection Display fragment to display an Object's entries:

1. Create a new [Content Page](../../site-building/creating-pages/using-content-pages.md) or [Display Page Template](../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md). Alternatively, begin *editing* (![Edit Button](../../images/icon-edit-pencil.png)) an existing one.

   ```{note}
   You can also create a Collection Page using the Collection Provider. See [Collections and Collection Pages](../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md) for more information.
   ```

1. Drag and drop the *Collection Display* fragment into the Page or Template from the *Fragments and Widgets* (![Fragments and Widgets](../../images/icon-plus.png)) sidebar.

   ![Drag and drop the Collection Display fragment into the Page or Template.](./displaying-object-entries/images/01.png)

1. Select the *Collection Display Fragment* to access its configuration options and click *Select Collection* in the General tab.

   ![Select the fragment and click Select Collection.](../objects/displaying-object-entries/images/02.png)

1. In the modal window, click the *Collection Providers* tab and select the *Object's provider*.

   ![In the Collection Providers tab, select the Object's provider.](./displaying-object-entries/images/03.png)

1. (Optional) Filter which Object entries are displayed. You can filter by any Picklist or Boolean fields in the Object.

   To do this, click the *Collection Options* button (![Collection Options Button](../../images/icon-actions.png)) and select *Filter Collection*.

   ![Click the Collection Options button and select Filter Collection.](./displaying-object-entries/images/04.png)

   Then, select the desired *filters* and click *Apply*.

   ![Select the Filters to apply.](./displaying-object-entries/images/05.png)

After selecting the desired provider, use additional fragment options to determine how Object entries are displayed, including *List Style* and *Pagination*.

![Use fragment options to determine how Object entries are displayed.](./displaying-object-entries/images/06.png)

## Creating Display Page Templates for Objects

When created, each Object entry is assigned automatically a dedicated friendly URL that uses the following pattern: `server-address/l/objectEntryId` (e.g., `https://mysite.com/l/44337`). To view an entry at its URL, you must first create a Display Page Template for the Object.

Follow these steps:

1. Open the *Site Menu* (![Site Menu](../../images/icon-menu.png)), expand *Design*, and go to *Page Templates*.

1. Click the *Display Page Templates* tab.

1. Click the *Add* button (![Add Button](../../images/icon-add.png)) and select the *Blank* template.

   This opens a modal window.

1. Enter a *name* and select the desired *Object* for Content Type.

   ![Enter a name and select the desired Object for Content Type](./displaying-object-entries/images/07.png)

1. Click *Save*.

   This creates a blank template with the selected Object as its default mapping source and redirects you to the template editing page.

1. Use page fragments and widgets to create flexible, dynamic displays for Object entries. See [Using Display Page Templates](../../site-building/displaying-content/using-display-page-templates.md) for information.

   ![Map fragment elements to Object fields to dynamically populate Display Pages for individual entries.](./displaying-object-entries/images/08.png)

1. When finished, click *Publish*.

1. Click the *Actions* button (![Actions Button](../../images/icon-actions.png)) for your template and select *Mark as Default*.

   This template is now used to render the Object's entries whenever users visit their friendly URLs.

   ![Click the Actions button for the template and select Mark as Default.](./displaying-object-entries/images/09.png)

## Creating Information Templates for Objects

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)) and go to *Design* &rarr; *Templates* &rarr; *Information Templates*.

1. Click the *Add* button (![Add Button](../../images/icon-add.png))

1. Enter a *name* and select the desired *Object*.

   ![Enter a name and select the desired Object.](./displaying-object-entries/images/10.png)

1. Click *Save*. This redirects you to the template design page.

1. (Optional) Click the Actions button (![Actions Button](../../images/icon-actions.png)) in the Application Bar, select *Import Script*, and choose an `.ftl` file to import. This replaces the current template with the file's FreeMarker script.

   ![Import script from an .ftl file.](./displaying-object-entries/images/11.png)

1. Use [FreeMarker](https://freemarker.apache.org) to design your template.

   In the *Elements* side panel (![Elements](../../images/icon-list-ul.png)), you can access available fields from the selected Object's structure.

   ![Select from available fields in the Object's structure.](./displaying-object-entries/images/12.png)

1. (Optional) Add a description or image to the template in the Properties side panel (![Properties](../../images/icon-cog3.png)).

   ![Add a description or image in the Properties panel.](./displaying-object-entries/images/13.png)

1. Click *Save* when finished.

You can now select from the template when mapping Object entries to fragment fields.

![Select the template when mapping fragment elements.](./displaying-object-entries/images/14.png)

## Adding Entries to Navigation Menus

Since Objects are integrated with the info framework, you can add Object entries to navigation menus to provide quick access. All published Objects are automatically listed as available sources for menu elements. See [Using the Navigation Menus Application](../../site-building/site-navigation/using-the-navigation-menus-application.md) for more information.

## Additional Information

* [Creating Objects](./creating-and-managing-objects/creating-objects.md)
* [About Collections and Collection Pages](../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)
* [Using Display Page Templates](../../site-building/displaying-content/using-display-page-templates.md)

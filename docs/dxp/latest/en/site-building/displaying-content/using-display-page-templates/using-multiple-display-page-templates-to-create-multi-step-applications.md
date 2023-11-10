# Using Multiple Display Page Templates to Create Multi-Step Applications

```{important}
This feature is currently behind a release feature flag. Read [Release Feature Flags](../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) for more information.
```

Display page templates are used to display content at a dedicated URL. To use this URL and view the content, you have to first define a template to display it.

Generally, a default display page template is set for a specific content type in order to display it. However, you can associate multiple display page templates with the same content type, in addition to the default template, and map any of those options to links. This means users can create applications (e.g., [forms mapped from custom objects](../../../building-applications/objects/using-fragments-to-build-forms.md)) with multiple steps.

## Creating Multi-Step Applications Using Multiple Display Page Templates

You can use multiple display page templates to your advantage and create applications with multiple steps and link each step to a different display page template.

Using display page templates, objects, and Form Container fragments you can create a page that allows users to add an object entry and edit it in a different page. To do that, it is necessary to create a [custom object](#tasks-custom-object), a [display page template](#edit-display-page-template) to edit the object entry, and a [content page](#content-page-to-display-the-application) where the user can enter a new object entry and view a list of existing object entries.

### Tasks Custom Object

1. [Create a custom object](../../../building-applications/objects/creating-and-managing-objects/creating-objects.md) and label it *Task*.

1. Click on the *Task* object.

1. (Adding a Field) Under the Fields tab, add a text-type Field labeled Description.

1. (Adding an Action) Under the Actions tab, add an Action and label it Edit.

1. Under Action Builder, select *Standalone* as the Trigger.

   This allows this action to be mapped to a button.

1. Select *Update an Object Entry* as the Action.

   This updates the object entry using a selected value whenever the trigger is activated.

1. Click *Add* in Values and choose the Description field. Under New Value, enter *description* (the name of our field).

   This replaces the object entry's Description field value with the new value.

   ![Create the Edit action to update the object description value](./using-multiple-display-page-templates-to-create-multi-step-applications/images/01.png)

1. Add an *Error Message* and click *Save*.

1. (Publishing the Object) Under the Details tab, select a *Scope* for the object and click *Publish* at the top right corner.

Your object is now published and it can be used to generate a form using a Form Container fragment in the content page or the display page template.

![Creating the Task object](./using-multiple-display-page-templates-to-create-multi-step-applications/images/02.gif)

### Content Page to Display the Application

1. [Create a content page](../../creating-pages/adding-pages/adding-a-page-to-a-site.md). Use the *Blank* template and name the page *List of Tasks*.

1. Add a Grid fragment to the page. Click on it and set the Number of Modules to two on the right panel.

1. In the Fragments and Widgets sidebar, look for the Form Container fragment. Drag and drop it on the left grid module, click *None*, and map it to the Task object.

   On the left grid module, users can add a new entry to the object.

1. Click on the *Form Container* fragment and set the Success Interaction to *Stay in Page*.

   Once users add an entry to the object, the page is updated but nothing else happens.

1. Add a *Heading* fragment to the right grid module. Double click on it to edit it. Enter *List of Tasks* as the heading.

1. Add a Collection Display fragment to the right grid module under the Heading. Click on the fragment. Under the General tab, click on *Collection*.

   On the right grid module, users can see a list of Tasks.

1. Under the Collection Providers tab, select *Tasks*.

   The Collection Provider displays the entries in Tasks in any way you design it.

1. Add a *Grid* to the Collection Provider and set the Number of Modules to two on the right panel.

   ![The grids are marked in red.](./using-multiple-display-page-templates-to-create-multi-step-applications/images/03.png)

1. Add a *Heading* fragment to the left grid module in your collection display and click on it twice. Under the Mapping tab, choose Description as the field.

   This maps the text added to the Description field as the Heading content.

1. Add a *Button* fragment to the right grid module in your collection display and click on the text twice to edit it. Change the text to *Edit*.

1. Publish the page

Although you can view the page, add an object entry, and see the list of tasks updated, it is still incomplete. The [Edit display page template](#edit-display-page-template) needs to be created and you need to map the Edit button to the page in order to direct the user to the Edit display page template.

![Creating a content page to display the application](./using-multiple-display-page-templates-to-create-multi-step-applications/images/04.gif)

### Edit Display Page Template

1. Create a [display page template](./creating-and-managing-display-page-templates.md), name it Edit, and select *Task* as the content type.

   The display page template is now associated with the Task object.

1. In the Fragments and Widgets sidebar, look for the Form Container fragment. Drag and drop it into the page, click *None*, and map it to the Task object.

   A form is generated automatically using the fields from the selected object definition.

   ```{warning}
   Form fields from master page templates are not populated on display pages. So, if you add a form container linked to an object in the master page of the display page, it is not possible to visualize the form fields related to the object.
   ```

1. Select the Form Container and set its Success Interaction to *Go to Page* and select the List of Tasks page.

   Once the form is submitted, the user is redirected to the List of Tasks page.

1. Click on the *Submit* button twice. Under Field, select the *Edit* action.

   Once users click on the submit button, not only are they redirected to the List of Tasks page, but they also activate the Edit action that replaces the previous value with the newly added one.

```{tip}
Not only are Form Container fragments enabled in display page templates, but you can also edit the Form Container fragment and leave a subset of input fragments. Then, when the object entry is updated, only the available fields are updated.

You can edit the fragments as you see fit and save the Form Container fragment as a composition to be used in both content pages and display pages.
```

![Creating the Edit display page template](./using-multiple-display-page-templates-to-create-multi-step-applications/images/05.gif)

### SEO Considerations About the Display Page Templates

<!-- I was not sure if I was supposed to add this information here... but here it is anyways. -->

If the display page is marked as default:

   - The `Sitemap.xml` configuration is enabled, and customers can customize it according to their requirements (there's no breaking change).

   - When the default display page is mapped as a specific display page, a `<link> `element is added with the attribute `rel="canonical"` to the `<head>` section, pointing to the URL of the asset as the canonical page.

These changes are made automatically if the display page is not marked as default:

   - The display page is not indexed in the `Sitemap.xml`.

   - Robots configuration is disabled.

   - The value `“noindex, nofollow”` is set in the Robots configuration.

   - When another page has a link to the display page template, add the attribute `rel="nofollow"` to the `<a>` tag on the template.

   - If a display page marked as default exists for the same object, a `<link>` element is added with the attribute `rel="canonical"` to the `<head>` section, pointing to the default display page template as the canonical page.

### Resulting Application

Before using the resulting application,

1. In your List of Tasks content page, click on the *Edit* button twice.

1. Under the Link tab, choose *Mapped URL* under Link and choose the *Edit* display page template.

   Once users click on the Edit button, they are redirected to the Edit display page template. Where they can edit the entry and resubmit the form, returning to the List of Tasks content page.

1. Publish the List of Tasks page.

Now you can access the List of Tasks page and test the application. Add a task description on the left side of the page, the page updates, and you can see the new task description on the right in your collection display.

If you click on the Edit button, you are redirected to the Edit display page where you can edit the entry. Once you click submit, you are redirected back to the List of Tasks page.

```{tip}
You can create a display page template as an initial step and configure the Form Container's Success Interaction to Go to Entry Display Page pointing to the next display page template creating a chained multi-step form.
```

![This is how the application should work](./using-multiple-display-page-templates-to-create-multi-step-applications/images/06.gif)

## Related Topics

[Using Fragments to Build Forms](../../../building-applications/objects/using-fragments-to-build-forms.md)

[Creating Objects](../../../building-applications/objects/creating-and-managing-objects/creating-objects.md)

[Adding a Page to a Site](../../creating-pages/adding-pages/adding-a-page-to-a-site.md)

[Creating and Managing Display Page Templates](./creating-and-managing-display-page-templates.md)
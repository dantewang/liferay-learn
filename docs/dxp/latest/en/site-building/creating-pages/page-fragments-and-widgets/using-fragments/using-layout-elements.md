# Using Layout Elements

{bdg-secondary}`For Liferay 7.4 U22+/GA22+`

Layout Elements define drop zones that you can use to design page or template layouts. By default, Liferay includes two Layout Elements: [Containers](#containers) and [Grids](#grids). Once added, you can drag and drop widgets or other fragment into these drop zones, including additional containers or grids to create even more complex layouts. After designing a layout, you can save layout compositions to reuse them in other pages and templates. See [Saving Fragment Compositions](./saving-fragment-compositions.md) for more information.

![The container and grid fragments are for designing page layouts.](./using-layout-elements/images/01.png)

When you create a new page or template that supports fragment, a default drop zone appears. You can add any fragment to this area, but using the container fragment as the first element in your composition has important advantages:

* Greater layout control over page design, including flex display properties for [advanced compositions](./saving-fragment-compositions.md#creating-advanced-compositions-with-the-container-fragment) (Liferay DXP 7.4+)
* Ability to quickly [save and reuse](./saving-fragment-compositions.md) compositions in other pages and templates
* Ability to add a URL or page redirect to a fragment composition
* Ability to leverage [style books](../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) to standardize your site appearance

Once you've added a container, you can then use the grid fragment to customize content layout for different viewports. See [Building Responsive Layouts with the Grid Fragment](./../../../optimizing-sites/building-a-responsive-site/building-responsive-layouts-with-the-grid-fragment.md) to learn more.

```{tip}
When dragging and dropping an element into a container or grid, Liferay highlights the dropzone to indicate where you're placing it. Once added, you can drag and drop elements in the Browser side panel ( ![Browser](../../../../images/icon-hierarchy.png) ) to rearrange them.
```

## Containers

> Previously called *Panels*

The container fragment adds a configurable drop zone to a content page. In addition to standard configuration options, you can configure the container's HTML tag, display structure, and more. See [Configuring Fragments](./configuring-fragments.md) for more information.

![Containers include both standard and unique configuration options.](./using-layout-elements/images/02.png)

## Grids

> Previously called *Rows*

The grid fragment adds multiple drop zone modules to a page or template. These modules can be arranged horizontally and vertically. In addition to standard configuration options, you can determine the number of modules for each grid, the number of modules per row, and the vertical alignment of each module's content. You can manually adjust the width of each module and add or remove padding between them. See [Configuring Fragments](./configuring-fragments.md) for more information.

![Grids include standard and unique configuration options.](./using-layout-elements/images/03.png)

## Additional Information

* [Default Fragments Reference](./default-fragments-reference.md)
* [Saving Fragment Compositions](./saving-fragment-compositions.md)
* [Configuring Fragments](./configuring-fragments.md)

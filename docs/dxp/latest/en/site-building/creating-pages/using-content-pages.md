---
toc:
  - ./using-content-pages/adding-elements-to-content-pages.md
  - ./using-content-pages/managing-content-in-content-pages.md
  - ./using-content-pages/using-widgets-on-a-content-page.md
  - ./using-content-pages/using-page-comments.md
  - ./using-content-pages/content-page-editor-ui-reference.md
uuid: 6f904c1b-7c0a-409d-b8aa-8f22d75fd8f9
---
# Using Content Pages

```{toctree}
:maxdepth: 3

using-content-pages/adding-elements-to-content-pages.md
using-content-pages/managing-content-in-content-pages.md
using-content-pages/using-widgets-on-a-content-page.md
using-content-pages/using-page-comments.md
using-content-pages/content-page-editor-ui-reference.md
```

By default, Liferay DXP uses the content page type, which provides a convenient user interface for managing and editing page content and design. With content pages, you can use configurable drag-and-drop elements out-of-the-box or develop your own to create the desired user experience.

As with other page types, you can use [widgets](./using-content-pages/using-widgets-on-a-content-page.md) to add dynamic functionality to a content page, integrating blogs, wikis, message boards, and more. Content pages are primarily built using [page fragments](./page-fragments-and-widgets/using-fragments.md). Page fragments are extensible, reusable page elements that include editable components, such as text, images, and links, which you can also map to available content. See [Default Fragments Reference](./page-fragments-and-widgets/using-fragments/default-fragments-reference.md) to learn more about DXP's out-of-the-box fragments, or [Developing Fragments](../developer-guide/developing-page-fragments/developing-fragments-intro.md) to learn how to create your own.

When editing content pages, changes are made through a *site builder* and are saved as a draft. You can review, undo, and redo changes you've made during your current editing session, without affecting the live version. When ready, publish your changes immediately or enable a custom [workflow](../../process-automation/workflow/introduction-to-workflow.md) to direct the review and publishing process. You can also add [comments](./using-content-pages/using-page-comments.md) on page elements to collaborate with team members.

![When editing content pages, all changes are made to content pages through a site builder.](./using-content-pages/images/01.png)

With content page fragments and widgets, you can display web content, documents, and more. You can also view, edit, and manage your content, including content mapped to page fields. See [Managing Content in Content Pages](./using-content-pages/managing-content-in-content-pages.md) for more information.

Create personalized page [experiences](../personalizing-site-experience/experience-personalization/content-page-personalization.md) and manage localized translations to engage your target audiences. You can also further optimize user experience with the responsive layout editor. This tool adapts the page content, so you can view and configure how your content page is displayed on desktops, tablets, and smartphones.

Finally, with [A/B Testing](../optimizing-sites/ab-testing/ab-testing.md), you can create alternative versions of a content page to track visitor data (e.g., bounce rate, clicks, etc.). Using algorithms, you can analyze this data to determine which page version best achieves your goals and hone your message accordingly.

See [Adding Elements to Content Pages](./using-content-pages/adding-elements-to-content-pages.md) to get started!

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Adding Elements to Content Pages
:link: ./using-content-pages/adding-elements-to-content-pages.md
:::

:::{grid-item-card} Managing Content in Content Pages
:link: ./using-content-pages/managing-content-in-content-pages.md
:::

:::{grid-item-card} Using Fragments

* [Default Fragments Reference](./page-fragments-and-widgets/using-fragments/default-fragments-reference.md)
* [Using Layout Elements](./page-fragments-and-widgets/using-fragments/using-layout-elements.md)
* [Configuring Fragments](./page-fragments-and-widgets/using-fragments/configuring-fragments.md)
:::

:::{grid-item-card} Using Widgets on a Content Page
:link: ./using-content-pages/using-widgets-on-a-content-page.md
:::

:::{grid-item-card} Using Page Comments
:link: ./using-content-pages/using-page-comments.md
:::

:::{grid-item-card} Content Page Editor UI Reference
:link: ./using-content-pages/content-page-editor-ui-reference.md
:::
::::

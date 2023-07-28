---
toc:
  - ./site-templates/creating-site-templates.md
  - ./site-templates/propagating-template-changes.md
  - ./site-templates/configuring-site-template-propagation.md
  - ./site-templates/exporting-importing-site-templates.md
uuid: 7306854f-8c76-4c95-946f-9930a0f477f4
---

# Site Templates

```{toctree}
:maxdepth: 4

site-templates/creating-site-templates.md
site-templates/propagating-template-changes.md
site-templates/configuring-site-template-propagation.md
site-templates/exporting-importing-site-templates.md
```

Liferay provides site templates for designing structures and content that you can use during site creation. Each template includes most standard site applications for adding pages, stylebooks, web content, and more. Sites created with a template inherit all of its data. See [Creating Site Templates](./site-templates/creating-site-templates.md) for more information.

```{note}
Site templates support all site applications except staging, workflow, memberships, teams, and segments.
```

Once you've created a site using a template, you can make changes to the template's pages and automatically propagate those changes to connected sites. See [Propagating Template Changes](./site-templates/propagating-template-changes.md) for more information.

```{important}
Site templates are primarily intended for maintaining pages across multiple sites. If you need to create and maintain web content and other assets across sites, use [Asset Libraries](../../content-authoring-and-management/asset-libraries/asset-libraries-overview.md).
```

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Creating Site Templates
:link: ./site-templates/creating-site-templates.md
:::

:::{grid-item-card} Propagating Template Changes
:link: ./site-templates/propagating-template-changes.md
:::

:::{grid-item-card} Configuring Site Template Propagation
:link: ./site-templates/configuring-site-template-propagation.md
:::

:::{grid-item-card} Exporting and Importing Site Templates
:link: ./site-templates/exporting-importing-site-templates.md
:::
::::

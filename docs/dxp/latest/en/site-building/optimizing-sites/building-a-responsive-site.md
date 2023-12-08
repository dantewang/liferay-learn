---
toc:
  - ./building-a-responsive-site/building-responsive-layouts-with-the-grid-fragment.md
  - ./building-a-responsive-site/using-the-simulation-panel.md
uuid: 60f0d6ab-cd15-4649-9af4-00afdcaaf0d1
---
# Building a Responsive Site

More than half of all page views in the world come from mobile devices like phones and tablets. Any site should look as good when viewed by a mobile device as it does on a desktop. Liferay DXP can help you provide the best experience possible no matter what device visits your site.

Out-of-the-box, Liferay uses responsive layouts:

* DXP widgets and custom widgets using Liferay's UI frameworks automatically scale to fit the screen size.

    ![Adjust the widget's size.](./building-a-responsive-site/building-a-responsive-site/images/01.png)

* UI elements like the Navigation and Product Menu automatically adjust to remain usable on smaller screens.

    ![The main navigation adjusts its size.](./building-a-responsive-site/building-a-responsive-site/images/02.png)

* When the screen width is low, Liferay combines columns so that all content remains legible.

   ![Columns are combined when the width is low.](./building-a-responsive-site/building-a-responsive-site/images/03.png)

* For web developers, theme tools help ensure optimum mobile performance.

If you're using the default theme, your pages already adjust to fit mobile devices. There are also tools to verify that everything appears as intended. The device simulator (![Simulation](../../images/icon-simulation.png)) shows you how pages look on different devices.

```{tip}
In Liferay 7.2 you can create mobile device rules that govern site behavior on detection of a mobile device. For more information on creating mobile device rules, see [Creating Mobile Device Rules](./building-a-responsive-site/creating-mobile-device-rules.md).
```

```{toctree}
:maxdepth: 3

building-a-responsive-site/building-responsive-layouts-with-the-grid-fragment.md
building-a-responsive-site/using-the-simulation-panel.md
```

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Building Responsive Layouts with the Grid Fragment
:link: ./building-a-responsive-site/building-responsive-layouts-with-the-grid-fragment.md
:::

:::{grid-item-card} Using the Simulation Panel
:link: ./building-a-responsive-site/using-the-simulation-panel.md
:::
::::
---
taxonomy-category-names:
- Sites
- Pages and Composition
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: d3d3b087-cf75-4ab5-a288-06f4018e0ad4
---
# Using the Full Page Application Page Type

1. [Create a new page](./adding-a-page-to-a-site.md) and select *Full Page Application* under the Other heading.

1. Enter a name and click *Add*.

1. Select the application you want to display from the list of applications under the Full Page Application heading. By default, you can set the Blogs, Wiki, Media Gallery, Message Boards, RSS Publisher, Documents and Media, Form, or Application Authorization Request to be the sole application for the page. Developers can make their applications full page applications.

   ![A full page application page supports many applications.](./using-the-full-page-application-page/images/01.png)

1. Click *Save* to apply the changes.

## Scoping Full Page Application Data

All applications supported by the full page application page type are non-instanceable, and the content of the application you choose is based on the instance for that site. Therefore, if you already had data in your application, such as a wiki, it appears on the page. If you want to configure a full page application, such as wiki, to be scoped to a specific page, you can configure that through the application's settings. Below is an example for a wiki:

1. From the page, click the ( ![Options](../../../images/icon-app-options.png) ) button for the wiki application and select *Configuration*.

1. From the Wiki - Configuration page, select the *Scope* tab.

1. Open the *Scope* menu and select the wiki page you want.

![Configuring the scope of the application.](./using-the-full-page-application-page/images/02.png)

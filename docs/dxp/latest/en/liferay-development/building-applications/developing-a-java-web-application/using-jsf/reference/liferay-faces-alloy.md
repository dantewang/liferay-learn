---
uuid: fab040c9-9f5b-4d50-993f-b796ecf72a20
taxonomy-category-names:
- Development and Tooling
- Java Development
- Liferay Self-Hosted
- Liferay PaaS
---
# Liferay Faces Alloy

Liferay Faces Alloy is distributed in a `.jar` file. You can add Liferay Faces Alloy as a dependency to your portlet projects, to use AlloyUI in a way that is consistent with JSF development.

```{note}
AlloyUI is deprecated in Liferay DXP 7.2.
```

During the creation of a JSF portlet in Liferay IDE/Developer Studio, you have the option of choosing the portlet's JSF Component Suite. The options include *JSF standard*, [*ICEfaces*](http://www.icesoft.org/java/projects/ICEfaces/overview.jsf), [*PrimeFaces*](http://primefaces.org/), [*RichFaces*](http://richfaces.jboss.org/), and *Liferay Faces Alloy*.

If you selected the Liferay Faces Alloy JSF Component Suite during your portlet's setup, the `.jar` file is included in your portlet project.

The Liferay Faces Alloy project provides a set of UI components that utilize AlloyUI. For example, a brief list of some of the supported `aui:` tags are listed below:

* Input: `alloy:inputText`, `alloy:inputDate`, `alloy:inputFile`
* Panel: `alloy:accordion`, `alloy:column`, `alloy:fieldset`, `alloy:row`
* Select: `alloy:selectOneMenu`, `alloy:selectOneRadio`, `alloy:selectStarRating`

If you want to utilize Liferay's AlloyUI technology based on YUI3, you must include the Liferay Faces Alloy `.jar` file in your JSF portlet project. If you selected *Liferay Faces Alloy* during your JSF portlet's setup, you have Liferay Faces Alloy preconfigured in your project, so you're automatically able to use the `alloy:` tags.

As you can see, it's extremely easy to configure your JSF application to use Liferay's AlloyUI tags.

## Related Topics

* [Developing a JSF Portlet Application \(Help Center\)](https://help.liferay.com/hc/en-us/articles/360029069451-Developing-a-JSF-Portlet-Application)
* [Liferay Faces Bridge](./liferay-faces-bridge.md)
* [Liferay Faces Portal](./liferay-faces-portal.md)

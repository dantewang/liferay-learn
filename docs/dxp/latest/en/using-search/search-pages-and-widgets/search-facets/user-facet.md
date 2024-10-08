---
taxonomy-category-names:
- Search
- Search Pages and Widgets
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: ecebf8d3-b77c-418c-afc8-d533d118d85f
---
# User Facet

The User Facet narrows search results down to those created by certain Users.

![Example of user facet results.](user-facet/images/01.png)

## Configuring the User Facet

To configure the User Facet, open the Options menu (![Click on the options icon of the search bar.](../../../images/icon-app-options.png)) of the facet and click *Configuration*.

![Click on the Configuration option.](user-facet/images/02.png)

**Display Settings:** Choose between *Default*, *Compact Layout*, and *Label Layout*. The Default layout shows checkboxes next to each term but the Compact layout does not. The Label layout shows small clickable labels for each term.

The Advanced Configuration section contains additional options: 

**User Parameter Name:** Change the parameter name in the URL for the Facet. The default is *user*. 

**Max Terms:** Set the maximum number of facet terms to display, regardless of how many matching terms are found for the facet.

**Frequency Threshold:** Set the minimum frequency required for terms to appear in the list of facet terms. For example, if the frequency threshold of a facet is set to 3, a term with two matching results doesn't appear in the term result list.

**Display Frequencies:** Choose whether or not to display the term frequencies.

**Order Terms By:** For Liferay 7.4 U60+/GA60+, you can choose the facet term sorting strategy: Term Frequency Descending (default), Term Frequency Ascending, Term Value Ascending, or Term Value Descending. The default sorting orders facet terms from most matches to least. Term value options order facet terms alphabetically.

Once finished, click the *Save* button.

---
taxonomy-category-names:
- Search
- Search Pages and Widgets
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 0e27e0a4-29ba-4665-aae5-bd41983bb687
---
# Folder Facet

The Folder Facet narrows search results down to content found in specific Asset Folders. Note that the search match is not for folder names but for content found inside of the folders.

![Example of folder facet results.](folder-facet/images/01.png)

## Configuring the Folder Facet

To configure the Fold Facet, open the Options menu (![Click on the options icon of the search bar.](../../../images/icon-app-options.png)) of the facet and click *Configuration*.

![Click on the Configuration option.](folder-facet/images/02.png)

**Display Settings:** Choose between *Default*, *Compact Layout*, and *Label Layout*. The Default layout shows checkboxes next to each term but the Compact layout does not. The Label layout shows small clickable labels for each term.

The Advanced Configuration section contains additional options: 

**Folder Parameter Name:** Change the parameter name in the URL for the Facet. The default is *folder*. 

**Max Terms:** Set the maximum number of facet terms to display, regardless of how many matching terms are found for the facet.

**Frequency Threshold:** Set the minimum frequency required for terms to appear in the list of facet terms. For example, if the frequency threshold of a facet is set to `3`, a term with two matching results does not appear in the term result list.

**Display Frequencies:** Choose whether or not to display the term frequencies.

**Order Terms By:** For Liferay 7.4 U44+/GA44+, you can choose the facet term sorting strategy: Term Frequency Descending (default), Term Frequency Ascending, Term Value Ascending, or Term Value Descending. The default sorting orders facet terms from most matches to least. Term value options order facet terms alphabetically.

Once finished, click the *Save* button.

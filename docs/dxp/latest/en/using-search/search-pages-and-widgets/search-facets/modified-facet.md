---
taxonomy-category-names:
- Search
- Search Pages and Widgets
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 24cb1057-51ec-429c-b8d8-e70ae6592e23
---
# Modified Facet

The Modified Facet narrows search results down to those that match the searched keyword and results that were created or modified during a certain time period.

![Example of modified facet results.](modified-facet/images/01.png)

In addition to selecting a pre-configured time period, Users can select a Custom Range, specifying a From and To date using a date picker.

## Configuring the Modified Facet

To configure the Modified Facet, open the Options menu (![Click on the options icon of the search bar.](../../../images/icon-app-options.png)) of the facet and click *Configuration*.

![Click on the Configuration option.](modified-facet/images/02.png)

**Display Settings:** Choose between *Default*, *Compact Layout*, and *Label Layout*. The Default layout shows checkboxes next to each term but the Compact layout does not. The Label layout shows small clickable labels for each term.

The Advanced Configuration section contains additional options: 

**Frequency Threshold:** Set the minimum frequency required for terms to appear in the list of facet terms. For example, if the frequency threshold of a facet is set to `3`, a term with two matching results is omitted in the facet's term result list.

**Order Terms By:** For Liferay 7.4 U63+/GA63+, you can choose a facet term sorting strategy: Term Frequency Descending or Term Frequency Ascending. Term Frequency Descending orders facet terms from most matches to least. By default, facet terms appear statically in the order the timer periods configuration.

In Ranges Configuration, you can modify, delete, or create time ranges:

The available time range aliases include

    past-hour
    past-24-hours
    past-week
    past-month
    past-year

By default, all the time ranges end in `*`, which evaluates to *now*. For example, the past-week range is

    [past-week TO *]

But you are not limited to ending the range to now. Instead of `*`, you can specify another time range alias as the ending point.

For example, to set up a range from 12 months ago to one month ago, 

1. Click the plus button in one of the existing ranges.

1. Give it the label **Past 1-12 Months**.

1. Give it a Range value of 

        [past-year to past-month]

This gives you a lot of flexibility in using alternative time ranges as Modified Facet terms.

Once finished, click the *Save* button.

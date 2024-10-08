---
toc:
  - ./segments/creating-segments.md
uuid: 9438dbbf-0a67-4531-bff7-4ec226860725
taxonomy-category-names:
- Personalization
- Static and Dynamic User Segments
- Liferay Self-Hosted
- Liferay SaaS
- Liferay PaaS
---

# Segments

Segments aggregate individuals based on common attributes and behavior. For example, you can create a segment that contains users interested in a given topic, work in a specific industry, or both. Analytics Cloud analyzes and profiles segments. You can then integrate your Analytics Cloud segments with personalization in Liferay DXP, so you can deliver content of interest to each segment via Liferay DXP.

There are two types of Segments:

**Dynamic Segments:** Individuals are aggregated automatically based on criteria that you specify. Criteria can be based on individuals' attributes and interaction with your Liferay DXP site pages and assets. For example, you can use an industry attribute as criteria. Analytics on industry segments show industries that engage with you the most and what content they're interested in.

!!! note
    Dynamic segment data updates every hour and when a new dynamic segment is created or edited.

**Static Segments:** Individuals you aggregate manually.

## Segment Profiles

Here's how to view segment profiles:

1. Select *Segments* from the navigation panel. The Segments page appears, listing individual segments. You can page through, search for, and select segments to learn more about them.

1. Select a segment to learn these things about it:

    - Membership: Population fluctuation over time.
    - Interest: Topics mentioned in the pages and assets the segment visits most.
    - Distribution: Based on individual attributes.

## Overview Tab

The Overview tab's main area shows membership growth. As a marketer, you might want to generate more customer prospects in a specific industry. If you create a dynamic segment with that industry as criterion, you can view its membership histogram to monitor customer growth in that industry.

The Overview tab also shows the segment's criteria, interests, and distribution. Each one links to more details, or you can click on their respective tabs.

To download this dashboard view as a PDF file, click *Download Reports*. See [Downloading Reports](../reference/downloading-reports.md) to learn more.

### Segment Membership Panel

The Segment Membership panel displays the breakdown of the segment for known and anonymous individuals. It shows data for the previous 30 days. Place your mouse over the graph to see the breakdown at specific dates in the 30 days.

!!! note
    Individuals are considered known when their email addresses are matched at login with user data synced with Analytics Cloud. When new users register on your site, it may take up to two hours for their data to sync with Analytics Cloud and appear as known individuals.

![The Segment Membership panel shows a breakdown of your segment for the past 30 days.](./segments/images/01.png)

To see a list of known individuals of the segment, click the *View Members* link at the bottom of the panel. Alternatively, click the *Membership* tab at the top of the page.

### Top Interests Panel

The Top Interests panel shows a list of the most popular topics of interest in the segment. This is based on the pages and assets that get the most visits.

![The Top Interests panel shows a list of most popular topics.](./segments/images/02.png)

To see the full list of interest topics, click on the *View All Interests* link at the bottom of the panel. Alternatively, click the *Interests* tab at the top of the page.

### Breakdown Panel

The Breakdown panel displays distribution information based on selected attributes of segment members.

![The Breakdown panel shows the distribution of the segment members based on selected attributes.](./segments/images/03.png)

Up to 10 different attributes appear on this panel. To see the full list of breakdowns, click the *Explore Breakdown* link at the bottom of the panel. Alternatively, click the *Distribution* tab at the top of the page.

### Segment Composition Panel

The Segment Composition panel shows the breakdown of active and known members versus the total individuals in the segment. For example, if the segment was created for interest in a specific topic, this panel would show the active percent of the segment for the past 30 days and what percent of the segment was known.

![The Segment Composition panel shows a breakdown of your segment versus active and known.](./segments/images/04.png)

Note, this panel only appears for dynamic segments.

### Segment Criteria Panel

The Segment Criteria panel displays the criteria used to configure the segment. For example, a segment might be a dynamic segment of visitors who viewed a particular blog on your site.

![The Segment Criteria panel displays the configured criteria of the segment](./segments/images/05.png)

If one of your segment's criteria is a custom event you've deleted, you are alerted with a message informing you the custom event no longer exists.

![The missing criteria is replaced with a message](./segments/images/06.png)

To learn more about different segment criteria, see [Creating Segments](./segments/creating-segments.md).

## Membership Tab

The Membership tab displays the same chart as the Segment Membership panel. It also presents a list of all known individuals in the segment.

![The Membership tab shows a list of known individuals.](./segments/images/07.png)

The name, email address, and first seen date is given for known individuals. Use the search bar to search for specific individuals.

## Interests Tab

As a segment's members interact with your pages and assets, Analytics Cloud's *interests* algorithm determines the level of interest the segment has with your site's topics. Knowing these topics helps you communicate with the segment members to create content that interests them.

![The Interests tab shows interest information based on your segments.](./segments/images/08.png)

The Individuals tab shows a list of names of people interested in the topic. The Active Pages tab shows a list of pages that include the interest keyword(s) that were recently viewed by segment members. The Inactive Pages tab shows a list of pages that include the interest keyword(s) but have not been recently viewed.

## Distribution Tab

The Distribution tab breaks down the segment by an individual attribute.

For example, select a attribute such as Job Title to dissect your segment further. A bar chart appears, showing a distribution of the segment member population by Job Title. As a marketer, you could use this information to identify a subset of the segment to focus a marketing campaign on.

You've completed touring segment profiles. Creating segments and analyzing their profiles is key to learning more about your customers.

![The Distribution tab shows data on known individuals broken down by the selected attribute.](./segments/images/09.png)

## Related Topics

- [Personalizing Content with Segments](../optimization/personalizing-content-with-segments.md)
- [Understanding Interests](./individuals/understanding-interests.md)

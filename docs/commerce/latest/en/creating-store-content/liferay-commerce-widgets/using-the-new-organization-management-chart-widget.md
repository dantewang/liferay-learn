---
uuid: 8aba7021-76e6-4b64-bb06-0ad2ffb1ce5d
taxonomy-category-names:
- Commerce
- Storefronts
- Widgets
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Using the New Organization Management Chart Widget

{bdg-secondary}`Liferay DXP 2024.Q1+/Portal 7.4 GA112+`

You can use Liferay's revamped organization management chart to view, manage, and search through organizations, associated accounts, and users.

!!! important
    This feature is currently behind a release feature flag. Read [Release Feature Flags](https://learn.liferay.com/web/guest/w/dxp/system-administration/configuring-liferay/feature-flags#release-feature-flags) for more information.

![Use the organization management chart to view, manage, and search through organizations, its associated accounts, and users](./using-the-new-organization-management-chart-widget/images/01.png)

!!! note
    In earlier versions of Liferay (Liferay DXP 7.4 2023.Q4/Portal 7.4 GA98 and before), the organization management widget came without the following capabilities:

    * The ability to search for organizations, accounts, and users
    * The ability to view and edit details from the side panel.

## Accessing the Organization Management Chart

You can access the organization management chart by going into the Users and Organizations application.

1. Open the *Global Menu* (![Global Menu icon](../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Users and Organizations*.

1. Go to the *Organization Chart* tab.

This displays the hierarchical structure of organizations.

## Adding the Organization Management Chart Widget to a Page

1. Click *Add* (![Add Button](../../images/icon-add.png)) from the top menu.

1. In the Widgets section, search for the organization management widget.

1. Drag and drop the widget to the desired area in your storefront.

!!! note
    If you are using a content page, first click *Edit* (![Edit icon](../../images/icon-edit-pencil.png)) from the top menu. The Fragments and Widgets menu opens on the left side. The rest of the steps remain the same.

## Using the Search Bar

You can search for organizations, accounts, and users using the search bar at the top of the organization management chart. It auto-completes the entity you're searching for if it exists. Clicking on the result highlights it in the organization management chart. You can clear the search results to remove the highlight. 

![Use the search bar to find and highlight accounts, organizations, or users](./using-the-new-organization-management-chart-widget/images/02.png)

Clicking on *Collapse All* hides the expanded network and shows only the top-level parent nodes. Click *Expand* (![Expand icon](../../images/icon-expand.png)) to view the chart in full screen. Note that the search bar and side panel aren't visible when you’re viewing the chart in full screen.

## Viewing Entities

To view accounts, organizations, or users in detail,

1. Select the node to view from the organization management chart.

1. Click *Actions* (![Actions icon](../../images/icon-actions.png)) and select *View*.

This opens the side panel in view mode. 

![View more information about the selected organization, account, or user from the side panel.](./using-the-new-organization-management-chart-widget/images/03.png)

If you click on an organization with related accounts, organizations, or users or an account with related users, they appear in the organization management chart as child nodes linked to the parent. For instance, the image below shows the United States organization associated to three accounts and one user. You can click *Add* (![Organization Widget Add icon](../../images/icon-organization-widget-add.png)) to create additional nodes linked to the parent node. Nodes in blue represent organizations, nodes in green represent accounts, and nodes in yellow represent users. 

![Click Add to create additional nodes linked to the parent node.](./using-the-new-organization-management-chart-widget/images/04.png)

## Editing Entities

To edit accounts, organizations, or users,

1. Select the node to edit from the organization management chart.

1. Click *Actions* (![Actions icon](../../images/icon-actions.png)) and select *Edit*.

   This opens the side panel in edit mode. 

   ![Edit information about the selected organization, account, or user from the side panel.](./using-the-new-organization-management-chart-widget/images/05.png)

   You can edit the following fields for each entity. 

   | Entity       | Editable Fields                                                                                                           |
   | :----------- | :------------------------------------------------------------------------------------------------------------------------ |
   | Account      | Account Image, Account Name, Tax ID, External Reference Code, Description                                                 |
   | Organization | Country, Region                                                                                                           |
   | User         | User Image, Screen Name, Email Address, Language, Prefix, First Name, Middle Name, Last Name, Suffix, Job Title, Birthday |

1. Click *Save* to persist the changes. If you don't wish to continue, click *Cancel*.

## Removing Entities

To remove accounts, organizations, or users,

1. Select the node to remove from the organization management chart.

1. Click *Actions* (![Actions icon](../../images/icon-actions.png)) &rarr; *Remove*.

Removing a node only removes it from the network of nodes in the chart but doesn't delete it. The organization, account or user still exists. 

## Deleting Entities

To delete accounts, organizations, or users,

1. Select the node to delete from the organization management chart.

1. Click *Actions* (![Actions icon](../../images/icon-actions.png)) and select *Delete*.

You cannot delete an organization with sub-organizations or users. They must be deleted first before deleting the parent organization. 

Deleting an account that contains users only deletes the account but not the users.

## Related Topics

* [Creating and Managing Organizations](https://learn.liferay.com/w/dxp/users-and-permissions/organizations/creating-and-managing-organizations)

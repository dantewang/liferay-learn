---
uuid: 2a2d3e75-7ee7-4d83-ab03-6af9ab18227b
taxonomy-category-names:
- Commerce
- Inventory
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Availability Estimates

If a product runs out of stock, you can provide an estimate to customers for when it becomes available again. If you're using an accelerator like Minium or Speedwell, three availability estimates are automatically created. Otherwise, you can create your own.

## Creating Availability Estimates

1. Open the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)), and navigate to *Commerce* &rarr; *Availability Estimates*.

1. Click *Add* (![Add Button](../images/icon-add.png)).

    ![Click the Add button to create a new availability estimate.](./availability-estimates/images/01.png)

1. Enter a *Title*. This should state the estimated time before the product becomes available again (e.g., 3-5 days, 3-4 weeks, 2-3 months).

1. Enter a *Priority* to determine the display order of the estimate.

1. Click *Save*.

Once created, you can add it to a product with *Display Availability* enabled. Navigate to a product's *Configuration* tab, select the desired *Availability Estimate* from the drop-down, and click *Publish*.

![Select the desired availability estimate.](./availability-estimates/images/02.png)

You can view the selected availability estimate whenever the product runs out of stock.

![The selected estimate appears on the product page whenever the product runs out of stock](./availability-estimates/images/03.png)

## Commerce 2.1 and Below

To create a new availability estimate,

1. Navigate to the *Control Panel* &rarr; *Commerce* &rarr; *Settings*.

1. Click the *Availability Estimates* tab.

1. Click *Add* (![Add Button](../images/icon-add.png)) and enter the following information:

   * **Title:** 15-21 days
   * **Priority:** 4.0

1. Click *Save*.

This creates the new availability estimate. The priority value of 4.0 means that the new estimate appears below the existing availability estimates in the drop-down menu. Only estimates of priority 5.0 or higher can appear below it.

![Creating a new availability estimate.](./availability-estimates/images/04.png)

To use it, navigate to a product's *Configuration* tab, enable the *Display Availability* option, select the desired *Availability Estimate* from the dropdown, and click *Publish*.

![Activate the Display Availability toggle and select an availability estimate from the drop-down.](./availability-estimates/images/05.png)

## Related Topics

* [Inventory Management](../inventory-management.md)
* [Product Inventory Configuration Reference](./product-inventory-configuration-reference-guide.md)

---
toc:
  - ./payment-management/refunds.md
  - ./payment-management/adding-reasons-for-refunds.md
  - ./payment-management/payments-reference.md
uuid: e19c867e-20bc-4f05-86b3-36c1ff67f1f1
---
# Payment Management

{bdg-secondary}`Liferay DXP 2024.Q1+/Portal 7.4 GA112+`

Using Liferay's new payment management application you can view online payments in detail and create refunds on them. To access this application, open the *Global Menu* (![Global Menu](./images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Payments*. The Payments screen displays the following details about an online payment:

* ID
* Type
* ERC (External Reference Code)
* Date
* Amount
* Related To
* Related ID
* Status

See [Payments Reference](./payment-management/payments-reference.md) for more information on these fields. Only online payments appear on the Payments page. See [Refunds](./payment-management/refunds.md) to know more about creating refunds on these payments. 

!!! important
    This feature is currently behind a release feature flag. Read [Release Feature Flags](https://learn.liferay.com/web/guest/w/dxp/system-administration/configuring-liferay/feature-flags#release-feature-flags) for more information.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card}  Refunds
:link: ./payment-management/refunds.md
:::

:::{grid-item-card}  Adding Reasons for Refunds
:link: ./payment-management/adding-reasons-for-refunds.md
:::

:::{grid-item-card}  Payments Reference
:link: ./payment-management/payments-reference.md
:::
::::

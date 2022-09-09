# Configuring Page Publishing

By default, publishing a child page to Live also publishes its parent pages. This is to prevent orphaned pages. However, always publishing parent pages to Live can affect performance and publish to parent pages changes prematurely. If desired, you can configure this behavior to only publish your selected pages, instead of always including parent pages.

```{note}
This configuration only affects Staging. Manually exporting a Site to an LAR file always includes all parent pages.
```

Follow these steps to configure child/parent publishing for your system:

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), click the *Control Panel*, and go to *System Settings* &rarr; *Infrastructure*.

1. Click *Staging* under Virtual Instance Scope in the left menu.

1. Check or uncheck *Publish Parent Pages by Default*.

   If checked, parent pages are always published to Live.

   If unchecked, the parent page is only published if it doesn't exist in Live yet. If the parent page was already published, only a reference element is added, which is used for the validation to make sure the parent is already in the Live.

1. Click *Save*.

## Additional Information

* [Understanding the Publishing Process](./understanding-the-publishing-process.md)
* [Page Versioning](./page-versioning.md)

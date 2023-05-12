---
uuid: 516dc7a3-dac5-411e-96f6-0abc8e916604
---
# How Adaptive Media Works
<!--TASK: Use as section intro, Adaptive Media. -->
Media providers must consider differences between devices (phones, laptops, tablets, etc.) when delivering content; not just their screen sizes but also their bandwidth and processing capabilities. Adaptive Media can control image quality and dynamically adjusts uploaded media to best fit the screen being used.

Adaptive Media integrates with Documents and Media, Blogs, Web Content, and Content Pages (starting with Liferay DXP 7.4+). It generates a set of images for use on various screens. When the content is accessed, Adaptive Media checks the screen type and resolution and selects the appropriate image. Adaptive Media comes pre-installed in DXP.

```{note}
Adaptive Media is available OOTB for the following Commerce widgets: [Search Results](https://learn.liferay.com/commerce/latest/en/creating-store-content/commerce-storefront-pages/search.html), [Product Details, Product Publisher](https://learn.liferay.com/commerce/latest/en/creating-store-content/commerce-storefront-pages/product-details.html), [Mini Cart widget](https://learn.liferay.com/commerce/latest/en/creating-store-content/liferay-commerce-widgets/using-the-mini-cart-widget.html) and component, [Checkout](https://learn.liferay.com/commerce/latest/en/creating-store-content/commerce-storefront-pages/checkout.html).
```

Here, you'll learn about Adaptive Media and how to prepare it to handle images. <!--Q: What about other assets? -->

To use Adaptive Media, you must first define the resolutions for the images delivered to users' devices. Adaptive Media then generates new images scaled to fit those resolutions, while maintaining the original aspect ratio. See [Adding Image Resolutions](./adding-image-resolutions.md) to learn more about creating new Image Resolutions.

As noted above, you can use the adapted images in various types of content; see [Using Adapted Images in Site Content](./using-adapted-images-in-site-content.md).

To manage the Adaptive Media Image Resolutions, see [Managing Image Resolutions](./managing-image-resolutions.md).

If you have upgraded to the latest DXP version and were using a legacy version that did not support Adaptive Media, you can migrate existing Documents and Media thumbnails to new Adaptive Media defined Image Resolutions; see [Migrating Documents and Media Thumbnails](./migrating-documents-and-media-thumbnails.md).

## Related Topics

* [Adaptive Media Configuration Reference](./adaptive-media-configuration-reference.md)
* [Adaptive Media Modules Reference](../../developer-guide/adaptive-media-modules-reference.md)

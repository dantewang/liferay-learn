---
uuid: 48c598d5-1f05-4078-8c65-f0ce19d6349d
---
# Using the Bootstrap 3 Compatibility Layer in Liferay 7.4

As of Liferay DXP 7.4 GA1, the [Bootstrap 3](https://getbootstrap.com/) compatibility layer is removed from the built-in packages in Liferay front-end applications. If you are upgrading from a previous version, you must include the compatibility layer as an external package for any of your projects that depend on Bootstrap 3 for their CSS code.

```{note}
If you use the `gulp upgrade` command to [upgrade a theme](../../../site-building/site-appearance/themes/upgrading-a-theme.md) to Liferay 7.4, you can automatically include the Bootstrap 3 compatibility layer with the upgrade. In this case, you need not add the compabitility layer manually to that theme.
```

```{warning}
We provide the Bootstrap 3 compatibility layer as an external package only to help upgrades to Liferay 7.4 GA1 go more smoothly. You should replace it as soon as possible, as it is not intended to work for later versions.
```

## Installing the Compatibility Layer

Run this command to install the compatibility layer as an external package so you can use it in your projects:

```bash
npm install @liferay/bs3-bs4-compat
```

You can also run this command to install it using Yarn:

```bash
yarn add @liferay/bs3-bs4-compat
```

Once you have the compatibility layer installed, you can use it in any project that still needs to be compatible with Bootstrap 3.

## Using the Compatibility Layer in Your Project

To use the compatibility layer, you must import it into your project's `clay.scss` file (unless it is a theme that already has it included as part of an [upgrade to 7.4](../../../site-building/site-appearance/themes/upgrading-a-theme.md)).

If you require the atlas theme variables, add this to your project's `src/css/clay.scss` file:

```css
@import 'clay/atlas';

@import '@liferay/bs3-bs4-compat/scss/variables';

@import '@liferay/bs3-bs4-compat/scss/atlas_variables';

@import '@liferay/bs3-bs4-compat/scss/components';
```

If you **do not** require the atlas theme variables, add this to your project's `src/css/clay.scss` file instead:

```css
@import 'clay/base';

@import '@liferay/bs3-bs4-compat/scss/variables';

@import '@liferay/bs3-bs4-compat/scss/components';
```

Now the Bootstrap 3 compatibility layer is included in your theme, so it works with Liferay DXP 7.4 GA1. Your next task is to change your project's code so you can remove the dependency on Bootstrap 3. 

## Additional Information

* [Upgrading a Theme](../../../site-building/site-appearance/themes/upgrading-a-theme.md)
* [Features Deprecated in 7.4](../../../installation-and-upgrades/upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-4.md#features-deprecated-in-7-4)

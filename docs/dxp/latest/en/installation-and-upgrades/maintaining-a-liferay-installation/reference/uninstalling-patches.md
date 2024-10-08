---
uuid: 662b5906-ac09-4a5c-898b-6825637789d0
taxonomy-category-names:
- DXP Self-Hosted Installation, Maintenance, and Administration
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Uninstalling Patches

> Subscribers

After you install a patch, you may decide to restore your installation to a previous patch level. Here you'll learn how to

* Uninstall Patches
* Revert (uninstall) all patches at once.

## Uninstalling a Patch

You can uninstall patches and restore your installation to a desired patch level.

1. Remove the unwanted patch from your `patches` folder.

1. Run the `./patching-tool.sh install` command to restore your installation to the patch level that the remaining patches in the remaining `patches` folder define.

Your DXP installation now has the patch level that your patches specify.

## Reverting All Patches

If you want to remove all or most of your patches, it may be easier to use the Patching Tool's `revert` command. The `revert` command removes ALL patches from the DXP installation, bringing it back to the original installed version (e.g., GA1).

1. Remove all of your patches.

    ```bash
    ./patching-tool.sh revert
    ```

    All of the patches are removed from your `patches` folder.

1. Bring your installation back up to a desired patch level by [installing the applicable patches](../patching-dxp-7-3-and-earlier/installing-patches-for-dxp-7-3-and-earlier.md).

```{tip}
It's helpful to store your patches in a convenient location in case you want to restore your installation to a particular patch level. You can always download fix packs again from the [Customer Portal](https://customer.liferay.com/downloads).
```

## Reverting a Hotfix

You can uninstall a hotfix while preserving your current Fix Pack.

```bash
./patching-tool.sh revert -hotfix
```

Any installed hotfix is removed and the current Fix Pack level is maintained.

Now you know how to restore your DXP installation by uninstalling and reverting patches.

## Related Topics

* [Installing Patches](../patching-dxp-7-3-and-earlier/installing-patches-for-dxp-7-3-and-earlier.md)
* [Understanding Patch Types](../patching-dxp-7-3-and-earlier/understanding-patch-types-for-dxp-7-3-and-earlier.md)

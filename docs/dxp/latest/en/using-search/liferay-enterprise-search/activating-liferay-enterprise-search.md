---
taxonomy-category-names:
- Search
- Liferay Enterprise Search
- Liferay Self-Hosted
- Liferay PaaS
uuid: d707078d-7914-4b2e-939f-6815445b80a6
---
# Activating Liferay Enterprise Search

Starting with Liferay DXP 7.4, the Liferay Enterprise Search (LES) applications are included out of the box. You can begin using LES right away, then purchase an LES Add-On Subscription to receive support. Start by contacting a Liferay sales representative or visit <https://www.liferay.com/contact-sales>.

LES is enabled by default and requires no additional installation steps. However, a LES add-on subscription must be purchased to receive official Liferay Support and additional benefits. Maintenance and updates to LES applications are delivered through Fix Pack and Service Pack releases. If you do not have a subscription to LES, access can be disabled completely by following these steps described below.

```{note}
[LES Search Experiences](./search-experiences.md) was added to the DXP bundle in Liferay DXP 7.4 Update 5. Search Experiences will be made available on Liferay DXP 7.3 via the Customer Portal as an add-on application.
```

## Local Bundle: Deactivating LES

LES applications are enabled by default in all Liferay DXP 7.4+ bundles. If you don't have a subscription and the accompanying license to use LES, deactivate it by setting the `enterprise.product.enterprise.search.enabled` [portal property](../../installation-and-upgrades/reference/portal-properties.md) to `false`:

```properties
enterprise.product.enterprise.search.enabled=false
```

## Docker: Deactivating LES

LES applications are enabled by default in all Liferay DXP 7.4+ Docker images. If you don't have a subscription and the accompanying license to use LES, deactivate it in one of two ways:

1. If using properties files to configure the container, deactivate it by setting the `enterprise.product.enterprise.search.enabled` [portal property](../../installation-and-upgrades/reference/portal-properties.md) to `false`:

    ```properties
    enterprise.product.enterprise.search.enabled=false
    ```

1. To instead override the portal property in an environment variable, set 

    ```properties
    LIFERAY_ENTERPRISE_PERIOD_PRODUCT_PERIOD_ENTEPRISE_PERIOD_SEARCH_PERIOD_ENABLED=false
    ```

See [Configuring Containers](../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/configuring-containers.md) for more information.

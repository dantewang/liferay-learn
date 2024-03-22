---
uuid: c397de6c-7c21-4848-ba18-9630e5f0ac06
taxonomy-category-names:
- Development and Tooling
- Core Frameworks
- Liferay Self-Hosted
- Liferay PaaS
---
# Configuration Model Listener Reference

Use model listeners in your [own configurations](../configuration-framework.md) to listen for events and execute code in response. Creating a model listener requires only three steps:

* Implement the [`ConfigurationModelListener`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/static/portal-configuration/portal-configuration-persistence-api/src/main/java/com/liferay/portal/configuration/persistence/listener/ConfigurationModelListener.java) interface
* Register the listener with the `@Component` annotation: `service = ConfigurationModelListener.class`
* Add your custom logic for what happens when the listener is triggered

See an implementation of the listener in Liferay's [`PasswordPoliciesConfigurationModelListener`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/password-policies-admin/password-policies-admin-web/src/main/java/com/liferay/password/policies/admin/web/internal/configuration/persistence/listener/PasswordPoliciesConfigurationModelListener.java).

Note these things:

* The configuration model listener will trigger and verify upon System, Instance, and Site Settings configuration changes
* The configuration model listener will trigger when the server is already started and the configuration file is deployed as the listener will be registered at that time
* The configuration model listener will NOT trigger for configuration files that are deployed to an instance *before* startup

See [Creating a Model Listener](../../../liferay-internals/extending-liferay/creating-a-model-listener.md) to learn more about model listeners.

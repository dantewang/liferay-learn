---
uuid: f6380d67-6784-46a4-8723-46fcc24177a5
---
# Configuring Virtual Instances

{bdg-secondary}`Only LXC-SM or On Premise`

You may have a business use case where you need another Liferay environment with its own set of sites, users, and organizations. Rather than spinning up a brand new server, you can create a virtual instance.

For example, Delectable Bonsai also sells maple syrup as a white label product. Other companies purchase the syrup and add their own branding to it. Delectable Bonsai runs a virtual instance to host their separate, white label side of the business.

## Virtual Instances in LXC

Contact your Liferay Cloud support person for setting up virtual instances.

## Virtual Instances in LXC-SM and On Premises

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Virtual Instances_.

1. Click _Add_ (![Add icon](../../images/icon-add.png)) and enter the following information.

   * Web ID: `www.bulkbonsaimaplesyrup.com`
   * Virtual Host: `www.bulkbonsaimaplesyrup.com`
   * Mail Domain: `bulkbonsaimaplesyrup.com`
   * Max Users: `0` (note, this means unlimited users)
   * Active: toggle on
   * Virtual Instance Initializer: select _Blank Site_.

   ![Enter the virtual instance information.](./configuring-virtual-instances/images/01.png)

   Click _Save_. Your new virtual instance ready.

1. Since this is not a real externally hosted site, add the domain to your `/etc/hosts` file of your local system.

   `127.0.0.1 www.bulkbonsaimaplesyrup.com`

   ```{note}
   If using a docker container, `--add-host bulkbonsaimaplesyrup.com:127.0.0.1` entry must be included in your run command.
   ```

1. Once the virtual instance is successfully added, navigate to `http://www.bulkbonsaimaplesyrup.com:8080/`. 

   ![The new virtual instance is ready to use.](./configuring-virtual-instances/images/02.png)

The next step is to [configure instance settings](./configuring-instance-settings.md).

## Relevant Concepts

- [Understanding Virtual Instances](https://learn.liferay.com/en/w/dxp/system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances)
- [Adding a Virtual Instance](https://learn.liferay.com/en/w/dxp/system-administration/configuring-liferay/virtual-instances/adding-a-virtual-instance)

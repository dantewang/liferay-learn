---
uuid: e22547b1-aef3-4f4c-8c8d-4a3e721ef393
---
# Creating a Site Template and Uploading Files

You'll create your site template in Clarity's internal virtual instance. If you're following along locally, this was created in the Liferay Administrator course and can be found at `http://glance.clarityvisionsolutions.com:8080`. If you haven't run through the Administrator course, follow the steps in [Configuring Virtual Instances](../../liferay-administrator/configuration/configuring-virtual-instances.md), and then come back here.

## Use the Virtual Instance

1. Navigate to `http://glance.clarityvisionsolutions.com:8080/` (the virtual instance you created in the Liferay Administrator course).

1. Log in as Kyle Klein, the instance's administrator.

   If you just created the virtual instance, it has no user accounts. Create one for Kyle Klein so he can administer this instance as well. Follow the steps in [Create an Administrator](../../liferay-administrator/users-accounts-organizations/managing-users.md#create-an-administrator) to register Kyle and make him an administrator of this instance, and then come back here.

## Create a Site Template

Once in the virtual instance, you can create a site template to be used to create other sites.

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), select the *Control Panel* tab, and click *Site Templates* under Sites.

   ![Create a site template through Site Templates in the Control Panel.](./creating-a-site-template-and-uploading-files/images/01.png)

1. Click *Add* (![Add icon](../../images/icon-add.png)) and enter the following information:

   | Field                                                                        | Information                                                                               |
   |:-----------------------------------------------------------------------------|:------------------------------------------------------------------------------------------|
   | Name                                                                         | Glance and Clarity B2B Site Template                                                              |
   | Description                                                                  | This site template is the base for the Glance intranet site and the Clarity B2B site. |
   | Active                                                                       | On                                                                                        |
   | Allow site administrators to modify pages associated with this site template | On                                                                                        |
   | Ready for Propagation                                                        | On                                                                                        |

   ![Create a site template and name it Glance and B2B Site Template.](./creating-a-site-template-and-uploading-files/images/02.png)

1. Once you create the site template, click on its *Name*. The site template opens in a new tab. You can start editing the template now.

## Import Resources

1. Download the [resources for this exercise](./liferay-h2a2.zip).

   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/web-site-manager/site-templates/liferay-h2a2.zip -O
   ```

1. Unzip the file.

   ```bash
   unzip liferay-h2a2.zip
   ```

   This .zip file includes elements that you'll use to create your site template (e.g. images, custom fragments, and custom compositions).

### Import Images

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)) and select *Content & Data* &rarr; *Documents and Media* (1).

1. At the top-right corner of the page, click *Options* (![Options icon](../../images/icon-options.png)) &rarr; *Export/Import* (2).

1. In the Export/Import modal, select the *Import* tab.

1. Click *Select File* and select the `01-glance-images.lar` file &rarr; click *Continue*.

   You can also drag and drop the file into the modal.

   ![Import the documents and media .lar file.](./creating-a-site-template-and-uploading-files/images/03.png)

1. Use the default configurations and click *Import*. Once the process is finished, close the modal.

You can use the imported images throughout the site template now.

### Import Compositions

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)) and select *Design* &rarr; *Fragments* (1).

1. Next to Fragment Sets, Click *Actions* (![Actions icon](../../images/icon-actions.png)) &rarr; *Import* (2).

   ![Import the custom compositions.](./creating-a-site-template-and-uploading-files/images/04.png)

1. Click *Select File* and select the `02-glance-compositions.zip` file &rarr; *Import*.

1. Once the process is finished, click *Done*.

You can use the custom compositions throughout the site template now.

The rest of the files will be used in future lessons.

Next, you'll [create the master page template.](./creating-the-master-page-template.md)

## Relevant Concepts

- [Virtual Instances](https://learn.liferay.com/web/guest/w/dxp/system-administration/configuring-liferay/virtual-instances)
- [Site Templates](https://learn.liferay.com/web/guest/w/dxp/site-building/sites/site-templates)
- [Documents and Media](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/documents-and-media)
- [Using Fragments](https://learn.liferay.com/web/guest/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments)
- [Saving Fragment Compositions](https://learn.liferay.com/web/guest/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/saving-fragment-compositions)

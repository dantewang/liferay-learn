# Account Users

{bdg-secondary}`Available 7.4+`

```{note}
The inviting a new user by email functionality is in Liferay DXP 7.4 U55/Liferay Portal 7.4 GA55
```

Account Users are User accounts that are associated with a Business Account or a Person Account.

## Adding a New Account User

1. Open the Global Menu (![Global Menu](../../images/icon-applications-menu.png)). Navigate to *Control Panel* &rarr; *Account Users*.

1. Click the _Add_ icon (![Add icon](../../images/icon-add.png)) to create a new Account User. 

1. Select the Account to associate with User. 

1. Fill in the necessary information for this new User.

   ![Fill in the account user's information.](./account-users/images/01.png)

   Click the *Save* button to save the new account user.

```{note}
If you are using a version before Liferay DXP 7.4 U21 or Liferay Portal 7.4 GA21, Users for Accounts can only be created within this *Account Users* interface. A regular DXP User that is created in the *Users and Organizations* interface cannot be associated with any Accounts. However, an Account User can be managed and edited from *Users and Organizations* after creation.
```

### Setting a Password for an Account User

When you create an Account User, Liferay DXP generates a password for the User, using the [mail server](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md) to send an email message with the User's new password.

If you haven't set up a mail server, set a password manually for the User.

1. In Account Users, click on the _Options_ icon (![Options icon](../../images/icon-actions.png)) of the Account User you want to edit.

1. Under the General tab, click *Password*. Set a password and click *Save*.

### Associating an Existing User to a Business Account

To associate an existing user to a Business Account,

1. Open the Global Menu (![Global Menu](../../images/icon-applications-menu.png)). Navigate to *Control Panel* &rarr; *Accounts*.

1. Click the _Options_ icon (![Options icon](../../images/icon-actions.png)) of the account you want to edit and click _Manage Users_. 

1. Click the _Add_ icon and select a user to assign to the account. 

### Associating an Existing User to a Personal Account

To associate an existing user to a Personal Account,

1. Open the Global Menu (![Global Menu](../../images/icon-applications-menu.png)). Navigate to *Control Panel* &rarr; *Accounts*.

1. Click the _Options_ icon (![Options icon](../../images/icon-actions.png)) of the account you want to edit and click _Edit_. 

1. Under the User section, click the _Assign_ button and select a user. Click the _Choose_ button.

## Inviting a New User by Email

You can invite a new user to an account by email. Liferay will send an automated invitation email to the person you specify to create a user account and be associated with an account.

1. Make sure you have already [Configured Mail](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md) for your Liferay instance.

1. Open the Global Menu (![Global Menu](../../images/icon-applications-menu.png)). Navigate to *Control Panel* &rarr; *Accounts*. 

1. Select the account you want to invite a new user to. Click the *Users* tab. 

1. Click the _Add_ icon (![Add icon](../../images/icon-add.png)) and click *Invite Users*. A new window will pop open.

1. Input the email address of the person you want to invite. Make sure to type a comma or press enter to input the email address. Input a role for this new user (e.g. Account Administrator, Buyer, Order Manager, etc.). Click *Invite*.

   ![Input an email address and role for the new user.](./account-users/images/02.png)

1. An email invitation is sent. The person can now click *Create Account* in the email to register for a new user account on the Liferay instance.

   ![The person receives an email invitation to create a new user account.](./account-users/images/03.png)

1. Upon user account creation, the new user will be associated with the account and have the assigned account role.

## Editing an Account User

1. In Account Users, click the _Options_ icon (![Options icon](../../images/icon-actions.png)) of the account user you want to edit.

1. Click *Edit* to see the Edit User page.

The following options are available in the Edit User page:

| General Tab | Description |
| :--- | :--- |
| Information | Edit or change the user's personal information. |
| Accounts | View or modify the User's associated accounts. |
| Password | Add or change the user's password. |

| Contact Tab | Description |
| :--- | :--- |
| Addresses | Add or change the user's addresses. |
| Contact Information | Add or change the user's contact information |

| Preferences Tab | Description |
| :--- | :--- |
| Alert and Announcements Delivery | Change the user's notification settings. |
| Display Settings | Change the user's time zone and greeting settings. |

## Deactivating and Deleting an Account User

Deleting an Account User is a two-step process: 

* You may decide that you want to keep the Account User after all.
* There may be user data that is tied with [legal requirements](../managing-user-data.md) you need to address. 
* You may require more time to review a User's account before deletion.

For these reasons and more you must first deactivate an Account User before deleting an Account User.

### Deactivating an Account User

Deactivating an Account User prevents the User from logging in, but still preserves the User's data and information. 

1. In Account Users, click the _Options_ icon (![Options icon](../../images/icon-actions.png)) of the account user you want to edit.

1. Click *Deactivate* and click the *OK* button to confirm your change. The Account User is now deactivated. 

To see a deactivated User, click the *Filter and Order* drop-down menu and click *Inactive* under Filter by Status. You can click a User's Options icon (![Options icon](../../images/icon-actions.png)) and click *Activate* to reactivate the User.

### Deleting an Account User

1. In Account Users, click the *Filter and Order* drop-down menu and click *Inactive* under Filter by Status.

1. Click the inactive User's _Options_ icon (![Options icon](../../images/icon-actions.png)) and click *Delete*

   ![Select the inactive user and click Delete.](./account-users/images/04.png)

1. Click *OK* on the pop-up form to confirm your decision. The Account User is now deleted.

## Impersonating an Account User

You can impersonate Account Users to view the system as they would see it. This can be used to diagnose permission issues an administrator can't see, such as making sure a User doesn't have access to restricted data. Only Users with this permission can impersonate a different User.

1. In Account Users, click the Account User's _Options_ icon (![Options icon](../../images/icon-actions.png)).

2. Click *Impersonate User* and a new window opens with you logged in as that Account User.

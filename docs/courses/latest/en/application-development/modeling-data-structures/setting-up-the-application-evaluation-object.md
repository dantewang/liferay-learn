---
uuid: 96743fbb-e0d1-487d-92a4-5e03b21b9dec
---
# Setting Up the Application Evaluation Object

When reviewing applications, Delectable Bonsai must store evaluation notes for each distributor application they receive. To achieve this, the Delectable Bonsai development team created an Application Evaluation object and added the necessary fields.

![Import the Application Evaluation object](./setting-up-the-application-evaluation-object/images/01.png)

They created this object definition in a separate environment, but they exported it as JSON so you can import it to your environment with the Distributor Application object.

Here you'll use this JSON file to import the Application Evaluation object into your Liferay instance. But first, create the object's picklists using the `headless-admin-list-type` REST APIs. <!--TASK: Use the batch client extension instead. This way you can add the lists and objects.-->

## Creating the Picklists

The Application Evaluation object requires these picklists: Assessment Scores, Recommendations, and Decisions.

1. Download and unzip the resources for [this exercise](./liferay-w1m9.zip):

   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/application-development/modeling-data-structures/liferay-w1m9.zip -O
   ```

   ```bash
   unzip liferay-w1m9.zip
   ```

1. Navigate to the `curl` folder in the `liferay-w1m9` folder:

   ```bash
   cd liferay-w1m9/curl
   ```

1. Run this command to create three picklists for the Application Evaluation object:

   ```bash
   ./ListTypeDefinition_POST_ToInstance.sh
   ```

1. Verify the picklists appear.

   ![Verify the picklists appear.](./setting-up-the-application-evaluation-object/images/02.png)

With the picklists in place, you can import the Application Evaluation object.

## Importing the Application Evaluation Object

1. Open the *Global Menu* ( ![Global Menu](../../images/icon-applications-menu.png) ), go to the *Control Panel* tab, and click *Objects*.

1. Click *Actions* ( ![Actions Button](../../images/icon-actions.png) ) in the Application Bar and select *Import*.

1. Enter these details and click *Import*.

   | Field | Value |
   | :--- | :--- |
   | Name | `ApplicationEvaluation` |
   | JSON File | `Object_ApplicationEvaluation.json` |

   The Application Evaluation JSON file is in the `liferay-w1m9` folder. This file includes the object's basic schema, including general configurations and custom fields.

   ![Import the Object_ApplicationEvaluation.json file.](./setting-up-the-application-evaluation-object/images/03.png)

1. Begin editing the object definition.

   ![Begin editing the object definition.](./setting-up-the-application-evaluation-object/images/04.png)

1. Verify the object includes these custom fields:

   * Business Name
   * Assessment Score
   * Attachment
   * Decision
   * Interview Notes
   * Recommendation Comments
   * Recommendations

   ![Verify the object includes these custom fields.](./setting-up-the-application-evaluation-object/images/05.png)

1. Go to the *Details* tab.

1. Click *Publish*.

Great! Delectable Bonsai can use this object to store notes on prospective distributors.

Now you can define a relationship between the Distributor Application and Application Evaluation objects so you can link their entries.

Next: [Adding a Relationship Between the Object Definitions](./adding-a-relationship-between-the-object-definitions.md)

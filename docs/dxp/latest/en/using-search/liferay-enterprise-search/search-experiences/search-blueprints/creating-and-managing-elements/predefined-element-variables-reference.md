---
uuid: 496a6651-e3f5-4ff2-8754-6362d84e366a
---
# Predefined Element Variables Reference

To add a predefined variable to the element in the Element Source editor, place the cursor where the variable will be, then click on the variable in the left hand sidebar to have it inserted. In the Custom JSON Element you must type the variable directly into the editor. The syntax for each variable appears in the table below.

| Variable | Type: Definition | Syntax |
| :--- | :--- | :--- |
| | <a href="#context" id="context">**CONTEXT**</a> | |
| Company ID | Number: Return the company ID of the current instance| `${context.company_id}` |
| Is Staging Group | Boolean: Return whether the current site is staged | `${context.is_staging_group}` |
| Language | Text: Return the 2-letter code for the current language (e.g., `en`) | `${context.language}` |
| Language ID | Text: Return the 4-letter language code (e.g., `en_US`) of the current language | `${context.language_id}` |
| Layout Name Localized | Text: Return the localized name of the page | `${context.layout-name-localized}` |
| Page Layout ID | Number: Return the ID of the page | `${context.plid}` |
| Publication ID | Number: Return the publication ID | `${context.publication_id}` |
| Scope Group ID | Return the current site's ID | `${context.scope_group_id}` |
| | <a href="#time" id="time">**TIME**</a> | |
| Current Date | Date: Return the current date | `${time.current_date}` |
| Current Day of Month | Number: Return the day of the month | `${time.current_day_of_month}` |
| Current Day of Week | Number: Return the day of the week (_1 = Monday_) | `${time.current_day_of_week}` |
| Current Day of Year | Number: Return the day of the year | `${time.current_day_of_year}` |
| Current Hour | Number: Return the current hour | `${time.current_hour}` |
| Current Year | Number: Return the current year | `${time.current_year}` |
| Time of Day | Time: Return the time | `${time.time_of_day}` |
| Time Zone Name Localized | Text: Return the time zone, localized for the locale | `${time.time_zone_name_localized}` |
| | <a href="#user" id="user">**USER**</a> | |
| Active Segment Entry IDs | Number: Return the user's segment IDs | `${user.active_segment_entry_ids}` |
| Age | Number: Return the user's age in number of years | `${user.age}` |
| Asset Category Ids {bdg-secondary}`7.4 U41+` | Number: Return the IDs of the user's categories | `${user.asset_category_ids}` |
| Asset Tag Names {bdg-secondary}`7.4 U41+` | Text: Return the user's tags | `${user.asset_tag_names}` |
| Birthday | Date: Return the user's birth date | `${user.birthday}` |
| Create Date | Date: Return the date when the user account was created in Liferay | `${user.create_date}` |
| Current Site Role IDs | Number: Return the user's site role IDs | `${user.current_site_role_ids}` |
| Email Domain | Text: Return the user's email domain | `${user.email_domain}` |
| First Name | Text: Return the user's first name | `${user.first_name}` |
| Full Name | Text: Return the user's full name | `${user.full_name}` |
| Group IDs | Number: Return the IDs of sites the user is a member of | `${user.group_ids}` |
| User ID | Number: Return the user's ID | `${user.id}` |
| Is Female | Boolean: Return true if the user is female | `${user.is_female}` |
| Is Gender X | Boolean: Return true if the user is gender X | `${user.is_gender_x}` |
| Is Male | Boolean: Return true if the user is male | `${user.is_male}` |
| Is Omniadmin | Boolean: Return true if the user is the Omni Admin user (the default user of the default instance) | `${user.is_omniadmin}` |
| Is Signed In | Boolean: Return true if the user is signed in | `${user.is_signed_in}` |
| Job Title | Text: Return the user's job title | `${user.job_title}` |
| Language ID | Text: Return the user's language code (e.g., `en_US`) | `${user.language_id}` |
| Last Name | Text: Return the user's last name | `${user.last_name}` |
| Parent Asset Category Ids {bdg-secondary}`7.4 U41+` | Number: Return the IDs of all the parent categories of the user's categories | `${user.parent_asset_category_ids}` |
| Regular Role IDs | Number: Return the role IDs for the user's regular roles | `${user.regular_role_ids}` |
| User group IDs | Number: Return the IDs of the user groups that the user is part of | `${user.user_group_ids}` |
| | <a href="#conditional-elements" id="conditional-elements">**CONDITIONAL ELEMENTS**\*</a> | |
| IP Stack City | Text: Return the city where the searching IP address originates | `${ipstack.city}` |
| IP Stack Continent Code | Text: Return the continent code (e.g., NA for North America) where the searching IP address originates | `${ipstack.continent_code}` |
| IP Stack Continent Name | Text: Return the continent name | `${ipstack.continent_name}` |
| IP Stack Country Code | Text: Return the country code (e.g., US for United States)  | `${ipstack.country_code}` |
| IP Stack Country Name | Text: Return the country name | `${ipstack.country_name}` |
| IP Stack Latitude | Number: Return the latitude in decimal degrees | `${ipstack.latitude}` |
| IP Stack Longitude | Number: Return the longitude in decimal degrees | `${ipstack.longitude}` |
| IP Stack Region Code | Text: Return the region code (e.g., CA for California) | `${ipstack.region_code}` |
| IP Stack Region Name | Text: Return the region name | `${ipstack.region_name}` |
| IP Stack Zip Code | Number: Return the zip code | `${ipstack.zip}` |
| Open Weather Map Temperature | Number: Return the temperature | `${openweathermap.temp}` |
| Open Weather Map Weather Description | Text: Return a description of the weather (e.g., "clear sky") | `${openweathermap.weather_description}` |
| Open Weather Map Weather ID | Number: Return the [ID corresponding to the weather description](https://openweathermap.org/weather-conditions#Weather-Condition-Codes-2) | `${openweathermap.weather_id}` |
| Open Weather Map Main Label| Text: Return the [primary identifier for the weather (e.g., Rain; this is the Main field in OpenWeatherMap's API response](https://openweathermap.org/weather-conditions#Weather-Condition-Codes-2), according to the weather ID | `${openweathermap.weather_main}` |
| Open Weather Map Wind Speed | Number: Return the wind speed in km/h | `${openweathermap.wind_speed}` |
| User Custom Fields **\*\*** | Return the value of a user custom field | `user.custom.field.[name]` |

**\*** [Activate Liferay Commerce](https://learn.liferay.com/commerce/latest/en/installation-and-upgrades/activating-liferay-commerce-enterprise.html) to access the Commerce-specific variables.

**\*** Access ipstack and OpenWeatherMap variables by first enabling each service. Visit System or Instance Settings &rarr; Platform &rarr; Search Experiences. Click the Enabled checkbox and save the configuration for the service you're configuring. Note that the OpenWeatherMap service depends on the ipstack service being enabled. See [Personalizing the Search Experience](../personalizing-the-search-experience.md) for an example using the ipstack service.

**\*\*** In addition to these out-of-the-box variables, [Custom Fields](../../../../../system-administration/configuring-liferay/adding-custom-fields.md) on the user entity can also be referenced as variables in the element. For example, a user custom field with the name _Employee_ is referenced in an element with `user.custom.field.employee`.

## Additional Information

- [Creating Elements](./creating-elements.md)
- [Search Blueprints Configuration Reference](../search-blueprints-configuration-reference.md)
- [Managing Elements](./managing-elements.md)

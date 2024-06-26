curl \
	"http://localhost:8080/o/headless-admin-list-type/v1.0/list-type-definitions" \
	--data-raw '
		{
			"externalReferenceCode": "LIST_DISTRIBUTION_REGIONS",
			"listTypeEntries": [
				{
					"externalReferenceCode": "REGION_LATIN_AMERICA",
					"key": "latinAmerica",
					"name": "Latin America",
					"name_i18n": {
						"en-US": "Latin America"
					},
					"type": ""
				},
				{
					"externalReferenceCode": "REGION_CARIBBEAN",
					"key": "caribbean",
					"name": "Caribbean",
					"name_i18n": {
						"en-US": "Caribbean"
					},
					"type": ""
				},
				{
					"externalReferenceCode": "REGION_EASTERN_EUROPE",
					"key": "easternEurope",
					"name": "Eastern Europe",
					"name_i18n": {
						"en-US": "Eastern Europe"
					},
					"type": ""
				},
				{
					"externalReferenceCode": "REGION_WESTERN_EUROPE",
					"key": "westernEurope",
					"name": "Western Europe",
					"name_i18n": {
						"en-US": "Western Europe"
					},
					"type": ""
				},
				{
					"externalReferenceCode": "REGION_MIDDLE_EAST",
					"key": "middleEast",
					"name": "Middle East",
					"name_i18n": {
						"en-US": "Middle East"
					},
					"type": ""
				},
				{
					"externalReferenceCode": "REGION_AFRICA",
					"key": "africa",
					"name": "Africa",
					"name_i18n": {
						"en-US": "Africa"
					},
					"type": ""
				},
				{
					"externalReferenceCode": "REGION_CENTRAL_ASIA",
					"key": "centralAsia",
					"name": "Central Asia",
					"name_i18n": {
						"en-US": "Central Asia"
					},
					"type": ""
				},
				{
					"externalReferenceCode": "REGION_ASIA_PACIFIC_RIM",
					"key": "asiaPacificRim",
					"name": "Asia and Pacific Rim",
					"name_i18n": {
						"en-US": "Asia & Pacific Rim"
					},
					"type": ""
				},
				{
					"externalReferenceCode": "REGION_INDIA",
					"key": "india",
					"name": "India",
					"name_i18n": {
						"en-US": "India"
					},
					"type": ""
				},
				{
					"externalReferenceCode": "REGION_NORTH_AMERICA",
					"key": "northAmerica",
					"name": "North America",
					"name_i18n": {
						"en-US": "North America"
					},
					"type": ""
				}
			],
			"name": "Distribution Regions",
			"name_i18n": {
				"en-US": "Distribution Regions"
			}
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"


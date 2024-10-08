curl \
	"http://localhost:8080/o/headless-admin-list-type/v1.0/list-type-definitions" \
	--data-raw '
		{
			"externalReferenceCode": "LIST_PRODUCT_TYPES",
			"listTypeEntries": [
				{
				"externalReferenceCode": "PRODUCT_TYPE_MAPLE_SYRUP",
				"key": "mapleSyrup",
				"name": "Maple Syrup",
				"name_i18n": {
					"en-US": "Maple Syrup"
				},
				"type": ""
				},
				{
				"externalReferenceCode": "PRODUCT_TYPE_ORGANIC_MAPLE_SYRUP",
				"key": "organicMapleSyrup",
				"name": "Organic Maple Syrup",
				"name_i18n": {
					"en-US": "Organic Maple Syrup"
				},
				"type": ""
				},
				{
				"externalReferenceCode": "PRODUCT_TYPE_MAPLE_BUTTER",
				"key": "mapleButter",
				"name": "Maple Butter",
				"name_i18n": {
					"en-US": "Maple Butter"
				},
				"type": ""
				},
				{
				"externalReferenceCode": "PRODUCT_TYPE_MAPLE_SUGAR",
				"key": "mapleSugar",
				"name": "Maple Sugar",
				"name_i18n": {
					"en-US": "Maple Sugar"
				},
				"type": ""
				},
				{
				"externalReferenceCode": "PRODUCT_TYPE_MAPLE_FONDANT",
				"key": "mapleFondant",
				"name": "Maple Fondant",
				"name_i18n": {
					"en-US": "Maple Fondant"
				},
				"type": ""
				},
				{
				"externalReferenceCode": "PRODUCT_TYPE_MAPLE_JELLY",
				"key": "mapleJelly",
				"name": "Maple Jelly",
				"name_i18n": {
					"en-US": "Maple Jelly"
				},
				"type": ""
				},
				{
				"externalReferenceCode": "PRODUCT_TYPE_TREES",
				"key": "trees",
				"name": "Trees",
				"name_i18n": {
					"en-US": "Trees"
				},
				"type": ""
				},
				{
				"externalReferenceCode": "PRODUCT_TYPE_SAPLINGS",
				"key": "saplings",
				"name": "Saplings",
				"name_i18n": {
					"en-US": "Saplings"
				},
				"type": ""
				},
				{
				"externalReferenceCode": "PRODUCT_TYPE_EDUCATIONAL_CONTENT",
				"key": "educationalContent",
				"name": "Educational Content",
				"name_i18n": {
					"en-US": "Educational Content"
				},
				"type": ""
				},
				{
				"externalReferenceCode": "PRODUCT_TYPE_OTHER",
				"key": "other",
				"name": "Other",
				"name_i18n": {
					"en-US": "Other"
				},
				"type": ""
				}
			],
			"name": "Product Types",
			"name_i18n": {
				"en-US": "Product Types"
			}
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"
# Adds Layout to Application Evaluation
curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_APPLICATION_EVALUATION/object-layouts" \
	--data-raw '
		{
			"defaultObjectLayout": true,
			"name": {
				"en_US": "Layout with Relationship Field"
			},
			"objectDefinitionExternalReferenceCode": "C_APPLICATION_EVALUATION",
			"objectLayoutTabs": [
				{
				"name": {
					"en_US": "Review"
				},
				"objectLayoutBoxes": [
					{
					"collapsable": true,
					"name": {
						"en_US": "General Details"
					},
					"objectLayoutRows": [
						{
						"objectLayoutColumns": [
							{
							"objectFieldName": "r_applicationToEvaluations_c_distributorApplicationId",
							"priority": 0,
							"size": 6
							}
						],
						"priority": 0
						},
						{
						"objectLayoutColumns": [
							{
							"objectFieldName": "interviewNotes",
							"priority": 0,
							"size": 12
							}
						],
						"priority": 0
						},
						{
						"objectLayoutColumns": [
							{
							"objectFieldName": "attachment",
							"priority": 0,
							"size": 12
							}
						],
						"priority": 0
						}
					],
					"priority": 0,
					"type": "regular"
					},
					{
					"collapsable": true,
					"name": {
						"en_US": "Assessment"
					},
					"objectLayoutRows": [
						{
						"objectLayoutColumns": [
							{
							"objectFieldName": "recommendations",
							"priority": 0,
							"size": 12
							}
						],
						"priority": 0
						},
						{
						"objectLayoutColumns": [
							{
							"objectFieldName": "recommendationComments",
							"priority": 0,
							"size": 12
							}
						],
						"priority": 0
						},
						{
						"objectLayoutColumns": [
							{
							"objectFieldName": "assessmentScore",
							"priority": 0,
							"size": 6
							}
						],
						"priority": 0
						}
					],
					"priority": 0,
					"type": "regular"
					},
					{
					"collapsable": true,
					"name": {
						"en_US": "Resolution"
					},
					"objectLayoutRows": [
						{
						"objectLayoutColumns": [
							{
							"objectFieldName": "decision",
							"priority": 0,
							"size": 6
							}
						],
						"priority": 0
						}
					],
					"priority": 0,
					"type": "regular"
					}
				],
				"objectRelationshipId": 0,
				"priority": 0
				}
			]
		}'\
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"
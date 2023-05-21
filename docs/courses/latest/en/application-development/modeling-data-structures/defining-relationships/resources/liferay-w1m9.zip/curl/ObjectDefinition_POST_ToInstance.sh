# Application Evaulation Notes Definition
curl \
  -H "Content-Type: application/json" \
  -X POST \
  "http://localhost:8080/o/object-admin/v1.0/object-definitions" \
  -d "{\"enableComments\":true,\"objectRelationships\":[],\"enableCategorization\":true,\"accountEntryRestrictedObjectFieldName\":\"\",\"objectActions\":[],\"accountEntryRestricted\":false,\"externalReferenceCode\":\"C_APPLICATION_EVALUATION\",\"objectFields\":[{\"listTypeDefinitionExternalReferenceCode\":\"LIST_ASSESSMENT_SCORES\",\"indexed\":true,\"objectFieldSettings\":[],\"DBType\":\"String\",\"label\":{\"en_US\":\"Assessment Score\"},\"type\":\"String\",\"required\":false,\"externalReferenceCode\":\"6fc38ca2-8aea-0701-b8e5-1b19dda48d7a\",\"indexedAsKeyword\":false,\"system\":false,\"indexedLanguageId\":\"en_US\",\"name\":\"assessmentScore\",\"state\":false,\"businessType\":\"Picklist\"},{\"indexed\":true,\"objectFieldSettings\":[{\"name\":\"acceptedFileExtensions\",\"value\":\"jpeg, jpg, pdf, png\"},{\"name\":\"maximumFileSize\",\"value\":100},{\"name\":\"fileSource\",\"value\":\"userComputer\"},{\"name\":\"showFilesInDocumentsAndMedia\",\"value\":false}],\"DBType\":\"Long\",\"label\":{\"en_US\":\"Attachment\"},\"type\":\"Long\",\"required\":false,\"externalReferenceCode\":\"29a699a6-d6ab-a28a-6f09-138ec8230c41\",\"indexedAsKeyword\":false,\"system\":false,\"indexedLanguageId\":\"en_US\",\"name\":\"attachment\",\"state\":false,\"businessType\":\"Attachment\"},{\"indexed\":false,\"objectFieldSettings\":[],\"DBType\":\"Date\",\"label\":{\"en_US\":\"Create Date\"},\"type\":\"Date\",\"required\":false,\"externalReferenceCode\":\"5242e9b6-05f4-52db-80b0-d58055dc96f2\",\"indexedAsKeyword\":false,\"system\":true,\"indexedLanguageId\":\"\",\"name\":\"createDate\",\"state\":false,\"businessType\":\"Date\"},{\"indexed\":false,\"objectFieldSettings\":[],\"DBType\":\"String\",\"label\":{\"en_US\":\"Author\"},\"type\":\"String\",\"required\":false,\"externalReferenceCode\":\"0302d2f2-9d34-1e2e-64eb-473512b226de\",\"indexedAsKeyword\":false,\"system\":true,\"indexedLanguageId\":\"\",\"name\":\"creator\",\"state\":false,\"businessType\":\"Text\"},{\"listTypeDefinitionExternalReferenceCode\":\"LIST_DECISIONS\",\"indexed\":true,\"objectFieldSettings\":[],\"DBType\":\"String\",\"label\":{\"en_US\":\"Decision\"},\"type\":\"String\",\"required\":false,\"externalReferenceCode\":\"c73113af-8fac-8932-f7c6-f62a396fd4b6\",\"indexedAsKeyword\":false,\"system\":false,\"indexedLanguageId\":\"en_US\",\"name\":\"decision\",\"state\":false,\"businessType\":\"Picklist\"},{\"indexed\":false,\"objectFieldSettings\":[],\"DBType\":\"String\",\"label\":{\"en_US\":\"External Reference Code\"},\"type\":\"String\",\"required\":false,\"externalReferenceCode\":\"2c822bdb-8886-5de1-4fde-5073b7d71cf9\",\"indexedAsKeyword\":false,\"system\":true,\"indexedLanguageId\":\"\",\"name\":\"externalReferenceCode\",\"state\":false,\"businessType\":\"Text\"},{\"indexed\":true,\"objectFieldSettings\":[],\"DBType\":\"Long\",\"label\":{\"en_US\":\"ID\"},\"type\":\"Long\",\"required\":false,\"externalReferenceCode\":\"fe0383a2-3b99-3a37-f264-541151c2046b\",\"indexedAsKeyword\":true,\"system\":true,\"indexedLanguageId\":\"\",\"name\":\"id\",\"state\":false,\"businessType\":\"LongInteger\"},{\"indexed\":true,\"objectFieldSettings\":[],\"DBType\":\"Clob\",\"label\":{\"en_US\":\"Interview Notes\"},\"type\":\"Clob\",\"required\":false,\"externalReferenceCode\":\"d9fe49fb-1c11-5b71-3161-51a2e75be8ce\",\"indexedAsKeyword\":false,\"system\":false,\"indexedLanguageId\":\"en_US\",\"name\":\"interviewNotes\",\"state\":false,\"businessType\":\"RichText\"},{\"indexed\":false,\"objectFieldSettings\":[],\"DBType\":\"Date\",\"label\":{\"en_US\":\"Modified Date\"},\"type\":\"Date\",\"required\":false,\"externalReferenceCode\":\"e9de5131-8eb8-a07c-58eb-ed69d415bd0f\",\"indexedAsKeyword\":false,\"system\":true,\"indexedLanguageId\":\"\",\"name\":\"modifiedDate\",\"state\":false,\"businessType\":\"Date\"},{\"indexed\":true,\"objectFieldSettings\":[],\"DBType\":\"Clob\",\"label\":{\"en_US\":\"Recommendation Comments\"},\"type\":\"Clob\",\"required\":false,\"externalReferenceCode\":\"0fa05880-0140-2816-f957-f5ba1da5b1ba\",\"indexedAsKeyword\":false,\"system\":false,\"indexedLanguageId\":\"en_US\",\"name\":\"recommendationComments\",\"state\":false,\"businessType\":\"RichText\"},{\"listTypeDefinitionExternalReferenceCode\":\"LIST_RECOMMENDATIONS\",\"indexed\":true,\"objectFieldSettings\":[],\"DBType\":\"String\",\"label\":{\"en_US\":\"Recommendations\"},\"type\":\"String\",\"required\":false,\"externalReferenceCode\":\"2fa1abfe-020e-9fa1-369e-4caab86ee1f3\",\"indexedAsKeyword\":false,\"system\":false,\"indexedLanguageId\":\"en_US\",\"name\":\"recommendations\",\"state\":false,\"businessType\":\"MultiselectPicklist\"},{\"indexed\":false,\"objectFieldSettings\":[],\"DBType\":\"String\",\"label\":{\"en_US\":\"Status\"},\"type\":\"String\",\"required\":false,\"externalReferenceCode\":\"37eb142f-d57c-34f7-435f-52081a2d079b\",\"indexedAsKeyword\":false,\"system\":true,\"indexedLanguageId\":\"\",\"name\":\"status\",\"state\":false,\"businessType\":\"Text\"}],\"restContextPath\":\"/o/c/applicationevaluations\",\"scope\":\"company\",\"portlet\":true,\"parameterRequired\":false,\"enableObjectEntryHistory\":false,\"titleObjectFieldName\":\"id\",\"objectValidationRules\":[],\"active\":false,\"defaultLanguageId\":\"en_US\",\"label\":{\"en_US\":\"Application Evaluation\"},\"panelCategoryKey\":\"control_panel.object\",\"pluralLabel\":{\"en_US\":\"Application Evaluations\"},\"objectLayouts\":[],\"system\":false,\"objectViews\":[],\"name\":\"ApplicationEvaluation\",\"actions\":{\"permissions\":{},\"get\":{},\"publish\":{},\"update\":{},\"delete\":{}},\"status\":{\"label_i18n\":\"Draft\",\"code\":2,\"label\":\"draft\"}}"\
  -u "test@liferay.com:learn"

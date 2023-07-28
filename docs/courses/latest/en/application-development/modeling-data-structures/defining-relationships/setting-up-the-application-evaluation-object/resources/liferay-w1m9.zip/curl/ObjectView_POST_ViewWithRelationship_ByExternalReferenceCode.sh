# Adds View to Application Evaluation
curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_APPLICATION_EVALUATION/object-views" \
   -d "{\"defaultObjectView\":false,\"name\":{\"en_US\":\"View with Relationship\"},\"objectDefinitionExternalReferenceCode\":\"C_APPLICATION_EVALUATION\",\"objectViewColumns\":[{\"label\":{\"en_US\":\"ID\"},\"objectFieldName\":\"id\",\"priority\":0},{\"label\":{\"en_US\":\"Distributor Application\"},\"objectFieldName\":\"r_applicationToEvaluations_c_distributorApplicationId\",\"priority\":1},{\"label\":{\"en_US\":\"Author\"},\"objectFieldName\":\"creator\",\"priority\":2},{\"label\":{\"en_US\":\"Assessment Score\"},\"objectFieldName\":\"assessmentScore\",\"priority\":3},{\"label\":{\"en_US\":\"Decision\"},\"objectFieldName\":\"decision\",\"priority\":4},{\"label\":{\"en_US\":\"Create Date\"},\"objectFieldName\":\"createDate\",\"priority\":5},{\"label\":{\"en_US\":\"Modified Date\"},\"objectFieldName\":\"modifiedDate\",\"priority\":6}],\"objectViewFilterColumns\":[],\"objectViewSortColumns\":[]}" \
   -u "test@liferay.com:learn"
curl \
	 -H "Content-Type: application/json" \
	 -X "PATCH" \
	 "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/specifications/${1}" \
	 -d "{\"key\": \"bar\", \"title\": {\"en_US\": \"Bar\"}}" \
	 -u "test@liferay.com:learn"
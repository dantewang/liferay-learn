curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/accounts/${1}/user-accounts" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"alternateName\": \"Dog\", \"emailAddress\": \"dog@liferay.com\", \"familyName\": \"Easy\", \"givenName\": \"Dog\"}" \
	-u "test@liferay.com:learn"
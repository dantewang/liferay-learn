curl \
	-H "Content-Type: application/json" \
	-X "PATCH" \
	"http://localhost:8080/o/headless-admin-address/v1.0/countries/${1}" \
	-d "{\"name\": \"Bar\"}" \
	-u "test@liferay.com:learn"
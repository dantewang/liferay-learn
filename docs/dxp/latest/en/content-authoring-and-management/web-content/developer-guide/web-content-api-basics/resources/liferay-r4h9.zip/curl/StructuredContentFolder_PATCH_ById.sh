curl \
	"http://localhost:8080/o/headless-delivery/v1.0/structured-content-folders/${1}" \
	-H "Content-Type: application/json" \
	-X "PATCH" \
	-d "{\"description\": \"Bar\"}" \
	-u "test@liferay.com:learn"
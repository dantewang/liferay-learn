curl \
	-H "Content-Type: application/json" \
	-X "PUT" \
	"http://localhost:8080/o/headless-delivery/v1.0/knowledge-base-folders/${1}" \
	-d "{\"description\": \"Goo\", \"name\": \"Baker\"}" \
	-u "test@liferay.com:learn"
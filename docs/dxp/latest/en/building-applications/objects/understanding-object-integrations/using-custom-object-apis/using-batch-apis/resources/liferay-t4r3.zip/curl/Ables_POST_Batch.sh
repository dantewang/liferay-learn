curl \
	"http://localhost:8080/o/c/ables/batch" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "[{\"name\": \"Able 1\"}, {\"name\": \"Able 2\"}, {\"name\": \"Able 3\"}]" \
	-u "test@liferay.com:learn"
curl \
	"http://localhost:8080/o/headless-delivery/v1.0/message-board-sections/${1}" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-d "{\"description\": \"Goo\", \"title\": \"Baker Section\"}" \
	-u "test@liferay.com:learn"
curl \
	"http://localhost:8080/o/headless-delivery/v1.0/wiki-pages/${1}" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-d "{\"content\": \"Bar\", \"encodingFormat\": \"text/x-wiki\", \"headline\": \"Baker Page\"}" \
	-u "test@liferay.com:learn"
curl \
	"http://localhost:8080/o/headless-delivery/v1.0/wiki-pages/${1}/wiki-pages" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"content\": \"Foo\", \"encodingFormat\": \"text/x-wiki\", \"headline\": \"Charlie Page\"}" \
	-u "test@liferay.com:learn"
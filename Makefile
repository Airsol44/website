clean:
	find . -not \( -name "Makefile" -or -path "./.git*" -or -path "./static*" \) -delete
	cp -R static/* ./


HUB_ACCOUNT=yinglilu
NAME=dcm4che
VERSION = 0.3

FULL_NAME=${HUB_ACCOUNT}/${NAME}:${VERSION}

build: 
	docker build -t $(NAME) --rm .

tag:
	docker tag ${NAME} ${FULL_NAME}

run:
	docker run --rm -it ${NAME} findscu -h

push:
	docker login
	docker push ${FULL_NAME}

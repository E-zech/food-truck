FROM alpine:3.11

WORKDIR /flask-app

RUN apk add --no-cache \
    python2 \
    py2-pip \
    nodejs \
    npm

COPY flask-app /flask-app

RUN npm install 
RUN npm run build

RUN pip2 install -r requirements.txt

EXPOSE 5000

ENTRYPOINT ["python2", "app.py"]
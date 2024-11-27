[![Codacy Badge](https://api.codacy.com/project/badge/Grade/b26668c721c44a149e230326ab2758d1)](https://app.codacy.com/manual/wilson.forero/django-api?utm_source=github.com&utm_medium=referral&utm_content=wjfatuan/django-api&utm_campaign=Badge_Grade_Settings)
[![Codacy Badge](https://app.codacy.com/project/badge/Coverage/5a7dd6be6f954cca8d94a7cd855db5a8)](https://www.codacy.com/manual/wilson.forero/django-api/dashboard?utm_source=github.com&utm_medium=referral&utm_content=wjfatuan/django-api&utm_campaign=Badge_Coverage)

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/softeng-fis-uan/django-api)

# Sample application

This is a sample application exposing a generic API to store data in a JSON field. Data has an id and a name that cab be used to categorize the data you are storing. this can be used to store any JSON data in a simple way.

This application has been built with Django 3 and DRF and is intended to be used as example in laboratories where we need to store data using a RestFul API.

## Install

1. Run `pipenv install` to install dependencies under a new virtualenv.

2. Open a shell in thenew virtualenv using `pipenv shell`.

3. Create the database using `python app/manage.py migrate`.

4. Start the server using `python app/manage.py runserver`.

## Using Docker

Build the Docker image using the command 

```bash
docker build -t django-api:latest .
```

and start a new container using the command:

```bash
docker run -d -p 8000:8000 django-api 
```

you should now be able to access the app in the port 8000.


## API Usage

This API allow the storage of a JSON payload including a name and a key, e.g.

```json
{
    "id": 20,
    "name": "my data",
    "data": ["here you can include whatever you want as a JSON"]
}
```

To store data use a POST method like

```bash
curl -X POST -H 'Content-Type: application/json' \
     -d '{"name":"my_data","data":[]}' \
     https://server/api/1.0/data/
```

To get all data available use a GET method like

```bash
curl -X GET -H 'Accept: application/json; indent=2' \
     https://server/api/1.0/data/
```

To get a specific register use a GET method including the respective id, like

```bash
curl -X GET -H 'Accept: application/json; indent=2' \
     https://server/api/1.0/data/1/
```

You can also update your data using 

```bash
curl -X PATCH -H 'Content-Type: application/json' \
     -d '{"name":"my_data","data":{"a":"b"}}' \
     https://server/api/1.0/data/3/
```

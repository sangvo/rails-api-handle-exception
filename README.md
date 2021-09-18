# Rails handle exception

## Success response with data and meta
```json
{
   "success":true,
   "data":[
      {
         "id":1,
         "name":"Sang",
         "email":"sangvo.dev+1@gmail.com",
         "password":null,
         "created_at":"2021-09-05T05:10:03.921Z",
         "updated_at":"2021-09-05T05:10:03.921Z"
      },
      {
         "id":2,
         "name":"saaa",
         "email":"sangvo.dev+2@gmail.com",
         "password":null,
         "created_at":"2021-09-05T09:33:26.013Z",
         "updated_at":"2021-09-05T09:33:26.013Z"
      },
      {
         "id":3,
         "name":"saaa",
         "email":"sangvo.dev+3@gmail.com",
         "password":null,
         "created_at":"2021-09-05T09:33:27.008Z",
         "updated_at":"2021-09-05T09:33:27.008Z"
      },
      ...
   ],
   "meta":{
      "count":25,
      "page":1,
      "items":10,
      "pages":3
   }
}
```
## Success with data end message
```json
{
  "success":true,
  "data":{
    "id":4,
    "name":"saaa",
    "email":"sangvo.dev@gmail.com",
    "password":null,
    "created_at":"2021-09-05T09:33:27.544Z",
    "updated_at":"2021-09-05T09:33:27.544Z"
  }
}
```
## Success only message
```json
{
  "success":true,
  "message":"Created successfully!"
}
```
# Exception errors
## Not found
```json
{
  "success":false,
  "errors":[
    {
      "code":1000,
      "message":"User not found"
    }
  ]
}
```
## Validations
```json
{
  "success": false,
  "errors": [
    {
      "resource": "User",
      "field": "name",
      "code": 103,
      "message": "Name can't be blank"
    },
    {
      "resource": "User",
      "field": "email",
      "code": 103,
      "message": "Email can't be blank"
    }
  ]
}
```

## Exception custom
```json
{
  "success":false,
  "errors":[
    {
      "code":1001,
      "message":"Opps... Unexpected error. Easy"
    }
  ]
}
```

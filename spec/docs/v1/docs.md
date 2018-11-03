

# Group Projects


## Projects [/projects]


### Get projects [GET /api/projects]


+ Request gets a projects
**GET**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NDEzNDY4MDR9.fC39g000THIBoEUnEsjkSiHp04NkTd9RMMSW0h_-wAc
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 1,
                "title": "sit",
                "created_at": "2018-11-03T15:53:24.865Z",
                "updated_at": "2018-11-03T15:53:24.865Z",
                "tasks": [
            
                ]
              },
              {
                "id": 2,
                "title": "exercitationem",
                "created_at": "2018-11-03T15:53:24.870Z",
                "updated_at": "2018-11-03T15:53:24.870Z",
                "tasks": [
            
                ]
              },
              {
                "id": 3,
                "title": "magni",
                "created_at": "2018-11-03T15:53:24.873Z",
                "updated_at": "2018-11-03T15:53:24.873Z",
                "tasks": [
            
                ]
              },
              {
                "id": 4,
                "title": "vero",
                "created_at": "2018-11-03T15:53:24.876Z",
                "updated_at": "2018-11-03T15:53:24.876Z",
                "tasks": [
            
                ]
              },
              {
                "id": 5,
                "title": "aperiam",
                "created_at": "2018-11-03T15:53:24.879Z",
                "updated_at": "2018-11-03T15:53:24.879Z",
                "tasks": [
            
                ]
              },
              {
                "id": 6,
                "title": "minus",
                "created_at": "2018-11-03T15:53:24.881Z",
                "updated_at": "2018-11-03T15:53:24.881Z",
                "tasks": [
            
                ]
              },
              {
                "id": 7,
                "title": "deleniti",
                "created_at": "2018-11-03T15:53:24.884Z",
                "updated_at": "2018-11-03T15:53:24.884Z",
                "tasks": [
            
                ]
              },
              {
                "id": 8,
                "title": "itaque",
                "created_at": "2018-11-03T15:53:24.886Z",
                "updated_at": "2018-11-03T15:53:24.886Z",
                "tasks": [
            
                ]
              },
              {
                "id": 9,
                "title": "dolore",
                "created_at": "2018-11-03T15:53:24.889Z",
                "updated_at": "2018-11-03T15:53:24.889Z",
                "tasks": [
            
                ]
              },
              {
                "id": 10,
                "title": "ut",
                "created_at": "2018-11-03T15:53:24.892Z",
                "updated_at": "2018-11-03T15:53:24.892Z",
                "tasks": [
            
                ]
              }
            ]

### Create project [POST /api/projects]


+ Request create a project
**POST**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NDEzNDY4MDV9.z_To-KpbCADIVS_LdCkIGvEd4O-fo7n3PeP2VscR1Jc
            Content-Type: application/json

    + Body

            {
              "title": "Project Title",
              "user_id": 2
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 21,
              "title": "Project Title",
              "created_at": "2018-11-03T15:53:25.008Z",
              "updated_at": "2018-11-03T15:53:25.008Z",
              "tasks": [
            
              ]
            }

+ Request does not create a project
**POST**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NDEzNDY4MDV9.pGp0_IysjtPD9rljmesVdR_mqVG-7pEMtTZ4wSmJ4YY
            Content-Type: application/json

    + Body

            {
              "title": null
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "message": "Validation failed: Title can't be blank"
            }

### Read project [GET /api/projects/{id}]

+ Parameters
    + id: `32` (number, required)

+ Request show the project
**GET**&nbsp;&nbsp;`/api/projects/32`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE1NDEzNDY4MDV9.7_sCfiU4HTbRXt6Azd-6EVV2qHhB1u6D0QOwwrTcsCs
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 32,
              "title": "non",
              "created_at": "2018-11-03T15:53:25.072Z",
              "updated_at": "2018-11-03T15:53:25.072Z",
              "tasks": [
            
              ]
            }

+ Request project not found
**GET**&nbsp;&nbsp;`/api/projects/100`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE1NDEzNDY4MDV9.Pbpq6JKpY2uaUHyzrFJ7kfvw2U7BdY7owuezA6I91Eo
            Content-Type: application/json

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "message": "Couldn't find Project with 'id'=100"
            }

### Update project [PATCH /api/projects/{id}]

+ Parameters
    + id: `52` (number, required)

+ Request update a project
**PATCH**&nbsp;&nbsp;`/api/projects/52`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2LCJleHAiOjE1NDEzNDY4MDV9.pW2R90Qzz__tKl06IU_JTSB_lYrKb4jjb91NgQmjgAY
            Content-Type: application/json

    + Body

            {
              "title": "New Title"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 52,
              "title": "New Title",
              "created_at": "2018-11-03T15:53:25.144Z",
              "updated_at": "2018-11-03T15:53:25.173Z",
              "tasks": [
            
              ]
            }

### Delete project [DELETE /api/projects/{id}]

+ Parameters
    + id: `62` (number, required)

+ Request delete a project
**DELETE**&nbsp;&nbsp;`/api/projects/62`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3LCJleHAiOjE1NDEzNDY4MDV9.XCzacV1mhu5lNAxoTm-rsrZBt7CIktYOlndgbd_9DDs
            Content-Type: application/json

+ Response 204



# Group Projects


## Projects [/projects]


### Get projects [GET /api/projects]


+ Request gets a projects
**GET**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NDEzMzY3ODR9.kmEMCgDcxQeGDH-bE0ZJ9oLAMtpxoe3AjK9LDUbU2B0
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 1,
                "title": "velit",
                "created_at": "2018-11-03T13:06:24.805Z",
                "updated_at": "2018-11-03T13:06:24.805Z",
                "tasks": [
            
                ]
              },
              {
                "id": 2,
                "title": "sint",
                "created_at": "2018-11-03T13:06:24.810Z",
                "updated_at": "2018-11-03T13:06:24.810Z",
                "tasks": [
            
                ]
              },
              {
                "id": 3,
                "title": "occaecati",
                "created_at": "2018-11-03T13:06:24.813Z",
                "updated_at": "2018-11-03T13:06:24.813Z",
                "tasks": [
            
                ]
              },
              {
                "id": 4,
                "title": "animi",
                "created_at": "2018-11-03T13:06:24.816Z",
                "updated_at": "2018-11-03T13:06:24.816Z",
                "tasks": [
            
                ]
              },
              {
                "id": 5,
                "title": "voluptatem",
                "created_at": "2018-11-03T13:06:24.818Z",
                "updated_at": "2018-11-03T13:06:24.818Z",
                "tasks": [
            
                ]
              },
              {
                "id": 6,
                "title": "dolorum",
                "created_at": "2018-11-03T13:06:24.821Z",
                "updated_at": "2018-11-03T13:06:24.821Z",
                "tasks": [
            
                ]
              },
              {
                "id": 7,
                "title": "dolor",
                "created_at": "2018-11-03T13:06:24.823Z",
                "updated_at": "2018-11-03T13:06:24.823Z",
                "tasks": [
            
                ]
              },
              {
                "id": 8,
                "title": "dolorem",
                "created_at": "2018-11-03T13:06:24.825Z",
                "updated_at": "2018-11-03T13:06:24.825Z",
                "tasks": [
            
                ]
              },
              {
                "id": 9,
                "title": "aspernatur",
                "created_at": "2018-11-03T13:06:24.828Z",
                "updated_at": "2018-11-03T13:06:24.828Z",
                "tasks": [
            
                ]
              },
              {
                "id": 10,
                "title": "similique",
                "created_at": "2018-11-03T13:06:24.830Z",
                "updated_at": "2018-11-03T13:06:24.830Z",
                "tasks": [
            
                ]
              }
            ]

### Get a project [GET /api/projects/{id}]

+ Parameters
    + id: `11` (number, required)

+ Request show the project
**GET**&nbsp;&nbsp;`/api/projects/11`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NDEzMzY3ODR9.3aoQmtVdtDbHH1wpMTdqLKf_vr0g1EI3j54l3UHfNDM
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 11,
              "title": "itaque",
              "created_at": "2018-11-03T13:06:24.913Z",
              "updated_at": "2018-11-03T13:06:24.913Z",
              "tasks": [
            
              ]
            }

+ Request project not found
**GET**&nbsp;&nbsp;`/api/projects/100`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NDEzMzY3ODR9.1_HRRFOBfRbDK55C7YkqdbPPcZSqIn6bXKOzcoFLYjg
            Content-Type: application/json

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "message": "Couldn't find Project with 'id'=100"
            }

### Create project [POST /api/projects]


+ Request create a project
**POST**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE1NDEzMzY3ODV9.-Y_NDrq2g7CTwUskj7jsS5iOMe5gv1pwvSnWsplLNd8
            Content-Type: application/json

    + Body

            {
              "title": "Project Title",
              "user_id": 4
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 41,
              "title": "Project Title",
              "created_at": "2018-11-03T13:06:25.028Z",
              "updated_at": "2018-11-03T13:06:25.028Z",
              "tasks": [
            
              ]
            }

+ Request does not create a project
**POST**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE1NDEzMzY3ODV9.uHpgGmslyH9VBFz_oBYyzl-lNY2a14HnGlk8oomKoNw
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

### Update project [PATCH /api/projects/{id}]

+ Parameters
    + id: `52` (number, required)

+ Request update a project
**PATCH**&nbsp;&nbsp;`/api/projects/52`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2LCJleHAiOjE1NDEzMzY3ODV9.mPpMWLWPn1P8CICEosNDVbJudq_Maatu8SFSIXTRc8s
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
              "created_at": "2018-11-03T13:06:25.108Z",
              "updated_at": "2018-11-03T13:06:25.155Z",
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3LCJleHAiOjE1NDEzMzY3ODV9.X2l1p_CAQL-Zmmbh4IsE5nq4AGPAwUTrACsrR3vmPT4
            Content-Type: application/json

+ Response 204

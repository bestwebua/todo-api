

# Group Authentication


## Authentication [/auth]


### Sign In [POST /api/auth/sign_in]


+ Request sign in
**POST**&nbsp;&nbsp;`/api/auth/sign_in`

    + Headers

            Accept: application/v1
            Content-Type: application/json

    + Body

            {
              "email": "venice@daugherty.com",
              "password": "abc"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NDEzNTEyOTZ9.NoWCfIFXnX8wJMFuQAh0mzJGlRTGwIAZngfPTicbdg4"
            }

+ Request sign in
**POST**&nbsp;&nbsp;`/api/auth/sign_in`

    + Headers

            Accept: application/v1
            Content-Type: application/json

    + Body

            {
              "email": "laurettaondricka@price.com",
              "password": "L9V9CuM4D43aDaZk"
            }

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "message": "Invalid credentials"
            }

### Sign Out [GET /api/auth/sign_out]


+ Request sign out
**GET**&nbsp;&nbsp;`/api/auth/sign_out`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NDEzNTEyOTZ9.IXLSHEjNVlJw-TccLIov0alWE8A11IYjAYZQ-1zIMtA
            Content-Type: application/json

+ Response 204

### Sign Up [POST /api/auth]


+ Request sign up
**POST**&nbsp;&nbsp;`/api/auth`

    + Headers

            Accept: application/v1
            Content-Type: application/json

    + Body

            {
              "email": "kieshaemard@skiles.name",
              "password": "abc",
              "password_confirmation": "abc"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "message": "Account created successfully",
              "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMSwiZXhwIjoxNTQxMzUxMjk2fQ.avEI-tdlGFlKhML8nVGEh6I1MJodG8Xt4JJM1vPFfP4"
            }

+ Request sign up
**POST**&nbsp;&nbsp;`/api/auth`

    + Headers

            Accept: application/v1
            Content-Type: application/json

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "message": "Validation failed: Password can't be blank, Email can't be blank, Password digest can't be blank"
            }

# Group Projects


## Projects [/projects]


### Get projects [GET /api/projects]


+ Request gets a projects
**GET**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE1NDEzNTEyOTZ9.05g-t0NVTbtTyy9mRHM-b9SsjFNWVV2cYD3BBr9OvjU
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 1,
                "title": "doloremque",
                "created_at": "2018-11-03T17:08:16.070Z",
                "updated_at": "2018-11-03T17:08:16.070Z",
                "tasks": [
            
                ]
              },
              {
                "id": 2,
                "title": "occaecati",
                "created_at": "2018-11-03T17:08:16.074Z",
                "updated_at": "2018-11-03T17:08:16.074Z",
                "tasks": [
            
                ]
              },
              {
                "id": 3,
                "title": "ipsum",
                "created_at": "2018-11-03T17:08:16.076Z",
                "updated_at": "2018-11-03T17:08:16.076Z",
                "tasks": [
            
                ]
              },
              {
                "id": 4,
                "title": "alias",
                "created_at": "2018-11-03T17:08:16.079Z",
                "updated_at": "2018-11-03T17:08:16.079Z",
                "tasks": [
            
                ]
              },
              {
                "id": 5,
                "title": "perspiciatis",
                "created_at": "2018-11-03T17:08:16.081Z",
                "updated_at": "2018-11-03T17:08:16.081Z",
                "tasks": [
            
                ]
              },
              {
                "id": 6,
                "title": "voluptatem",
                "created_at": "2018-11-03T17:08:16.083Z",
                "updated_at": "2018-11-03T17:08:16.083Z",
                "tasks": [
            
                ]
              },
              {
                "id": 7,
                "title": "perferendis",
                "created_at": "2018-11-03T17:08:16.085Z",
                "updated_at": "2018-11-03T17:08:16.085Z",
                "tasks": [
            
                ]
              },
              {
                "id": 8,
                "title": "quia",
                "created_at": "2018-11-03T17:08:16.088Z",
                "updated_at": "2018-11-03T17:08:16.088Z",
                "tasks": [
            
                ]
              },
              {
                "id": 9,
                "title": "accusantium",
                "created_at": "2018-11-03T17:08:16.090Z",
                "updated_at": "2018-11-03T17:08:16.090Z",
                "tasks": [
            
                ]
              },
              {
                "id": 10,
                "title": "libero",
                "created_at": "2018-11-03T17:08:16.092Z",
                "updated_at": "2018-11-03T17:08:16.092Z",
                "tasks": [
            
                ]
              }
            ]

### Create project [POST /api/projects]


+ Request create a project
**POST**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE1NDEzNTEyOTZ9.NerZqJ2bst5VJBE1OB6NeH3a_aHiFEaThQwUmelTB3s
            Content-Type: application/json

    + Body

            {
              "title": "Project Title",
              "user_id": 5
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 21,
              "title": "Project Title",
              "created_at": "2018-11-03T17:08:16.184Z",
              "updated_at": "2018-11-03T17:08:16.184Z",
              "tasks": [
            
              ]
            }

+ Request does not create a project
**POST**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2LCJleHAiOjE1NDEzNTEyOTZ9.j-m74aAYJEf7IuvjapyyHPt1lboEgg6t78-AYOLJWc4
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

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3LCJleHAiOjE1NDEzNTEyOTZ9.jOB1hyzPUflIcscq5VKybS4mhnDiy9LCTpMEChnwDRw
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 32,
              "title": "quia",
              "created_at": "2018-11-03T17:08:16.232Z",
              "updated_at": "2018-11-03T17:08:16.232Z",
              "tasks": [
            
              ]
            }

+ Request project not found
**GET**&nbsp;&nbsp;`/api/projects/100`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo4LCJleHAiOjE1NDEzNTEyOTZ9.gxQ_cooWXwnidNrx5jE99doS9P1YBMHlgiz4Lq80QUA
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

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo5LCJleHAiOjE1NDEzNTEyOTZ9.KqveIZCUtOZasY7o3VDb77HLkf1Pm5Ji2t9jpKJvaxg
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
              "created_at": "2018-11-03T17:08:16.317Z",
              "updated_at": "2018-11-03T17:08:16.349Z",
              "tasks": [
            
              ]
            }

### Delete project [DELETE /api/projects/{id}]

+ Parameters
    + id: `62` (number, required)

+ Request delete a project
**DELETE**&nbsp;&nbsp;`/api/projects/62`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMCwiZXhwIjoxNTQxMzUxMjk2fQ.X56B6Fy-7oPGyBqcO0dtAOqo_jLGURamKxMzYo-i2Nw
            Content-Type: application/json

+ Response 204

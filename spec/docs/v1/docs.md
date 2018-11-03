

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
              "email": "barney@zemlak.info",
              "password": "abc"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NDEzNTY1MTB9.8g1p8y6Pg2yw6NWwLhoJYf9xyqqgyUpK7TGDY0vwUmc"
            }

+ Request sign in fails
**POST**&nbsp;&nbsp;`/api/auth/sign_in`

    + Headers

            Accept: application/v1
            Content-Type: application/json

    + Body

            {
              "email": "ameegerlach@swift.name",
              "password": "4kXu535cHgK5"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NDEzNTY1MTB9.yr3EjTRms0zumnOrLwmYT4VsPBhl1at_aTETXjWa5i8
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
              "email": "ardell@kling.net",
              "password": "abc",
              "password_confirmation": "abc"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "message": "Account created successfully",
              "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNSwiZXhwIjoxNTQxMzU2NTEyfQ.iSoYjjKoQ-x7C7Rlx_1hMHUwuBuYLX9H-BGy8UdU45Q"
            }

+ Request sign up fails
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

# Group Comments


## Comments [/projects/:id/tasks/:id/comments]


### Get comments [GET /api/projects/{project_id}/tasks/{task_id}/comments]

+ Parameters
    + project_id: `1` (number, required)
    + task_id: `1` (number, required)

+ Request gets comments
**GET**&nbsp;&nbsp;`/api/projects/1/tasks/1/comments`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE1NDEzNTY1MTF9.UU5LV7YtiWJu664SFzOCmMkiIf-MEN8APNeB_exAPn0
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 1,
                "body": "tempora",
                "img_src": null,
                "created_at": "2018-11-03T18:35:11.069Z"
              },
              {
                "id": 2,
                "body": "a",
                "img_src": null,
                "created_at": "2018-11-03T18:35:11.072Z"
              },
              {
                "id": 3,
                "body": "neque",
                "img_src": null,
                "created_at": "2018-11-03T18:35:11.075Z"
              },
              {
                "id": 4,
                "body": "quis",
                "img_src": null,
                "created_at": "2018-11-03T18:35:11.077Z"
              },
              {
                "id": 5,
                "body": "sunt",
                "img_src": null,
                "created_at": "2018-11-03T18:35:11.080Z"
              },
              {
                "id": 6,
                "body": "debitis",
                "img_src": null,
                "created_at": "2018-11-03T18:35:11.082Z"
              },
              {
                "id": 7,
                "body": "fugit",
                "img_src": null,
                "created_at": "2018-11-03T18:35:11.085Z"
              },
              {
                "id": 8,
                "body": "et",
                "img_src": null,
                "created_at": "2018-11-03T18:35:11.087Z"
              },
              {
                "id": 9,
                "body": "aut",
                "img_src": null,
                "created_at": "2018-11-03T18:35:11.090Z"
              },
              {
                "id": 10,
                "body": "sequi",
                "img_src": null,
                "created_at": "2018-11-03T18:35:11.093Z"
              }
            ]

### Create comment [POST /api/projects/{project_id}/tasks/{task_id}/comments]

+ Parameters
    + project_id: `2` (number, required)
    + task_id: `11` (number, required)

+ Request create a comment
**POST**&nbsp;&nbsp;`/api/projects/2/tasks/11/comments`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE1NDEzNTY1MTF9.tO4wKlK3jJ0TW-7hg77QJVmtz7r_lOuyFk-7HCLgvEk
            Content-Type: application/json

    + Body

            {
              "body": "Comment"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 21,
              "body": "Comment",
              "img_src": null,
              "created_at": "2018-11-03T18:35:11.220Z"
            }

+ Request create a comment fails
**POST**&nbsp;&nbsp;`/api/projects/3/tasks/21/comments`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2LCJleHAiOjE1NDEzNTY1MTF9.8YsBYNyGWmn1PGELrgaiw7cHLcZrntPqcGrDPxI0CaY
            Content-Type: multipart/form-data; boundary=----------XnJLe9ZIbbGUYtzPQJ16u1

    + Body

            ------------XnJLe9ZIbbGUYtzPQJ16u1
            Content-Disposition: form-data; name="body"
            
            
            ------------XnJLe9ZIbbGUYtzPQJ16u1
            Content-Disposition: form-data; name="image"; filename="ror.txt"
            Content-Type: 
            Content-Length: 0
            
            
            ------------XnJLe9ZIbbGUYtzPQJ16u1--

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "message": "Validation failed: Body can't be blank, Image File is not an image"
            }

### Delete comment [DELETE /api/projects/{project_id}/tasks/{task_id}/comments/{id}]

+ Parameters
    + project_id: `4` (number, required)
    + task_id: `31` (number, required)
    + id: `32` (number, required)

+ Request delete a comment
**DELETE**&nbsp;&nbsp;`/api/projects/4/tasks/31/comments/32`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3LCJleHAiOjE1NDEzNTY1MTF9.JBkLHmdhf_DKbhleFhEaYHdS76wKsAuwx_p8dDUhsPA
            Content-Type: application/json

+ Response 204

# Group Projects


## Projects [/projects]


### Get projects [GET /api/projects]


+ Request gets projects
**GET**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo4LCJleHAiOjE1NDEzNTY1MTF9.y-Ra1-Y1-zOVqXju_e3VSIoRkG7COgZhCG6Gu-yTSiU
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 5,
                "title": "ut",
                "created_at": "2018-11-03T18:35:11.489Z",
                "updated_at": "2018-11-03T18:35:11.489Z",
                "tasks": [
            
                ]
              },
              {
                "id": 6,
                "title": "nesciunt",
                "created_at": "2018-11-03T18:35:11.492Z",
                "updated_at": "2018-11-03T18:35:11.492Z",
                "tasks": [
            
                ]
              },
              {
                "id": 7,
                "title": "dignissimos",
                "created_at": "2018-11-03T18:35:11.495Z",
                "updated_at": "2018-11-03T18:35:11.495Z",
                "tasks": [
            
                ]
              },
              {
                "id": 8,
                "title": "et",
                "created_at": "2018-11-03T18:35:11.497Z",
                "updated_at": "2018-11-03T18:35:11.497Z",
                "tasks": [
            
                ]
              },
              {
                "id": 9,
                "title": "sunt",
                "created_at": "2018-11-03T18:35:11.500Z",
                "updated_at": "2018-11-03T18:35:11.500Z",
                "tasks": [
            
                ]
              },
              {
                "id": 10,
                "title": "totam",
                "created_at": "2018-11-03T18:35:11.503Z",
                "updated_at": "2018-11-03T18:35:11.503Z",
                "tasks": [
            
                ]
              },
              {
                "id": 11,
                "title": "ducimus",
                "created_at": "2018-11-03T18:35:11.506Z",
                "updated_at": "2018-11-03T18:35:11.506Z",
                "tasks": [
            
                ]
              },
              {
                "id": 12,
                "title": "sapiente",
                "created_at": "2018-11-03T18:35:11.509Z",
                "updated_at": "2018-11-03T18:35:11.509Z",
                "tasks": [
            
                ]
              },
              {
                "id": 13,
                "title": "veniam",
                "created_at": "2018-11-03T18:35:11.511Z",
                "updated_at": "2018-11-03T18:35:11.511Z",
                "tasks": [
            
                ]
              },
              {
                "id": 14,
                "title": "voluptatibus",
                "created_at": "2018-11-03T18:35:11.515Z",
                "updated_at": "2018-11-03T18:35:11.515Z",
                "tasks": [
            
                ]
              }
            ]

### Create project [POST /api/projects]


+ Request create a project
**POST**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo5LCJleHAiOjE1NDEzNTY1MTF9.4plC1KoLrxmlwoEqm_RZBAdhqfMsMkzQjBpJDJ0CxcI
            Content-Type: application/json

    + Body

            {
              "title": "Project Title",
              "user_id": 9
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 25,
              "title": "Project Title",
              "created_at": "2018-11-03T18:35:11.601Z",
              "updated_at": "2018-11-03T18:35:11.601Z",
              "tasks": [
            
              ]
            }

+ Request does not create a project
**POST**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMCwiZXhwIjoxNTQxMzU2NTExfQ._WtbgsIAffFqhFJiHoLxuYnh-W3JOw_SA6tUoJNTyK0
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
    + id: `36` (number, required)

+ Request show the project
**GET**&nbsp;&nbsp;`/api/projects/36`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMSwiZXhwIjoxNTQxMzU2NTExfQ.D_10pbDSET_O5ppIQAr_GggjmmPwZ3o4vTG3RtJ7MUk
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 36,
              "title": "dolores",
              "created_at": "2018-11-03T18:35:11.651Z",
              "updated_at": "2018-11-03T18:35:11.651Z",
              "tasks": [
            
              ]
            }

+ Request project not found
**GET**&nbsp;&nbsp;`/api/projects/100`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMiwiZXhwIjoxNTQxMzU2NTExfQ.J76elRFJIhxE1igAUn_VG61n-EOjGLo2ysyddkQ7NQc
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
    + id: `56` (number, required)

+ Request update a project
**PATCH**&nbsp;&nbsp;`/api/projects/56`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMywiZXhwIjoxNTQxMzU2NTExfQ.tStwr81_PQkEjkmGyQ1_nMH7U0-amWd9-dWkkmfbqF8
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
              "id": 56,
              "title": "New Title",
              "created_at": "2018-11-03T18:35:11.731Z",
              "updated_at": "2018-11-03T18:35:11.759Z",
              "tasks": [
            
              ]
            }

### Delete project [DELETE /api/projects/{id}]

+ Parameters
    + id: `66` (number, required)

+ Request delete a project
**DELETE**&nbsp;&nbsp;`/api/projects/66`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNCwiZXhwIjoxNTQxMzU2NTExfQ.1D_BNfXxhgPnQsnHdENbQHGxwVI8i-P_VoedSESfz-U
            Content-Type: application/json

+ Response 204

# Group Tasks


## Tasks [/projects/:id/tasks]


### Get tasks [GET /api/projects/{project_id}/tasks]

+ Parameters
    + project_id: `76` (number, required)

+ Request gets tasks
**GET**&nbsp;&nbsp;`/api/projects/76/tasks`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNSwiZXhwIjoxNTQxMzU2NTExfQ.Lpp5PtQ-5IjJE_nlbA13ZFjA1GKTkYg1kt2iGx-Ab-U
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 41,
                "name": "repellat",
                "done": false,
                "deadline": null,
                "position": 1,
                "created_at": "2018-11-03T18:35:11.812Z",
                "updated_at": "2018-11-03T18:35:11.812Z",
                "comments": [
            
                ]
              },
              {
                "id": 42,
                "name": "ut",
                "done": false,
                "deadline": null,
                "position": 2,
                "created_at": "2018-11-03T18:35:11.816Z",
                "updated_at": "2018-11-03T18:35:11.816Z",
                "comments": [
            
                ]
              },
              {
                "id": 43,
                "name": "et",
                "done": false,
                "deadline": null,
                "position": 3,
                "created_at": "2018-11-03T18:35:11.821Z",
                "updated_at": "2018-11-03T18:35:11.821Z",
                "comments": [
            
                ]
              },
              {
                "id": 44,
                "name": "accusamus",
                "done": false,
                "deadline": null,
                "position": 4,
                "created_at": "2018-11-03T18:35:11.825Z",
                "updated_at": "2018-11-03T18:35:11.825Z",
                "comments": [
            
                ]
              },
              {
                "id": 45,
                "name": "quia",
                "done": false,
                "deadline": null,
                "position": 5,
                "created_at": "2018-11-03T18:35:11.829Z",
                "updated_at": "2018-11-03T18:35:11.829Z",
                "comments": [
            
                ]
              },
              {
                "id": 46,
                "name": "voluptate",
                "done": false,
                "deadline": null,
                "position": 6,
                "created_at": "2018-11-03T18:35:11.833Z",
                "updated_at": "2018-11-03T18:35:11.833Z",
                "comments": [
            
                ]
              },
              {
                "id": 47,
                "name": "qui",
                "done": false,
                "deadline": null,
                "position": 7,
                "created_at": "2018-11-03T18:35:11.837Z",
                "updated_at": "2018-11-03T18:35:11.837Z",
                "comments": [
            
                ]
              },
              {
                "id": 48,
                "name": "et",
                "done": false,
                "deadline": null,
                "position": 8,
                "created_at": "2018-11-03T18:35:11.840Z",
                "updated_at": "2018-11-03T18:35:11.840Z",
                "comments": [
            
                ]
              },
              {
                "id": 49,
                "name": "voluptatibus",
                "done": false,
                "deadline": null,
                "position": 9,
                "created_at": "2018-11-03T18:35:11.844Z",
                "updated_at": "2018-11-03T18:35:11.844Z",
                "comments": [
            
                ]
              },
              {
                "id": 50,
                "name": "aut",
                "done": false,
                "deadline": null,
                "position": 10,
                "created_at": "2018-11-03T18:35:11.848Z",
                "updated_at": "2018-11-03T18:35:11.848Z",
                "comments": [
            
                ]
              }
            ]

### Create task [POST /api/projects/{project_id}/tasks]

+ Parameters
    + project_id: `77` (number, required)

+ Request create a task
**POST**&nbsp;&nbsp;`/api/projects/77/tasks`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNiwiZXhwIjoxNTQxMzU2NTExfQ.I72RsrjmNfvfXacT58qLqnDxZy-PGqmOUdEFOSrOaZc
            Content-Type: application/json

    + Body

            {
              "name": "Task Name",
              "deadline": "2018-11-03T20:35:11.929+02:00"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 61,
              "name": "Task Name",
              "done": false,
              "deadline": "2018-11-03",
              "position": 11,
              "created_at": "2018-11-03T18:35:11.937Z",
              "updated_at": "2018-11-03T18:35:11.937Z",
              "comments": [
            
              ]
            }

+ Request does not create a task
**POST**&nbsp;&nbsp;`/api/projects/78/tasks`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNywiZXhwIjoxNTQxMzU2NTExfQ.zhOmlqb_Agj9yeJIlev7vIQDZ1vqMV5a4CL89lMbczM
            Content-Type: application/json

    + Body

            {
              "name": null
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "message": "Validation failed: Name can't be blank"
            }

### Read task [GET /api/projects/{project_id}/tasks/{id}]

+ Parameters
    + project_id: `79` (number, required)
    + id: `72` (number, required)

+ Request show the task
**GET**&nbsp;&nbsp;`/api/projects/79/tasks/72`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxOCwiZXhwIjoxNTQxMzU2NTEyfQ.eCccBLGcVN2jslRwd9vEpefG99pDZDLxJp80CwLpabo
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 72,
              "name": "quam",
              "done": false,
              "deadline": null,
              "position": 1,
              "created_at": "2018-11-03T18:35:12.018Z",
              "updated_at": "2018-11-03T18:35:12.018Z",
              "comments": [
            
              ]
            }

+ Request task not found
**GET**&nbsp;&nbsp;`/api/projects/80/tasks/0`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxOSwiZXhwIjoxNTQxMzU2NTEyfQ.OPuSwvcepxPEnv_NuB50VaRdziiXbRJtJIw1LDVwKNg
            Content-Type: application/json

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "message": "Couldn't find Task with [WHERE \"tasks\".\"project_id\" = $1 AND \"tasks\".\"id\" = $2]"
            }

### Update task [PATCH /api/projects/{project_id}/tasks/{id}]

+ Parameters
    + project_id: `81` (number, required)
    + id: `92` (number, required)

+ Request update a task
**PATCH**&nbsp;&nbsp;`/api/projects/81/tasks/92`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMCwiZXhwIjoxNTQxMzU2NTEyfQ.aOH-AgqEVsSEl9nwZtPulWr2XGl3D3lRGXiFrasid-Q
            Content-Type: application/json

    + Body

            {
              "name": "Task Name",
              "deadline": "2018-11-03T20:35:12.195+02:00"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 92,
              "name": "Task Name",
              "done": false,
              "deadline": "2018-11-03",
              "position": 1,
              "created_at": "2018-11-03T18:35:12.154Z",
              "updated_at": "2018-11-03T18:35:12.203Z",
              "comments": [
            
              ]
            }

+ Request update a task fails
**PATCH**&nbsp;&nbsp;`/api/projects/82/tasks/102`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMSwiZXhwIjoxNTQxMzU2NTEyfQ.eQlztw8RwdmVCNAHgtx_JdFUrTtCe_lXF9MzsHYELjY
            Content-Type: application/json

    + Body

            {
              "name": "Task Name",
              "deadline": "2018-11-03T20:35:12.262+02:00"
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "message": "Can't update record. Task is already done"
            }

### Delete task [DELETE /api/projects/{project_id}/tasks/{id}]

+ Parameters
    + project_id: `83` (number, required)
    + id: `112` (number, required)

+ Request delete a task
**DELETE**&nbsp;&nbsp;`/api/projects/83/tasks/112`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMiwiZXhwIjoxNTQxMzU2NTEyfQ.pdjc9eqgPSIh5qsbjEAFx1gGa2vR_VR6HiWscnZIb2I
            Content-Type: application/json

+ Response 204

### Complete task [PATCH /api/projects/{project_id}/tasks/{id}/complete]

+ Parameters
    + project_id: `84` (number, required)
    + id: `122` (number, required)

+ Request trigger task status
**PATCH**&nbsp;&nbsp;`/api/projects/84/tasks/122/complete`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMywiZXhwIjoxNTQxMzU2NTEyfQ.GveUU2-6mO1vwXvhZBiwnn6aufGlcosddtLpFmIPG9w
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 122,
              "name": "molestias",
              "done": true,
              "deadline": null,
              "position": 1,
              "created_at": "2018-11-03T18:35:12.385Z",
              "updated_at": "2018-11-03T18:35:12.438Z",
              "comments": [
            
              ]
            }

### Up task [PATCH /api/projects/{project_id}/tasks/{id}/position]

+ Parameters
    + project_id: `85` (number, required)
    + id: `133` (number, required)

+ Request change task position
**PATCH**&nbsp;&nbsp;`/api/projects/85/tasks/133/position`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNCwiZXhwIjoxNTQxMzU2NTEyfQ.estWX2CJpYH2IXwUmhVgjolw8-aBe94CFPNga02Uyzs
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 133,
              "name": "libero",
              "done": false,
              "deadline": null,
              "position": 1,
              "created_at": "2018-11-03T18:35:12.462Z",
              "updated_at": "2018-11-03T18:35:12.525Z",
              "comments": [
            
              ]
            }

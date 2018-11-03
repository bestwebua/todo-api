

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
              "email": "leslieoreilly@townenienow.com",
              "password": "abc"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NDEzNTQ2MTV9.5_cJVdm3epyERRY5RYngR7D0zxct3DerUs6oW3K6rS4"
            }

+ Request sign in fails
**POST**&nbsp;&nbsp;`/api/auth/sign_in`

    + Headers

            Accept: application/v1
            Content-Type: application/json

    + Body

            {
              "email": "mauriciowest@howellbeer.com",
              "password": "L1K3A8Pw88O7ScG"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NDEzNTQ2MTV9.gplGwVC0beH2oyzV_VFIQgySUoSoUi0J3uNhvvJEcjg
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
              "email": "janita@blockfriesen.biz",
              "password": "abc",
              "password_confirmation": "abc"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "message": "Account created successfully",
              "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMSwiZXhwIjoxNTQxMzU0NjE2fQ.XRz6N2nZ41q_LB9egJ90bwT8hHI5ojUtgR_00F2V6Uc"
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

# Group Projects


## Projects [/projects]


### Get projects [GET /api/projects]


+ Request gets a projects
**GET**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE1NDEzNTQ2MTV9.Lq9I7FZ5R-HShHBMklL5dhugRYvlp1MrQ9XmUlbCcps
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 1,
                "title": "nobis",
                "created_at": "2018-11-03T18:03:35.104Z",
                "updated_at": "2018-11-03T18:03:35.104Z",
                "tasks": [
            
                ]
              },
              {
                "id": 2,
                "title": "reprehenderit",
                "created_at": "2018-11-03T18:03:35.107Z",
                "updated_at": "2018-11-03T18:03:35.107Z",
                "tasks": [
            
                ]
              },
              {
                "id": 3,
                "title": "sunt",
                "created_at": "2018-11-03T18:03:35.110Z",
                "updated_at": "2018-11-03T18:03:35.110Z",
                "tasks": [
            
                ]
              },
              {
                "id": 4,
                "title": "aspernatur",
                "created_at": "2018-11-03T18:03:35.112Z",
                "updated_at": "2018-11-03T18:03:35.112Z",
                "tasks": [
            
                ]
              },
              {
                "id": 5,
                "title": "et",
                "created_at": "2018-11-03T18:03:35.114Z",
                "updated_at": "2018-11-03T18:03:35.114Z",
                "tasks": [
            
                ]
              },
              {
                "id": 6,
                "title": "et",
                "created_at": "2018-11-03T18:03:35.117Z",
                "updated_at": "2018-11-03T18:03:35.117Z",
                "tasks": [
            
                ]
              },
              {
                "id": 7,
                "title": "quo",
                "created_at": "2018-11-03T18:03:35.120Z",
                "updated_at": "2018-11-03T18:03:35.120Z",
                "tasks": [
            
                ]
              },
              {
                "id": 8,
                "title": "at",
                "created_at": "2018-11-03T18:03:35.122Z",
                "updated_at": "2018-11-03T18:03:35.122Z",
                "tasks": [
            
                ]
              },
              {
                "id": 9,
                "title": "et",
                "created_at": "2018-11-03T18:03:35.125Z",
                "updated_at": "2018-11-03T18:03:35.125Z",
                "tasks": [
            
                ]
              },
              {
                "id": 10,
                "title": "doloremque",
                "created_at": "2018-11-03T18:03:35.138Z",
                "updated_at": "2018-11-03T18:03:35.138Z",
                "tasks": [
            
                ]
              }
            ]

### Create project [POST /api/projects]


+ Request create a project
**POST**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE1NDEzNTQ2MTV9.AKjVjNjjC20UrlgkNNfGxjE4jHUGDMHF6LTztuI_rSM
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
              "created_at": "2018-11-03T18:03:35.241Z",
              "updated_at": "2018-11-03T18:03:35.241Z",
              "tasks": [
            
              ]
            }

+ Request does not create a project
**POST**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2LCJleHAiOjE1NDEzNTQ2MTV9.syPRAEOGQgqT0MubKQZjM0kzgug-d78fZOlL__rWHFE
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3LCJleHAiOjE1NDEzNTQ2MTV9.MURjoS8vnOSyxf3GGm3P8UkoMYFzNc7hM2Lr095o2vU
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 32,
              "title": "voluptate",
              "created_at": "2018-11-03T18:03:35.295Z",
              "updated_at": "2018-11-03T18:03:35.295Z",
              "tasks": [
            
              ]
            }

+ Request project not found
**GET**&nbsp;&nbsp;`/api/projects/100`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo4LCJleHAiOjE1NDEzNTQ2MTV9.-ZG1ahdlzAhwQQ3lXhPDb4EvaMjEfpTN_6Fdwz9s6Hc
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo5LCJleHAiOjE1NDEzNTQ2MTV9.1BSt8kb5cxPBjApRe4ooHKxdxTBmbrxduVVKpmyA21g
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
              "created_at": "2018-11-03T18:03:35.370Z",
              "updated_at": "2018-11-03T18:03:35.406Z",
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMCwiZXhwIjoxNTQxMzU0NjE1fQ.lnG7CqKOw04LzLZ7JROss1sZLx1PXHYJu39sUWTkXUs
            Content-Type: application/json

+ Response 204

# Group Tasks


## Tasks [/projects/:id/tasks]


### Get tasks [GET /api/projects/{project_id}/tasks]

+ Parameters
    + project_id: `72` (number, required)

+ Request gets a tasks
**GET**&nbsp;&nbsp;`/api/projects/72/tasks`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMSwiZXhwIjoxNTQxMzU0NjE1fQ.yO0kjFdyzBRjjXW9Z_QhS1tmGmfJ475G83d6I3Zc6TI
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 1,
                "name": "voluptatem",
                "done": false,
                "deadline": null,
                "position": 1,
                "created_at": "2018-11-03T18:03:35.474Z",
                "updated_at": "2018-11-03T18:03:35.474Z",
                "comments": [
            
                ]
              },
              {
                "id": 2,
                "name": "porro",
                "done": false,
                "deadline": null,
                "position": 2,
                "created_at": "2018-11-03T18:03:35.481Z",
                "updated_at": "2018-11-03T18:03:35.481Z",
                "comments": [
            
                ]
              },
              {
                "id": 3,
                "name": "et",
                "done": false,
                "deadline": null,
                "position": 3,
                "created_at": "2018-11-03T18:03:35.487Z",
                "updated_at": "2018-11-03T18:03:35.487Z",
                "comments": [
            
                ]
              },
              {
                "id": 4,
                "name": "sint",
                "done": false,
                "deadline": null,
                "position": 4,
                "created_at": "2018-11-03T18:03:35.492Z",
                "updated_at": "2018-11-03T18:03:35.492Z",
                "comments": [
            
                ]
              },
              {
                "id": 5,
                "name": "eaque",
                "done": false,
                "deadline": null,
                "position": 5,
                "created_at": "2018-11-03T18:03:35.496Z",
                "updated_at": "2018-11-03T18:03:35.496Z",
                "comments": [
            
                ]
              },
              {
                "id": 6,
                "name": "facilis",
                "done": false,
                "deadline": null,
                "position": 6,
                "created_at": "2018-11-03T18:03:35.501Z",
                "updated_at": "2018-11-03T18:03:35.501Z",
                "comments": [
            
                ]
              },
              {
                "id": 7,
                "name": "ullam",
                "done": false,
                "deadline": null,
                "position": 7,
                "created_at": "2018-11-03T18:03:35.505Z",
                "updated_at": "2018-11-03T18:03:35.505Z",
                "comments": [
            
                ]
              },
              {
                "id": 8,
                "name": "et",
                "done": false,
                "deadline": null,
                "position": 8,
                "created_at": "2018-11-03T18:03:35.509Z",
                "updated_at": "2018-11-03T18:03:35.509Z",
                "comments": [
            
                ]
              },
              {
                "id": 9,
                "name": "earum",
                "done": false,
                "deadline": null,
                "position": 9,
                "created_at": "2018-11-03T18:03:35.513Z",
                "updated_at": "2018-11-03T18:03:35.513Z",
                "comments": [
            
                ]
              },
              {
                "id": 10,
                "name": "et",
                "done": false,
                "deadline": null,
                "position": 10,
                "created_at": "2018-11-03T18:03:35.517Z",
                "updated_at": "2018-11-03T18:03:35.517Z",
                "comments": [
            
                ]
              }
            ]

### Create task [POST /api/projects/{project_id}/tasks]

+ Parameters
    + project_id: `73` (number, required)

+ Request create a task
**POST**&nbsp;&nbsp;`/api/projects/73/tasks`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMiwiZXhwIjoxNTQxMzU0NjE1fQ.UpQZP9qxrPFVV1zrlpceuaekxfzqYlKYMPWR6Hog-ew
            Content-Type: application/json

    + Body

            {
              "name": "Task Name",
              "deadline": "2018-11-03T20:03:35.610+02:00"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 21,
              "name": "Task Name",
              "done": false,
              "deadline": "2018-11-03",
              "position": 11,
              "created_at": "2018-11-03T18:03:35.617Z",
              "updated_at": "2018-11-03T18:03:35.617Z",
              "comments": [
            
              ]
            }

+ Request does not create a task
**POST**&nbsp;&nbsp;`/api/projects/74/tasks`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMywiZXhwIjoxNTQxMzU0NjE1fQ.kg2SQ1L3K0w0dV5hThQWmknVu0MTwp7cvhF8Kx3Jc2o
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
    + project_id: `75` (number, required)
    + id: `32` (number, required)

+ Request show the task
**GET**&nbsp;&nbsp;`/api/projects/75/tasks/32`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNCwiZXhwIjoxNTQxMzU0NjE1fQ.HNXeVqCQy_6kTp7-_PqypvC65yy1R4QBJBDRkRczM3k
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 32,
              "name": "cum",
              "done": false,
              "deadline": null,
              "position": 1,
              "created_at": "2018-11-03T18:03:35.697Z",
              "updated_at": "2018-11-03T18:03:35.697Z",
              "comments": [
            
              ]
            }

+ Request task not found
**GET**&nbsp;&nbsp;`/api/projects/76/tasks/0`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNSwiZXhwIjoxNTQxMzU0NjE1fQ.MVikBLO_eOj1Z1ajE4mmIMXSgWQ2zvi5wJMS4ITYJYI
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
    + project_id: `77` (number, required)
    + id: `52` (number, required)

+ Request update a task
**PATCH**&nbsp;&nbsp;`/api/projects/77/tasks/52`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNiwiZXhwIjoxNTQxMzU0NjE1fQ.iy_DJVTN0AyW5KCxyKBXVe7mnL3PfYezTBJwhcdbzFU
            Content-Type: application/json

    + Body

            {
              "name": "Task Name",
              "deadline": "2018-11-03T20:03:35.867+02:00"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 52,
              "name": "Task Name",
              "done": false,
              "deadline": "2018-11-03",
              "position": 1,
              "created_at": "2018-11-03T18:03:35.827Z",
              "updated_at": "2018-11-03T18:03:35.873Z",
              "comments": [
            
              ]
            }

+ Request update a task fails
**PATCH**&nbsp;&nbsp;`/api/projects/78/tasks/62`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNywiZXhwIjoxNTQxMzU0NjE1fQ.8Zxc8yYmE426-eHOLGVioImd2M_d7LQ4cKpvnFNmFnQ
            Content-Type: application/json

    + Body

            {
              "name": "Task Name",
              "deadline": "2018-11-03T20:03:35.942+02:00"
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
    + project_id: `79` (number, required)
    + id: `72` (number, required)

+ Request delete a task
**DELETE**&nbsp;&nbsp;`/api/projects/79/tasks/72`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxOCwiZXhwIjoxNTQxMzU0NjE2fQ.Tf36XXbXEDY5K3AUjTW9GeSpNoB1CInOPnIcByW3ZrY
            Content-Type: application/json

+ Response 204

### Complete task [PATCH /api/projects/{project_id}/tasks/{id}/complete]

+ Parameters
    + project_id: `80` (number, required)
    + id: `82` (number, required)

+ Request trigger task status
**PATCH**&nbsp;&nbsp;`/api/projects/80/tasks/82/complete`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxOSwiZXhwIjoxNTQxMzU0NjE2fQ.4UP1MLBSxrXT6sYexKOFZru5OGeehD7wEytlyAzeYBM
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 82,
              "name": "tempore",
              "done": true,
              "deadline": null,
              "position": 1,
              "created_at": "2018-11-03T18:03:36.067Z",
              "updated_at": "2018-11-03T18:03:36.118Z",
              "comments": [
            
              ]
            }

### Up task [PATCH /api/projects/{project_id}/tasks/{id}/position]

+ Parameters
    + project_id: `81` (number, required)
    + id: `93` (number, required)

+ Request change task position
**PATCH**&nbsp;&nbsp;`/api/projects/81/tasks/93/position`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMCwiZXhwIjoxNTQxMzU0NjE2fQ.H_JmithOQNZvNvLB84YCz67UWNgtqI8jYSVZYumN-LU
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 93,
              "name": "optio",
              "done": false,
              "deadline": null,
              "position": 1,
              "created_at": "2018-11-03T18:03:36.138Z",
              "updated_at": "2018-11-03T18:03:36.199Z",
              "comments": [
            
              ]
            }



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
              "email": "beverly@skiles.net",
              "password": "abc"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NDg4MzgwMTV9.IUCUgc6fNI5vhtPAsO8zYzeZ3za99Cm3Cm_C6gzyI3E"
            }

+ Request sign in fails
**POST**&nbsp;&nbsp;`/api/auth/sign_in`

    + Headers

            Accept: application/v1
            Content-Type: application/json

    + Body

            {
              "email": "jenniffer@borer.net",
              "password": "G8DjJiI8Q3NeE"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NDg4MzgwMTZ9.oxWEp-o309uG9My782cJBOoLAVHm0Qv-26xkWLneBOs
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
              "email": "tedgulgowski@ruel.biz",
              "password": "abc",
              "password_confirmation": "abc"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "message": "Account created successfully",
              "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNiwiZXhwIjoxNTQ4ODM4MDE2fQ.bjNa5Rq4VFAcqOAQdM7a4IHrgXXso0y40-wA8aBmEys"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE1NDg4MzgwMTZ9.rcGSknDcy9ZAENYEZzPMNhskW4Ait-LV-3J_CSuuwpQ
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 1,
                "body": "iusto",
                "img_src": null,
                "created_at": "2019-01-29T08:46:56.061Z"
              },
              {
                "id": 2,
                "body": "et",
                "img_src": null,
                "created_at": "2019-01-29T08:46:56.063Z"
              }
            ]

### Create comment [POST /api/projects/{project_id}/tasks/{task_id}/comments]

+ Parameters
    + project_id: `2` (number, required)
    + task_id: `3` (number, required)

+ Request create a comment
**POST**&nbsp;&nbsp;`/api/projects/2/tasks/3/comments`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE1NDg4MzgwMTZ9.yiyc2pSEkuu8_hg_KUTjiweMsZPYtF8QwIe7S1jcSeU
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
              "id": 5,
              "body": "Comment",
              "img_src": null,
              "created_at": "2019-01-29T08:46:56.100Z"
            }

+ Request create a comment with image
**POST**&nbsp;&nbsp;`/api/projects/3/tasks/5/comments`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2LCJleHAiOjE1NDg4MzgwMTZ9.7UtsMhk_m9FQoCYug56gsk6klTejiAywxEbV6zqBN7A
            Content-Type: application/json

    + Body

            {
              "body": "Comment",
              "image": {
                "original_filename": "ror.png",
                "tempfile": "#<File:0x0000559e49c4eb08>",
                "content_type": null
              }
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 8,
              "body": "Comment",
              "img_src": null,
              "created_at": "2019-01-29T08:46:56.122Z"
            }

+ Request create a comment fails
**POST**&nbsp;&nbsp;`/api/projects/4/tasks/7/comments`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3LCJleHAiOjE1NDg4MzgwMTZ9.dacxnhG-jKnC5QYswRlBhkSrO3A15wQj1WiGOtuY4wA
            Content-Type: application/json

    + Body

            {
              "body": null,
              "image": {
                "original_filename": "ror.txt",
                "tempfile": "#<File:0x0000559e49a0bad0>",
                "content_type": null
              }
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "message": "Validation failed: Body can't be blank"
            }

### Delete comment [DELETE /api/projects/{project_id}/tasks/{task_id}/comments/{id}]

+ Parameters
    + project_id: `5` (number, required)
    + task_id: `9` (number, required)
    + id: `11` (number, required)

+ Request delete a comment
**DELETE**&nbsp;&nbsp;`/api/projects/5/tasks/9/comments/11`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo4LCJleHAiOjE1NDg4MzgwMTZ9.IGU1r_w_UhlwU8yedhqZ7SlIZPtsnIwKbS93FowWV8w
            Content-Type: application/json

+ Response 204

# Group Projects


## Projects [/projects]


### Get projects [GET /api/projects]


+ Request gets projects
**GET**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo5LCJleHAiOjE1NDg4MzgwMTZ9.DaLk69NkyxXwn3qNTBLRuQ-BKS9amPCwS_at3VUsr_U
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 6,
                "title": "consequuntur",
                "created_at": "2019-01-29T08:46:56.175Z",
                "updated_at": "2019-01-29T08:46:56.175Z",
                "tasks": [
            
                ]
              },
              {
                "id": 7,
                "title": "voluptatem",
                "created_at": "2019-01-29T08:46:56.177Z",
                "updated_at": "2019-01-29T08:46:56.177Z",
                "tasks": [
            
                ]
              }
            ]

### Create project [POST /api/projects]


+ Request create a project
**POST**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMCwiZXhwIjoxNTQ4ODM4MDE2fQ.ZY2o7v7AJkTd8oW9xzsrcuaCVkWO2l8ZnN1pZAHLi7g
            Content-Type: application/json

    + Body

            {
              "title": "Project Title",
              "user_id": 10
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 10,
              "title": "Project Title",
              "created_at": "2019-01-29T08:46:56.211Z",
              "updated_at": "2019-01-29T08:46:56.211Z",
              "tasks": [
            
              ]
            }

+ Request does not create a project
**POST**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMSwiZXhwIjoxNTQ4ODM4MDE2fQ.XgCQO3ShegRDahogC2hzb_JhlEcaijL2t7vT9WGPZZo
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
    + id: `13` (number, required)

+ Request show the project
**GET**&nbsp;&nbsp;`/api/projects/13`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMiwiZXhwIjoxNTQ4ODM4MDE2fQ.cYIOCPCuS4Lrv92E3otVT-LkSGbmY20qC8g1-zA9_wE
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 13,
              "title": "quia",
              "created_at": "2019-01-29T08:46:56.236Z",
              "updated_at": "2019-01-29T08:46:56.236Z",
              "tasks": [
            
              ]
            }

+ Request project not found
**GET**&nbsp;&nbsp;`/api/projects/100`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMywiZXhwIjoxNTQ4ODM4MDE2fQ.OaISqBcOpx-f3VBzT2_neDxxd86GJi7scipEy5UwcyU
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
    + id: `17` (number, required)

+ Request update a project
**PATCH**&nbsp;&nbsp;`/api/projects/17`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNCwiZXhwIjoxNTQ4ODM4MDE2fQ.px-1fyK7EdOHAtHmurLxjRuFvPEOzfyDQ_YOcrcU0S4
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
              "id": 17,
              "title": "New Title",
              "created_at": "2019-01-29T08:46:56.263Z",
              "updated_at": "2019-01-29T08:46:56.270Z",
              "tasks": [
            
              ]
            }

### Delete project [DELETE /api/projects/{id}]

+ Parameters
    + id: `19` (number, required)

+ Request delete a project
**DELETE**&nbsp;&nbsp;`/api/projects/19`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNSwiZXhwIjoxNTQ4ODM4MDE2fQ.PxSdDw_C9PnT92a8ew_fP6x8aCRVijfNxfzfHeUygag
            Content-Type: application/json

+ Response 204

# Group Tasks


## Tasks [/projects/:id/tasks]


### Get tasks [GET /api/projects/{project_id}/tasks]

+ Parameters
    + project_id: `21` (number, required)

+ Request gets tasks
**GET**&nbsp;&nbsp;`/api/projects/21/tasks`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNiwiZXhwIjoxNTQ4ODM4MDE2fQ.YYjnd_wWrvRXz8e-Rp0HLTCA07TQXq-lZkQJbYVumWQ
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 11,
                "name": "eum",
                "done": false,
                "deadline": null,
                "position": 1,
                "created_at": "2019-01-29T08:46:56.296Z",
                "updated_at": "2019-01-29T08:46:56.296Z",
                "comments": [
            
                ]
              },
              {
                "id": 12,
                "name": "qui",
                "done": false,
                "deadline": null,
                "position": 2,
                "created_at": "2019-01-29T08:46:56.298Z",
                "updated_at": "2019-01-29T08:46:56.298Z",
                "comments": [
            
                ]
              }
            ]

### Create task [POST /api/projects/{project_id}/tasks]

+ Parameters
    + project_id: `22` (number, required)

+ Request create a task
**POST**&nbsp;&nbsp;`/api/projects/22/tasks`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNywiZXhwIjoxNTQ4ODM4MDE2fQ.RXaEx7R4q3almWePU8XxmdWjuALcwaGGSGyH4-uSktw
            Content-Type: application/json

    + Body

            {
              "name": "Task Name",
              "deadline": "2019-01-29T10:46:56.327+02:00"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 15,
              "name": "Task Name",
              "done": false,
              "deadline": "2019-01-29",
              "position": 3,
              "created_at": "2019-01-29T08:46:56.332Z",
              "updated_at": "2019-01-29T08:46:56.332Z",
              "comments": [
            
              ]
            }

+ Request does not create a task
**POST**&nbsp;&nbsp;`/api/projects/23/tasks`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxOCwiZXhwIjoxNTQ4ODM4MDE2fQ.Hi3Ypd46GyzUJDTqKo67kdcit-GcbH07nSQp6UJ8Yqs
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
    + project_id: `24` (number, required)
    + id: `18` (number, required)

+ Request show the task
**GET**&nbsp;&nbsp;`/api/projects/24/tasks/18`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxOSwiZXhwIjoxNTQ4ODM4MDE2fQ.ZQTEWJRtA3ZigHhdso3evxv1gC9_Xkj1Qkq0Dn2ctZc
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 18,
              "name": "illo",
              "done": false,
              "deadline": null,
              "position": 1,
              "created_at": "2019-01-29T08:46:56.364Z",
              "updated_at": "2019-01-29T08:46:56.364Z",
              "comments": [
            
              ]
            }

+ Request task not found
**GET**&nbsp;&nbsp;`/api/projects/25/tasks/0`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMCwiZXhwIjoxNTQ4ODM4MDE2fQ.ASi0jXXF6kyPb1jOGNPDhg2wpknL2Rkj9eW7R9WBJ7o
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
    + project_id: `26` (number, required)
    + id: `22` (number, required)

+ Request update a task
**PATCH**&nbsp;&nbsp;`/api/projects/26/tasks/22`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMSwiZXhwIjoxNTQ4ODM4MDE2fQ.8q9yJee41xvMh_MPGVBD8U8QZjlFJemrcqITXAqWGsE
            Content-Type: application/json

    + Body

            {
              "name": "Task Name",
              "deadline": "2019-01-29T10:46:56.414+02:00"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 22,
              "name": "Task Name",
              "done": false,
              "deadline": "2019-01-29",
              "position": 1,
              "created_at": "2019-01-29T08:46:56.408Z",
              "updated_at": "2019-01-29T08:46:56.420Z",
              "comments": [
            
              ]
            }

+ Request update a task fails
**PATCH**&nbsp;&nbsp;`/api/projects/27/tasks/24`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMiwiZXhwIjoxNTQ4ODM4MDE2fQ.QL5wL1SskicMU34DNHX4t7gSxZnLXtvABcQEm4GGfoA
            Content-Type: application/json

    + Body

            {
              "name": "Task Name",
              "deadline": "2019-01-29T10:46:56.438+02:00"
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
    + project_id: `28` (number, required)
    + id: `26` (number, required)

+ Request delete a task
**DELETE**&nbsp;&nbsp;`/api/projects/28/tasks/26`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMywiZXhwIjoxNTQ4ODM4MDE2fQ.N3HxR13zVQ8ng7c04HkGHUfHq_wT4oJgrd8eXtkwrME
            Content-Type: application/json

+ Response 204

### Complete task [PATCH /api/projects/{project_id}/tasks/{id}/complete]

+ Parameters
    + project_id: `29` (number, required)
    + id: `28` (number, required)

+ Request trigger task status
**PATCH**&nbsp;&nbsp;`/api/projects/29/tasks/28/complete`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNCwiZXhwIjoxNTQ4ODM4MDE2fQ.sv8VnL-wiQyFzp3F8Jlcxhzw06Ola2BK-WsaCGteBEk
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 28,
              "name": "quo",
              "done": true,
              "deadline": null,
              "position": 1,
              "created_at": "2019-01-29T08:46:56.491Z",
              "updated_at": "2019-01-29T08:46:56.500Z",
              "comments": [
            
              ]
            }

### Up task [PATCH /api/projects/{project_id}/tasks/{id}/position]

+ Parameters
    + project_id: `30` (number, required)
    + id: `31` (number, required)

+ Request change task position
**PATCH**&nbsp;&nbsp;`/api/projects/30/tasks/31/position`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNSwiZXhwIjoxNTQ4ODM4MDE2fQ.-cZzvdZ9GfLCqZE0TgiLef2Fy8NFBGuzgGSQp1z9GU4
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 31,
              "name": "voluptas",
              "done": false,
              "deadline": null,
              "position": 1,
              "created_at": "2019-01-29T08:46:56.514Z",
              "updated_at": "2019-01-29T08:46:56.528Z",
              "comments": [
            
              ]
            }



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
              "email": "mairesanford@walker.info",
              "password": "abc"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NDkwOTQ3MzJ9.x8u8qyrzjv2QNU2MH9nQN9J33qIReUPrw6s3dgcGHYI"
            }

+ Request sign in fails
**POST**&nbsp;&nbsp;`/api/auth/sign_in`

    + Headers

            Accept: application/v1
            Content-Type: application/json

    + Body

            {
              "email": "hongziemann@wolff.biz",
              "password": "S68r52AcJ"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NDkwOTQ3MzJ9.nAFXIOFc2u3BegDzD_zSw9Ax60r5_44Xds3Zs9P60qU
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
              "email": "maria@johnston.name",
              "password": "abc",
              "password_confirmation": "abc"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "message": "Account created successfully",
              "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNiwiZXhwIjoxNTQ5MDk0NzMzfQ.lQH4ednQNz17lwbIeoWqz07OP4WFdzzKUABYCOIVTjE"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE1NDkwOTQ3MzJ9.5LU4gKUHVvz5G3dYQrO4vUEGT_PiOpO-fr-PTrCLCZ0
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 1,
                "body": "asperiores",
                "img_src": null,
                "created_at": "2019-02-01T08:05:32.933Z"
              },
              {
                "id": 2,
                "body": "possimus",
                "img_src": null,
                "created_at": "2019-02-01T08:05:32.935Z"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE1NDkwOTQ3MzJ9.cJwEHudPUBBCMU7_HiJAre9i3w7emGKd3g5WE1TMNTQ
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
              "created_at": "2019-02-01T08:05:32.966Z"
            }

+ Request create a comment with image
**POST**&nbsp;&nbsp;`/api/projects/3/tasks/5/comments`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2LCJleHAiOjE1NDkwOTQ3MzJ9._fRdWGgLdRMzxFgdJ8MKITH1Edk97AkGWfkl3pvo49o
            Content-Type: multipart/form-data; boundary=----------XnJLe9ZIbbGUYtzPQJ16u1

    + Body

            {"body":"Comment","image":{"tempfile":"#\u003cFile:0x000055e1b86f5fc8\u003e","original_filename":"ror.png","content_type":"","headers":"Content-Disposition: form-data; name=\"image\"; filename=\"ror.png\"\r\nContent-Type: \r\nContent-Length: 24879\r\n"}}

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 8,
              "body": "Comment",
              "img_src": "http://localhost:3000/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--0c4a5f6d05a353d6644e0ade9d45ce90042d4d1b/ror.png",
              "created_at": "2019-02-01T08:05:33.016Z"
            }

+ Request create a comment fails
**POST**&nbsp;&nbsp;`/api/projects/4/tasks/7/comments`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3LCJleHAiOjE1NDkwOTQ3MzN9.cQRHZr1tYV17Lr8-vim4cIVGYANxm5y1UXt_lAcKdtM
            Content-Type: application/json

    + Body

            {
              "body": null,
              "image": {
                "original_filename": "ror.txt",
                "tempfile": "#<File:0x000055e1b89c8840>",
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo4LCJleHAiOjE1NDkwOTQ3MzN9.y-u2UNUnoTspVTkWwAGI1f9_68IlEviYP6B1y4Q859g
            Content-Type: application/json

+ Response 204

# Group Projects


## Projects [/projects]


### Get projects [GET /api/projects]


+ Request gets projects
**GET**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo5LCJleHAiOjE1NDkwOTQ3MzN9.ICgyiti-9e47dX1k-Jos2zdvJHdwtmnEx3Ayz6QEggg
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 6,
                "title": "pariatur",
                "created_at": "2019-02-01T08:05:33.073Z",
                "updated_at": "2019-02-01T08:05:33.073Z",
                "tasks": [
            
                ]
              },
              {
                "id": 7,
                "title": "rem",
                "created_at": "2019-02-01T08:05:33.074Z",
                "updated_at": "2019-02-01T08:05:33.074Z",
                "tasks": [
            
                ]
              }
            ]

### Create project [POST /api/projects]


+ Request create a project
**POST**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMCwiZXhwIjoxNTQ5MDk0NzMzfQ.imZ1ufZoPSriSjnCuivp5d2vMESMkGTpw6JaEwJ2434
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
              "created_at": "2019-02-01T08:05:33.101Z",
              "updated_at": "2019-02-01T08:05:33.101Z",
              "tasks": [
            
              ]
            }

+ Request does not create a project
**POST**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMSwiZXhwIjoxNTQ5MDk0NzMzfQ.MOvZl3CXqbxaB-0_QRKUCCTdpmQpsy2iA5N7QEUV40U
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMiwiZXhwIjoxNTQ5MDk0NzMzfQ.iLtG-c2MacNj4NsaWtsjCaAB7yaYAmq0VvOzl59A44M
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 13,
              "title": "hic",
              "created_at": "2019-02-01T08:05:33.126Z",
              "updated_at": "2019-02-01T08:05:33.126Z",
              "tasks": [
            
              ]
            }

+ Request project not found
**GET**&nbsp;&nbsp;`/api/projects/100`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMywiZXhwIjoxNTQ5MDk0NzMzfQ.jPcDp2VT4CHgASJiGxi-7n0qg_dx8hlHoUFyvFSaHWw
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNCwiZXhwIjoxNTQ5MDk0NzMzfQ.EdghlfjUDU22VbZAZwIhWcCnRYqOgg3o0dmTRxmZ5is
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
              "created_at": "2019-02-01T08:05:33.149Z",
              "updated_at": "2019-02-01T08:05:33.155Z",
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNSwiZXhwIjoxNTQ5MDk0NzMzfQ.CKyT1lEKVH12OBRVZUVKFq_KeoizbqLi8dB3-_UfQr8
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNiwiZXhwIjoxNTQ5MDk0NzMzfQ.PoO9avilPRPQvQRokc9DrmYlJsdVtE-8DnIfGacOsdo
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 11,
                "name": "fugit",
                "done": false,
                "deadline": null,
                "position": 1,
                "created_at": "2019-02-01T08:05:33.176Z",
                "updated_at": "2019-02-01T08:05:33.176Z",
                "comments": [
            
                ]
              },
              {
                "id": 12,
                "name": "maiores",
                "done": false,
                "deadline": null,
                "position": 2,
                "created_at": "2019-02-01T08:05:33.178Z",
                "updated_at": "2019-02-01T08:05:33.178Z",
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNywiZXhwIjoxNTQ5MDk0NzMzfQ.dyADUkR5NC3PTwmbMgcRkM0RfBTNY4i6lsvyleuGcXc
            Content-Type: application/json

    + Body

            {
              "name": "Task Name",
              "deadline": "2019-02-01T10:05:33.199+02:00"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 15,
              "name": "Task Name",
              "done": false,
              "deadline": "2019-02-01",
              "position": 3,
              "created_at": "2019-02-01T08:05:33.203Z",
              "updated_at": "2019-02-01T08:05:33.203Z",
              "comments": [
            
              ]
            }

+ Request does not create a task
**POST**&nbsp;&nbsp;`/api/projects/23/tasks`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxOCwiZXhwIjoxNTQ5MDk0NzMzfQ.UBljBVsH1cw1_McaTlQ82kDTuaUfBjDh7vTrA_Zmu80
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxOSwiZXhwIjoxNTQ5MDk0NzMzfQ.5rNAPKwGqkKCaWWwBmtVUIP3hu_vsw7ZeK02-kOSS8s
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 18,
              "name": "minus",
              "done": false,
              "deadline": null,
              "position": 1,
              "created_at": "2019-02-01T08:05:33.231Z",
              "updated_at": "2019-02-01T08:05:33.231Z",
              "comments": [
            
              ]
            }

+ Request task not found
**GET**&nbsp;&nbsp;`/api/projects/25/tasks/0`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMCwiZXhwIjoxNTQ5MDk0NzMzfQ.YGL7zZBDiyQGMAO6Wf8oq6FX7RJbXabAnBmPpVST2DA
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMSwiZXhwIjoxNTQ5MDk0NzMzfQ.hMCmgO63-MO7neRdAnzoRY0WCtXDhUqiBd2wHozpsis
            Content-Type: application/json

    + Body

            {
              "name": "Task Name",
              "deadline": "2019-02-01T10:05:33.267+02:00"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 22,
              "name": "Task Name",
              "done": false,
              "deadline": "2019-02-01",
              "position": 1,
              "created_at": "2019-02-01T08:05:33.262Z",
              "updated_at": "2019-02-01T08:05:33.271Z",
              "comments": [
            
              ]
            }

+ Request update a task fails
**PATCH**&nbsp;&nbsp;`/api/projects/27/tasks/24`

    + Headers

            Accept: application/v1
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMiwiZXhwIjoxNTQ5MDk0NzMzfQ.IIDraDzemqByX5szx7EHUw1eApDpgizjqf87_gmRvHc
            Content-Type: application/json

    + Body

            {
              "name": "Task Name",
              "deadline": "2019-02-01T10:05:33.286+02:00"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMywiZXhwIjoxNTQ5MDk0NzMzfQ.jwfvu4rG9-J_pNf_fuBngmUF5KHASp5wAPv0PTfmfmo
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNCwiZXhwIjoxNTQ5MDk0NzMzfQ.jc69XuMO6gvz4wM3bXxgPHTgs7wZehe2EMilvZLVa-4
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 28,
              "name": "rerum",
              "done": true,
              "deadline": null,
              "position": 1,
              "created_at": "2019-02-01T08:05:33.331Z",
              "updated_at": "2019-02-01T08:05:33.339Z",
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNSwiZXhwIjoxNTQ5MDk0NzMzfQ.4uk8OGVYL_E93ABVwy9d7YXdTGEiirFanXsOFnm0b1g
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 31,
              "name": "quia",
              "done": false,
              "deadline": null,
              "position": 1,
              "created_at": "2019-02-01T08:05:33.351Z",
              "updated_at": "2019-02-01T08:05:33.364Z",
              "comments": [
            
              ]
            }

# Author's Haven (Ruby on Rails, React, AWS)

> Author's Haven blogging application with API in Ruby on Rails and Client in React. Hosted on AWS (EC2 with Postgres database on RDS)

#### Functions / Features
1. User authentication
2. Create article
3. Read articles
4. Update articles
5. Delete articles


   TODO:
6. Follow users
7. Get notification when "followee" posts new article
8. Show follow stats with charts


#### Developer info.
- Project Management
  - [Public Trello Board](https://trello.com/b/XJ8Pkcqm/authors-haven-ror-react-aws)
- Version Control
  - [GitHub Repository](https://github.com/brucemakallan/Author-s-Haven-in-Ruby-React-AWS)

#### AWS (EC2 with RDS - Postgres) Deployment
http://ec2-34-238-116-235.compute-1.amazonaws.com

 - e.g. Get `page` 1 of Articles with a `limit` of 2 Articles per page
`http://ec2-34-238-116-235.compute-1.amazonaws.com/api/v1/articles?page=1&limit=2`


#### API
1. Signup
   **POST** `/api/v1/users`
   ```
    {
      "user": {
        "first_name": "Jane",
        "last_name": "Doe",
        "email": "jane@mailer.com",
        "password": "123456",
        "password_confirmation": "123456"
      }
    }
   ```
2. Login
   **POST** `/api/v1/auth`
   ```
    {
      "user": {
        "email": "jane@mailer.com",
        "password": "123456"
      }
    }
   ```
3. Get all Articles 
   **GET** `/api/v1/articles`
   - `?page=1`: pagination
   - `?page=1&limit=2`: pagination with page limits
  ```
  [
    {
        "id": 18,
        "title": "Dancing and drawing",
        "body": "Lorem",
        "image_url": "https://picsum.photos/id/77/1600/900",
        "created_at": "2019-08-31T15:58:07.496Z",
        "updated_at": "2019-08-31T15:58:07.496Z",
        "slug": "dancing-and-drawing",
        "author_id": 33
    },
    {
        "id": 17,
        "title": "Insights and thoughts",
        "body": "Lorem",
        "image_url": "https://picsum.photos/id/77/1600/900",
        "created_at": "2019-08-31T15:57:10.803Z",
        "updated_at": "2019-08-31T16:00:42.816Z",
        "slug": "ins-and-outs-of-madness",
        "author_id": 33
    }
]
  ```
4. Get one Article
   **GET** `/api/v1/articles/:id_or_slug`
  ```
  {
      "id": 17,
      "title": "Insights and thoughts",
      "body": "Lorem",
      "image_url": "https://picsum.photos/id/77/1600/900",
      "created_at": "2019-08-31T15:57:10.803Z",
      "updated_at": "2019-08-31T16:00:42.816Z",
      "slug": "ins-and-outs-of-madness",
      "author_id": 33
  }
  ```

> Token Authentication:
> Provide an "Authorization" Header with the value: Bearer TOKEN-STRING-HERE
1. Create Article (Requires a token)
   **POST** `/api/v1/articles`
2. Edit Article (Requires a token)
   **PUT** `/api/v1/articles/:id`
3. Delete Article (Requires a token)
   **DELETE** `/api/v1/articles/:id`

##### Error Responses (format)
e.g. `http://localhost:3000/api/v1/articles/177`
```
{
    "error": "Not Found",
    "details": "Couldn't find Article with 'id'=177"
}
```


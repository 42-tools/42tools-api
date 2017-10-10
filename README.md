## Production initalization

### PostgreSQL

```shell
createuser --pwprompt '42tools-api'
createdb '42tools-api_production'
psql -c 'GRANT ALL PRIVILEGES ON DATABASE "42tools-api_production" to "42tools-api";'
```

## DB Schema

### Generate
```shell
rails g scaffold user email:string login:string first_name:string last_name:string phone:string image_url:text staff:boolean correction_point:integer pool_month:string pool_year:string wallet:integer

rails g scaffold cursus name:string slug:string --force-plural
rails g scaffold cursus_user cursus:references user:references

rails g scaffold group name:string
rails g scaffold groups_user group:references user:references

rails g scaffold campus name:string --force-plural
rails g scaffold campus_user campus:references user:references primary:boolean

rails g scaffold project name:string slug:string parent_id:bigint:index
rails g scaffold projects_user project:references user:references occurrence:integer final_mark:integer status:string validated:boolean
rails g scaffold projects_users_cursus projects_user:references cursus:references --force-plural

rails g scaffold app name:string
rails g scaffold apps_token app:references user:references jwt:text

rails g scaffold friends_user owner:references friend:references
rails g scaffold friends_group owner:references name:string
rails g scaffold friends_groups_user friends_group:references friends_user:references

rails g scaffold log kind:integer data:text
```

### Destroy
```shell
rails d scaffold user
rails d scaffold cursus
rails d scaffold cursus_user
rails d scaffold group
rails d scaffold groups_user
rails d scaffold campus
rails d scaffold campus_user
rails d scaffold project
rails d scaffold projects_user
rails d scaffold projects_users_cursus
rails d scaffold app
rails d scaffold apps_token
rails d scaffold friends_user
rails d scaffold friends_group
rails d scaffold friends_groups_user
rails d scaffold log
```

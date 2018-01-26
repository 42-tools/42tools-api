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
rails g scaffold forty_two/user email:string login:string first_name:string last_name:string phone:string image_url:text staff:boolean correction_point:integer pool_month:string pool_year:string wallet:integer

rails g scaffold forty_two/cursus name:string slug:string --force-plural
rails g scaffold forty_two/cursus_user cursus:references user:references

rails g scaffold forty_two/group name:string
rails g scaffold forty_two/groups_user group:references user:references

rails g scaffold forty_two/campus name:string --force-plural
rails g scaffold forty_two/campus_user campus:references user:references primary:boolean

rails g scaffold forty_two/project name:string slug:string parent_id:bigint:index
rails g scaffold forty_two/projects_user project:references user:references occurrence:integer final_mark:integer status:string validated:boolean
rails g scaffold forty_two/projects_users_cursus projects_user:references cursus:references --force-plural

rails g scaffold forty_two/coalitions name:string slug:string image_url:text color:string score:integer master:references
rails g scaffold forty_two/coalitions_users coalition:references user:references

rails g scaffold forty_two/app name:string
rails g scaffold token app:references user:references
rails g model role app:references slug:integer

rails g scaffold friends_user owner:references friend:references
rails g scaffold friends_group owner:references name:string
rails g scaffold friends_groups_user friends_group:references friends_user:references

rails g scaffold log linkable:references:polymorphic data:text
```

### Destroy
```shell
rails d scaffold forty_two/user
rails d scaffold forty_two/cursus
rails d scaffold forty_two/cursus_user
rails d scaffold forty_two/group
rails d scaffold forty_two/groups_user
rails d scaffold forty_two/campus
rails d scaffold forty_two/campus_user
rails d scaffold forty_two/project
rails d scaffold forty_two/projects_user
rails d scaffold forty_two/projects_users_cursus
rails d scaffold forty_two/coalitions
rails d scaffold forty_two/coalitions_users
rails d scaffold forty_two/app
rails d scaffold token
rails d scaffold role
rails d scaffold friends_user
rails d scaffold friends_group
rails d scaffold friends_groups_user
rails d scaffold log
```

## Development

### PostgreSQL

```shell
psql -c "CREATE USER \"42tools-api\" WITH PASSWORD 'wEiTu52FdB86';"
psql -c "CREATE DATABASE \"42tools-api_development\";"
psql -c "CREATE DATABASE \"42tools-api_test\";"
psql -c "GRANT ALL PRIVILEGES ON DATABASE \"42tools-api_development\" to \"42tools-api\";"
psql -c "GRANT ALL PRIVILEGES ON DATABASE \"42tools-api_test\" to \"42tools-api\";"
```

## Production

### Env

```shell
SECRET_KEY_BASE=<rails secret>
DATABASE_URL=postgres://<username>:<password>@<hostname>/42tools-api_production
REDIS_URL=redis://<hostname>
CLIENT_ID=<intra42 client uid>
CLIENT_SECRET=<intra42 client secret>
```

### PostgreSQL

```shell
psql -c "CREATE USER \"42tools-api\" WITH PASSWORD '<password>';"
psql -c "CREATE DATABASE \"42tools-api_production\";"
psql -c "GRANT ALL PRIVILEGES ON DATABASE \"42tools-api_production\" to \"42tools-api\";"
```

## DB Schema

### Generate
```shell
rails g scaffold forty_two/user email:string login:string first_name:string last_name:string phone:string image_url:text staff:boolean correction_point:integer pool_month:string pool_year:string wallet:integer

rails g scaffold forty_two/cursus name:string slug:string --force-plural
rails g scaffold forty_two/cursus_user cursus:references user:references grade:string level:integer begin_at:datetime end_at:datetime has_coalition:boolean

rails g scaffold forty_two/title name:string
rails g scaffold forty_two/titles_user title:references user:references selected:boolean

rails g scaffold forty_two/group name:string
rails g scaffold forty_two/groups_user group:references user:references

rails g scaffold forty_two/achievement name:string description:text tier:string kind:string visible:boolean image:text nbr_of_success:integer parent:references
rails g scaffold forty_two/achievements_user achievement:references user:references

rails g scaffold forty_two/language name:string identifier:string
rails g scaffold forty_two/languages_user language:references user:references position:integer

rails g scaffold forty_two/campus name:string time_zone:string language:references --force-plural
rails g scaffold forty_two/campus_user campus:references user:references primary:boolean

rails g scaffold forty_two/project name:string slug:string parent:references
rails g scaffold forty_two/projects_user project:references user:references occurrence:integer final_mark:integer status:string validated:boolean
rails g scaffold forty_two/cursus_projects_user projects_user:references cursus:references --force-plural

rails g scaffold forty_two/coalition name:string slug:string image_url:text color:string score:integer master:references
rails g scaffold forty_two/coalitions_user coalition:references user:references

rails g model forty_two/roles name:string description:text
rails g scaffold forty_two/app name:string uid:string secret:string
rails g model forty_two/roles_apps role:references app:references
rails g scaffold token app:references user:references

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
rails d scaffold forty_two/title
rails d scaffold forty_two/titles_user
rails d scaffold forty_two/group
rails d scaffold forty_two/groups_user
rails d scaffold forty_two/achievements
rails d scaffold forty_two/achievements_users
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

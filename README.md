# README

## Good-night-app
sample app for recording user's sleep pattern as well as getting sleep records of friends

### APi flow
- as user i can get clocked in times of sleep records
- as user i can see 1 week of friend's sleep record data
- as user i can follow/add a friend 
- as user i can unfollow/delete a friend 
 
 #### Routes pattern followed:
 | url routes | prefix | verb | URI | Controller#Action|
| ----------- | ----------- |----------- |----------- |----------- |
| [ Route 1 ] | clock_in_times_sleep_records | GET | /sleep_records/clock_in_times(.:format) | sleep_records#clock_in_times |
| [ Route 2 ] |  | GET | /sleep_records/friends_records_sleep_records/:user_id(.:format) | sleep_records#friends_records_sleep_records |
| [ Route 3 ] | sleep_records | POST | /sleep_records(.:format) | sleep_records#create |
| [ Route 4 ] | relationships | POST | /relationships(.:format) | relationships#create |
| [ Route 5 ] | relationship | DELETE | /relationships/:id(.:format) | relationships#destroy | 

> **_NOTE:_** This is the tabularized version of routes pattern for the current api, original routes pattern was generated using the command :
`rails routes --expanded`

### Completed List(previous todo list)
- Complete Rails Api: 
    - generate models: Completed
        - user.rb
        - relationship.rb
        - sleep_record.rb
    - generate controllers: Completed
        - sleep_records_controller.rb
        - relationships_controller.rb
    - configure routes: Completed
- Complete TestData and testcases:
    - generate test data:
        - test data using fixtures: since rails 7.0.0 fixtures use is deprecated, commented out.
        - test data using faker gem
### Todo list
- add support for reactjs sample app for ui view
- support for base ui

### Specifications
| Syntax | Description |
| ----------- | ----------- |
| language | ruby |
| language-version | 3.0.2 |
| framework | rails |
| framework-version | 7.0.0 |
| database | sqlite3 |
| other gems added | faker, database_cleaner|

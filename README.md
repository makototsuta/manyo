| User Model | Task Model |
----|----
|name string|task_name  string|
|email  string|priority string|
|admin  boolean|status string|
|password string|user_name  string|
|password_confirmation  string|


|   | herokuデプロイの方法 |
----|----
| 1 | $ heroku login |
| 2 |登録したメールアドレス/パスワード入力 |
| 3 |$ git add -A |
| 4 |$ git commit -m "commit message" |
| 5 |$ heroku create |
| 6 |$ git push heroku branch名:master |
| 7 |$ heroku run rails db:migrate |
| 8 |$ heroku config:set USER=username |
| 9 |$ heroku config:set PASS=password |

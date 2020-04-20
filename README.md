| User Model | Task Model |
----|----
|name string|task_name  string|
|email  string|priority string|
|admin  boolean|status string|
|password string|user_name  string|
|password_confirmation  string|


| herokuデプロイの方法 |
----|----
| $ heroku login |
| 登録したメールアドレス/パスワード入力 |
| $ git add -A |
| $ git commit -m "commit message" |
| $ heroku create |
| $ git push heroku branch名:master |
| $ heroku run rails db:migrate |
| $ heroku config:set USER=username |
| $ heroku config:set PASS=password |

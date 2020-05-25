| User Model | Task Model |
----|----
|name string|task_name  string|
|email  string|priority string|
|admin  boolean|status string|
|password string|user_name  string|
|password_confirmation  string|


|   | herokuデプロイの方法 |
----|----
| 初回 | 2回目以降 |
| ユーザー登録 | 不要 |
| $ heroku login | $ heroku login |
| 登録したメールアドレス/パスワード入力 | 登録したメールアドレス/パスワード入力 |
| $ git add -A | $ git add -A |
| $ git commit -m "commit message" | $ git commit -m "commit message" |
| $ heroku create | 不要 |
| $ git push heroku branch名:master | $ git push heroku branch名:master |
| $ heroku run rails db:migrate | $ heroku run rails db:migrate |
| $ heroku config:set USER=username | 不要 |
| $ heroku config:set PASS=password | 不要 |
| GitHub連携(herokuサイト→アプリ→deployタブ→deployment method:github) | 不要 |

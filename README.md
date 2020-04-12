# User Model
-name string
-email  string
-admin  boolean
-password string
-password_confirmation  string

# Task Model
-task_name  string
-priority string
-status string
-user_name  string

# herokuデプロイの方法
- $ heroku login
- 登録したメールアドレス/パスワード入力
- $ git add -A
- $ git commit -m "commit message"
- $ heroku create
- $ git push heroku branch名:master
- $ heroku run rails db:migrate
- $ heroku config:set USER=username
- $ heroku config:set PASS=password

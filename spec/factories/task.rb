# 「FactoryBotを使用します」という記述
FactoryBot.define do
  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :task do
    task_name { 'Factory' }
    deadline { '2020-05-02' }
    priority { '優先' }
    status { '着手済み' }
    user_name { 'コンテント１' }
  end
  # 作成するテストデータの名前を「second_task」とします

  factory :second_task, class: Task do
    task_name { 'Factory2' }
    deadline { '2020-01-10' }
    priority { '優先' }
    status { '着手済み2' }
    user_name { 'コンテント2' }
  end

  factory :third_task, class: Task do
    task_name { 'Factory3' }
    deadline { '2020-03-15' }
    priority { '優先' }
    status { '着手済み3' }
    user_name { 'コンテント3' }
  end
end
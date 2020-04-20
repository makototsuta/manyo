require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  before do
    user_a = FactoryBot.create(:user)
    visit login_path
    fill_in 'メールアドレス', with: 'sample@example.com'
    fill_in 'パスワード', with: '00000000'
    click_on 'ログインする'
    task_a = FactoryBot.create(:task, task_name: 'task', user:user_a)
    task_b = FactoryBot.create(:second_task, task_name: 'new_task', user:user_a)
  end
  describe 'タスク一覧画面' do
    context 'タスクを作成した場合' do
      it '作成済みのタスクが表示される' do
        visit tasks_path
        expect(page).to have_content 'task'
      end
    end
  end

  describe 'タスク登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do

      it 'データが保存される' do
        visit new_task_path

        fill_in 'タイトル', with: 'タスク'
        select '2020', from: 'task_deadline_1i'
        select '1', from: 'task_deadline_2i'
        select '1', from: 'task_deadline_3i'
        select '高', from: '優先順位'
        select '着手中', from: 'ステータス'

        click_on '登録する'
        expect(page).to have_content '登録しました'
      end
    end
  end

  describe 'タスク詳細画面' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示されたページに遷移する' do
        visit task_path(id: 1)

        expect(page).to have_content 'task'
      end
    end
  end
end

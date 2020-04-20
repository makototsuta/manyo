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
    third_task = FactoryBot.create(:third_task, task_name: 'third_task', user:user_a)
  end
  describe 'タスク一覧画面' do
    context '終了期限でソートするを押した場合' do
      it 'タスクが終了期限の降順で並んでいる' do
        visit tasks_path

        click_on '終了期限でソートする'
        expect(page).to have_content 'task'

        task_list = all('tbody tr')

        expect(task_list[0]).to have_content 'task'
        expect(task_list[1]).to have_content 'third_task'
        expect(task_list[2]).to have_content 'new_task'
      end
    end
  end
end

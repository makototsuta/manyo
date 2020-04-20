require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  context '検索をした場合' do
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
    it "タイトルで検索できる" do
      visit tasks_path

      fill_in '名前', with: 'task'
      click_on '検索'

      expect(page).to have_content 'task'
    end
    it "ステータスで検索できる" do
      visit tasks_path

      select '着手中', from: 'ステータス'
      click_on '検索'

      expect(page).to have_content '着手中'
    end
    it "タイトル、ステータス両方で検索できる" do
      visit tasks_path

      fill_in '名前', with: 'task'
      select '着手中', from: 'ステータス'
      click_on '検索'

      expect(page).to have_content 'task'
      expect(page).to have_content '着手中'
    end
  end
end

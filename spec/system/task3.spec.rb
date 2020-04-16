require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  context '検索をした場合' do
    before do
      FactoryBot.create(:task, task_name: "task")
      FactoryBot.create(:second_task, task_name: "sample")
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

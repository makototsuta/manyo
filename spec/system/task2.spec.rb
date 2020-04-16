require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    @task = FactoryBot.create(:task, task_name: 'task')
  end
  describe 'タスク一覧画面' do
    context '終了期限でソートするを押した場合' do
      it 'タスクが終了期限の降順で並んでいる' do
        second_task = FactoryBot.create(:second_task, task_name: 'second_task')
        third_task = FactoryBot.create(:third_task, task_name: 'third_task')

        visit tasks_path

        click_on '終了期限でソートする'
        expect(page).to have_content 'task'

        task_list = all('tbody tr')

        expect(task_list[0]).to have_content 'task'
        expect(task_list[1]).to have_content 'third_task'
        expect(task_list[2]).to have_content 'second_task'
      end
    end
  end
end

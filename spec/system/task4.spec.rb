require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    lebel_a = FactoryBot.create(:label)
    user_a = FactoryBot.create(:user)
    task_a = FactoryBot.create(:task, :task_with_labels, user:user_a)

    visit login_path
    fill_in 'メールアドレス', with: 'sample@example.com'
    fill_in 'パスワード', with: '00000000'
    click_on 'ログインする'
  end

  describe 'タスク一覧画面' do
    context 'ラベル付きタスクを作成した場合' do
      it '作成済みのラベル付きタスクが表示される' do
        visit root_path
        expect(page).to have_content 'test_task2'
      end
    end
    context '検索をした場合' do
      it 'ラベルで検索できる' do
        visit root_path
        select 'test_task4', from: 'label_id'
        click_on 'Search'
        expect(page).to have_content "test_task4"
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
        check 'task_label_ids_6'

        click_on '登録する'
        expect(page).to have_content '登録しました'
      end
    end
  end
end

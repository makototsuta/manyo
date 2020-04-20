require 'rails_helper'
RSpec.describe 'ユーザ登録・ログイン・ログアウト機能', type: :system do

  describe 'ユーザ登録のテスト' do
    context 'ユーザのデータがなくログインしていない場合' do
      it 'ユーザ新規登録のテスト' do
        visit new_user_path
        fill_in 'user[name]', with: 'sample'
        fill_in 'user[email]', with: 'sample@example.com'
        fill_in 'user[password]', with: '00000000'
        fill_in 'user[password_confirmation]', with: '00000000'
        click_on '登録する'
        expect(current_path).to eq user_path(id: 1)
      end
      it 'ログインしていない時はログイン画面に飛ぶテスト' do
        visit tasks_path
        expect(current_path).to eq login_path
      end
    end
  end

  describe 'セッション機能のテスト' do
    context 'ユーザのデータがあってログインしていない場合' do
      it 'ログインのテスト' do
        user_a = FactoryBot.create(:user)
        visit login_path
        fill_in 'メールアドレス', with: 'sample@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'ログインする'
        expect(current_path).to eq user_path(id: 1)
      end
    end

    context '一般ユーザのデータがあってログインしている場合' do
      before do
        user_a = FactoryBot.create(:user)
        user_b = FactoryBot.create(:admin_user)
        task_a = FactoryBot.create(:task, user:user_a)
        task_b = FactoryBot.create(:second_task, user:user_b)
        visit login_path
        fill_in 'メールアドレス', with: 'sample@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'ログインする'
      end
      it '自分の詳細画面に飛ぶテスト' do
        visit tasks_path
        click_on '詳細'
        expect(page).to have_content 'Factory'
      end
      it '他人の詳細画面に飛ぶと一覧ページに遷移するテスト' do
        visit task_path(id: 2)
        expect(current_path).to eq tasks_path
      end
      it '管理画面に飛ぶと一覧ページに遷移するテスト' do
        visit admin_users_path
        expect(current_path).to eq root_path
      end
      it 'ログアウトのテスト' do
        visit tasks_path
        click_on 'ログアウト'
        expect(current_path).to eq login_path
      end
    end
  end

  describe '管理画面のテスト' do
    context '管理者のデータがあってログインしている場合' do
      before do
        user_a = FactoryBot.create(:user)
        user_b = FactoryBot.create(:admin_user)
        task_a = FactoryBot.create(:task, user:user_a)
        task_b = FactoryBot.create(:second_task, user:user_b)
        visit login_path
        fill_in 'メールアドレス', with: 'admin@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'ログインする'
        visit tasks_path
      end
      it '管理者が管理画面にアクセスするテスト' do
        click_on 'ユーザー管理画面'
        expect(current_path).to eq admin_users_path
      end
      it '管理者によるユーザー登録テスト' do
        click_on 'ユーザー管理画面'
        click_on '新規登録'
        fill_in '名前', with: '氏名'
        fill_in 'メールアドレス', with: 'sample@yahoo.com'
        fill_in 'パスワード', with: '111111'
        fill_in 'パスワード（確認）', with: '111111'
        click_on '登録する'
        expect(page).to have_content '氏名'
      end
      it '管理者によるユーザー詳細画面閲覧テスト' do
        click_on '詳細'
        expect(page).to have_content 'Factory2'
      end
      it '管理者によるユーザー編集テスト' do
        visit edit_admin_user_path(id: 1)
        fill_in '名前', with: 'example'
        fill_in 'パスワード', with: '00000000'
        fill_in 'パスワード（確認）', with: '00000000'
        click_on '登録する'
        expect(page).to have_content 'example'
      end
      it '管理者によるユーザー削除テスト' do
        click_on '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '削除しました。'
      end
    end
  end
end

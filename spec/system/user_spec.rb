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
      end
    end
    context '一般ユーザのデータがあってログインしている場合' do
      it '自分の詳細画面に飛ぶテスト' do
      end
      it '他人の詳細画面に飛ぶと一覧ページに遷移するテスト' do
      end
      it '管理画面に飛ぶと一覧ページに遷移するテスト' do
      end
      it 'ログアウトのテスト' do
      end
    end
  end
  describe '管理画面のテスト' do
    context '管理者のデータがあってログインしている場合' do
      it '管理者が管理画面にアクセスするテスト' do
      end
      it '管理者によるユーザー登録テスト' do
      end
      it '管理者によるユーザー詳細画面閲覧テスト' do
      end
      it '管理者によるユーザー編集テスト' do
      end
      it '管理者によるユーザー削除テスト' do
      end
    end
  end
end

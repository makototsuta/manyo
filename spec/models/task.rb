require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :model do
    it 'task_nameが空ならバリテーションが通らない' do
      task = Task.new(task_name: " ", deadline: "2020-01-02", priority: "中", status: "着手中", user_name:"1")
      expect(task).not_to be_valid
    end

    it 'task_nameが30文字以上のときエラーになる' do
      task = Task.new task_name: "#{'a'*31}"
      task.valid?
      expect(task.errors[:task_name]).to include('は30文字以内で入力してください')
    end

    it 'task_name,priority,status,user_nameに内容が記載されていればバリデーションが通る' do
      task = Task.new(task_name: "task", deadline: "2020-01-02", priority: "中", status: "着手中", user_name:"1")
      expect(task).to be_valid
    end
end

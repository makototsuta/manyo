require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :model do
    it 'task_nameが空ならバリテーションが通らない' do
      task = Task.new(task_name: "", deadline: "2020-01-02", priority: "中", status: "着手中")
      expect(task).not_to be_valid
    end

    it 'priorityが空ならバリデーションが通らない' do
      task = Task.new(task_name: "task", deadline: "2020-01-02", priority: "", status: "着手中")
      expect(task).not_to be_valid
    end

    it 'task_nameとpriorityに内容が記載されていればバリデーションが通る' do
      user = User.new(id: 1, name: "sample", email: "sample@example.com", password: "0000000", admin: false)
      task = Task.new(task_name: "task", deadline: "2020-01-02", priority: "中", status: "着手中", user: user)
      expect(task).to be_valid
    end
end

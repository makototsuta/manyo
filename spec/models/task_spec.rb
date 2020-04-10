require 'rails_helper'

RSpec.describe Task, type: :model do
    it 'task_nameがblankのときエラーになる' do
      task = Task.new()
      task.valid?
      expect(task.errors.messages[:task_name]).to include('を入力してください')
    end

    it 'task_nameが30文字以上のときエラーになる' do
      task = Task.new task_name: "#{'a'*31}"
      task.valid?
      expect(task.errors[:task_name]).to include('は30文字以内で入力してください')
    end
end

require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :model do
  context 'scopeメソッドで検索をした場合' do
    before do
      Task.create(task_name: "task", deadline: "2020-01-02", priority: "中", status: "着手中")
      Task.create(task_name: "sample", deadline: "2020-01-02", priority: "中", status: "未着手")
    end
    it "scopeメソッドでタイトル検索ができる" do
      expect(Task.get_by_task_name('task').count).to eq 1
    end
    it "scopeメソッドでステータス検索ができる" do
      expect(Task.get_by_status('着手中').count).to eq 1
    end
    it "scopeメソッドでタイトルとステータスの両方が検索できる" do
      expect(Task.get_by_task_name('task').count).to eq 1
      expect(Task.get_by_status('未着手').count).to eq 1
    end
  end
end

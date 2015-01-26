class CreateProjectTasks < ActiveRecord::Migration
  def change
    create_table :project_tasks do |t|
      t.references :project, index: true
      t.references :task, index: true

      t.timestamps null: false
    end
    add_foreign_key :project_tasks, :projects
    add_foreign_key :project_tasks, :tasks
  end
end

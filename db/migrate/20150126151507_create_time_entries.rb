class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.string :description
      t.references :user, index: true, null: false
      t.references :task, index: true, null: false
      t.references :project, index: true, null: false
      t.integer :accrued, null: false, default: 0
      t.date :performed_dt, null: false
      t.time :running_start_time

      t.timestamps null: false
    end
    add_foreign_key :time_entries, :users
    add_foreign_key :time_entries, :tasks
    add_foreign_key :time_entries, :projects
  end
end

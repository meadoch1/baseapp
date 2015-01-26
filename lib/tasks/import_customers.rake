require 'csv'
namespace :import_customers do
    task :create_customers => :environment do
      ProjectTask.destroy_all
      Project.destroy_all
      Customer.destroy_all
      csv_text = File.read('./data/customers.csv')
      csv = CSV.parse(csv_text, :headers => true, :header_converters => lambda { |h| h.downcase })
      csv.each do |unstriped_row|
        row = {}
        unstriped_row.each{|k, v| row[k] = v.is_a?(String) ? v.strip: v}
        Customer.create!(row)
      end
    end

    task :add_default_projects do
      return unless Project.all.count == 0
      Customer.all.each do |customer|
        Project.create!(name: "Default", customer: customer, is_active: true)
        Project.create!(name: "Secondary", customer: customer, is_active: true)
      end
    end

    task :add_default_tasks do
      return unless Task.all.count == 0
      Task.create!(name: 'Software Development')
      Task.create!(name: 'Administrivia')
      Task.create!(name: 'Meeting')
    end

    task :assign_tasks_to_projects do
      return unless ProjectTask.all.count == 0

      tasks = Task.all.to_a

      Project.all.each do |project|
        tasks.each do |task |
          ProjectTask.create!(project: project, task: task)
        end

      end
    end
end

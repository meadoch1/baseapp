require 'action_controller/base'

ActionController::Renderers.add :csv do |csv, options|
  target = csv.respond_to?(:first) ? csv.first : csv
  self.response_body = if target.class.ancestors.include? ActiveRecord::Base
                         ActiveRecordCsv.to_csv(csv, options)
                       else
                         csv
                       end
end

class Notification < ActiveRecord::Base
  belongs_to :curriculum
  belongs_to :notification_type
end

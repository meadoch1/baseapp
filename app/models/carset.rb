class Carset < ActiveRecord::Base
  belongs_to :user

  has_attached_file :file
  validates_attachment :file, presence: true, content_type: {content_type: 'text/csv'}
end

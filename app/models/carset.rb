class Carset < ActiveRecord::Base
  belongs_to :user
  attr_reader :failed_records

  has_attached_file :file
  validates_attachment :file, presence: true, content_type: {content_type: 'text/csv'}

  before_save :parse_file

  def parse_file
    tempfile = file.queued_for_write[:original].read
    result = CarsetImportService.process(tempfile);
    @failed_records = result[:success] ?  nil : result[:failed_records]
  end
end

class TimeEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  belongs_to :project
  validates :user, presence: true
  validates :task, presence: true
  validates :project, presence: true

  def accrued_hrs
    accrued.nil? ? nil : (accrued / 60.0 ).round(1)
  end

  def accrued_hrs=(value)
    if value
      self.accrued = (value * 60).round(0)
    end
  end

  def accrued_display
    (accrued / 60.0 ).round(1).to_s
  end

  def do_start(value)
    if value && self.running_start_time.nil?
      self.update_attributes( running_start_time: DateTime.now )
    end
  end

end

class TimeEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  belongs_to :project
  validate :user, presence: true
  validate :task, presence: true
  validate :project, presence: true

  after_initialize :defaults

  private

  def defaults
    self.user = current_user
    self.performed_at ||= Date.today
  end
end

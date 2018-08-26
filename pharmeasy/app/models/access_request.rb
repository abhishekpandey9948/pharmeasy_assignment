class AccessRequest < ApplicationRecord

  belongs_to :requester, foreign_key: "requester_id", class_name: "User"
  belongs_to :requestee, foreign_key: "requestee_id", class_name: "User"

  enum status: [:inactive, :active]
  scope :active, -> { where(status: AccessRequest::statuses[:active]) }
  scope :inactive, -> { where(status: AccessRequest::statuses[:inactive]) }

  before_save :set_status

  private
  def set_status
    self.status = AccessRequest::statuses[:inactive]
  end

end

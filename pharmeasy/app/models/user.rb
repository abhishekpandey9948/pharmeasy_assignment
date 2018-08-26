class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :users_role, class_name: "Users::Role"
  has_many :prescriptions

  has_many :subscription_request, -> { where status: 0 }, foreign_key: :requestee_id, class_name: "AccessRequest"

  has_many :active_subscription, -> { where status: 1 }, foreign_key: :requester_id, class_name: "AccessRequest"

  before_create :generate_uuid, uniqueness: true

  USER_ROLE_ID_SEARCH_MAP = {1 => [2,3], 2 => [1], 3 => [1]}

  def generate_uuid
    uuid = "#{(0...8).map { rand(9) }.join}"
    while ::User.find_by(uuid: uuid).present? do
      uuid = "#{(0...8).map { rand(9) }.join}"
    end
    self.uuid = uuid
  end
end

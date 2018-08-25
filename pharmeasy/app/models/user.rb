class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :users_role, class_name: "Users::Role"
  has_many :prescriptions

  before_save :generate_uuid, uniqueness: true

  def generate_uuid
    uuid = "#{(0...8).map { rand(9) }.join}"
    while ::User.find_by(uuid: uuid).present? do
      uuid = "#{(0...8).map { rand(9) }.join}"
    end
    self.uuid = uuid
  end
end

class Prescription < ApplicationRecord
  belongs_to :user
  has_many :documents, :dependent => :destroy, :class_name=>'Document'
  accepts_nested_attributes_for :documents, allow_destroy: true
end
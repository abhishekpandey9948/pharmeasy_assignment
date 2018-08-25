class Document < ApplicationRecord
  belongs_to :prescription,optional: true
  mount_uploader :file_name, ImageUploader
end

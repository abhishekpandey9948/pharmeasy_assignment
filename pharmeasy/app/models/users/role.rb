class ::Users::Role < ActiveRecord::Base
  self.table_name = "users_roles"
  has_one :user
end
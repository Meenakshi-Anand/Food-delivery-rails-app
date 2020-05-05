class Restaurant < ApplicationRecord
  has_one :user , as: :entity
end

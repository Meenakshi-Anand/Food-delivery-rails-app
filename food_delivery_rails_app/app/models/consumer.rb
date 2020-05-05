class Consumer < ApplicationRecord
  has_one :user , as: :entity
end

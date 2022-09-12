class Menu < ApplicationRecord
  belongs_to :user

  validates :sheet_key, presence: true
end

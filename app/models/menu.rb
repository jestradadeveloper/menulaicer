class Menu < ApplicationRecord
  belongs_to :user

  validates :sheet_key, presence: true
  validates :title, presence: true
end

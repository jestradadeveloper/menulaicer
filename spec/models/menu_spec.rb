require 'rails_helper'

RSpec.describe Menu, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many(:menu_items).dependent(:destroy) }
  it { is_expected.to validate_presence_of(:sheet_key) }
  it { is_expected.to validate_presence_of(:title) }
end

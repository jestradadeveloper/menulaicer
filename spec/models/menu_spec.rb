require 'rails_helper'

RSpec.describe Menu, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to validate_presence_of(:sheet_key) }
end

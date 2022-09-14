require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  it { is_expected.to belong_to :menu }
  it { is_expected.to validate_presence_of(:item_name) }
  it { is_expected.to validate_presence_of(:price) }
end

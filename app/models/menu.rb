class Menu < ApplicationRecord
  belongs_to :user

  has_many :menu_items, dependent: :destroy
  validates :sheet_key, presence: true
  validates :title, presence: true
  def self.create_with_sheet_key(user:, sheet_key:)
    credentials_file = GoogleDrive::Session.from_config('sheetmenu-362021-8b3508189548.json.erb')
    spreadsheet = credentials_file.spreadsheet_by_key(sheet_key)
    worksheet = spreadsheet.worksheets[0]
    keys = worksheet.rows.first
    items = worksheet.rows[1..-1]
    keys = keys.map { |key| key.parameterize(separator: '_') }.map(&:to_sym)
    menu = Menu.new(user:, title: spreadsheet.title, sheet_key:)

    ActiveRecord::Base.transaction do
      menu.save!
      menu_item_attrs = items.map do |item|
        {
          category: item[keys.find_index(:category)],
          item_name: item[keys.find_index(:item_name)],
          description: item[keys.find_index(:description)],
          price: item[keys.find_index(:price)],
          image_url: item[keys.find_index(:image_url)],
          menu_id: menu.id
        }
      end
      MenuItem.upsert_all(menu_item_attrs)
    end
    menu
  end

  def sync!
    credentials_file = GoogleDrive::Session.from_config('sheetmenu-362021-8b3508189548.json.erb')
    spreadsheet = credentials_file.spreadsheet_by_key(sheet_key)
    worksheet = spreadsheet.worksheets[0]
    keys = worksheet.rows.first
    items = worksheet.rows[1..-1]
    keys = keys.map { |key| key.parameterize(separator: '_') }.map(&:to_sym)
    ActiveRecord::Base.transaction do
      save!
      menu_item_attrs = items.map do |item|
        {
          category: item[keys.find_index(:category)],
          item_name: item[keys.find_index(:item_name)],
          description: item[keys.find_index(:description)],
          price: item[keys.find_index(:price)],
          image_url: item[keys.find_index(:image_url)],
          menu_id: id
        }
      end
      MenuItem.upsert_all(menu_item_attrs, unique_by: %i[menu_id item_name])
      item_names = items.map { |item| item[keys.find_index(:item_name)] }
      items_names_to_delete = MenuItem.pluck(:item_name) - item_names
      menu_items.where(item_name: items_names_to_delete).destroy_all
    end
    self
  end

  def to_qrcode
    RQRCode::QRCode.new
  end
end

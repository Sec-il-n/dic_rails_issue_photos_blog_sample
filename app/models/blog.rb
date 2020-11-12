class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader
  with_options presence: true do
    validates :title
    validates :content, length: { maximum: 255 }
  end
  belongs_to :user
end

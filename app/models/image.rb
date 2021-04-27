class Image < ApplicationRecord
    belongs_to :snkr, optional: true
    mount_uploader :image, ImageUploader
end

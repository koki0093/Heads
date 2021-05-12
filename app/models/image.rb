class Image < ApplicationRecord
    belongs_to :snkr, optional: true
    belongs_to :offer, optional: true
    mount_uploader :image, ImageUploader
end

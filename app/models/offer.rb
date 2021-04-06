class Offer < ApplicationRecord
    belongs_to :user
    belongs_to :snkr

    mount_uploader :image, ImageUploader
    



end

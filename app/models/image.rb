class Image < ApplicationRecord
    belongs_to :snkr, optional: true
<<<<<<< HEAD
    belongs_to :offer, optional: true
=======
>>>>>>> origin/master
    mount_uploader :image, ImageUploader
end

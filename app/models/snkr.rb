class Snkr < ApplicationRecord
    belongs_to :user
    has_many :offers, dependent: :destroy

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

    mount_uploader :image, ImageUploader

    scope :search, -> (search_params) do
     # search_paramsが空の場合以降の処理を行わない。
     # >> {}.blank?
     # => true
     return if search_params.blank?
     # パラメータを指定して検索を実行する
     name_like(search_params[:name])
     .size_like(search_params[:size])
     .retailer_like(search_params[:retailer])
     .score_from(search_params[:score_from])
     .score_to(search_params[:score_to])
     .usage_from(search_params[:usage_from])
     .usage_to(search_params[:usage_to])
    end

    # nameが存在する場合、nameをlike検索する
    scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }

    # scoreが存在する場合、scoreで範囲検索する
    scope :score_from, -> (from) { where('? <= score', from) if from.present? }
    scope :score_to, -> (to) { where('score <= ?', to) if to.present? }

    # sizeが存在する場合、sizeをlike検索する
    scope :size_like, -> (size) { where('size LIKE ?', "%#{size}%") if size.present? }

    # retailerが存在する場合、retailerをlike検索する
    scope :retailer_like, -> (retailer) { where('retailer LIKE ?', "%#{retailer}%") if retailer.present? }

    # usageが存在する場合、usageで範囲検索する
    scope :usage_from, -> (from) { where('? <= usage', from) if from.present? }
    scope :usage_to, -> (to) { where('usage <= ?', to) if to.present? }

end

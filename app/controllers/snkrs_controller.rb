class SnkrsController < ApplicationController
  before_action :authenticate_user!

        def index
          @search_params = snkrs_search_params
          @snkrs = Snkr.search(@search_params)
        end
        def new
            @snkrs = Snkr.new
            @snkrs.images.build
        end
        def create
          @snkr = Snkr.new(snkrs_params)
          @snkr.user_id = current_user.id
          if @snkr.save
            if params[:images].present?
              params[:images]["image"].each do |img|
                @images = @snkr.images.create(:image => img, :snkr_id => @snkr.id)
              end
            end
            redirect_to :action => "index"
          else
            redirect_to :action => "new"
          end
        end
        def show
          @snkrs = Snkr.find(params[:id])
          @snkr_image = Image.where(snkr_id:@snkrs.id)
      
        end
        def edit
          @snkrs = Snkr.find(params[:id])
          @snkr_image = Image.where(snkr_id:@snkrs.id)
        end

        def update
          @snkrs = Snkr.find(params[:id])
          if @snkrs.update(snkrs_params)
            if params[:images].present?
              params[:images]["image"].each do |img|
                @images = @snkr.images.create(:image => img, :snkr_id => @snkrs.id)
              end
            end
            redirect_to :action => "show", :id => @snkrs.id
          else
            redirect_to :action => "edit"
          end
        end
    
        def destroy
          snkr = Snkr.find(params[:id])
          snkr.destroy
          redirect_to action: :index
        end

      private
        def snkrs_params
          params.require(:snkr).permit(:name, :score, :retailer, :usage, :size, :image, :consent, images_attributes: [:image])
        end

      private
        def snkrs_search_params
          params.fetch(:search, {}).permit(:name, :size, :retailer, :score_from, :score_to, :usage_from, :usage_to)
        end

end

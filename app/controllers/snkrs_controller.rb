class SnkrsController < ApplicationController
  before_action :authenticate_user!

        def index
          @search_params = snkrs_search_params
          @snkrs = Snkr.search(@search_params)
          
        end
        def new
            @snkrs = Snkr.new
        end
        def create
            snkr = Snkr.new(snkrs_params)
            snkr.user_id = current_user.id
            if snkr.save
                redirect_to :action => "index"
            else
              redirect_to :action => "new"
            end
          end
        def show
          @snkrs = Snkr.find(params[:id])
          
      
        end
    
        def destroy
          snkr = Snkr.find(params[:id])
          snkr.destroy
          redirect_to action: :index
        end

      private
        def snkrs_params
          params.require(:snkr).permit(:name, :score, :retailer, :usage, :size, :image)
        end

      private
        def snkrs_search_params
          params.fetch(:search, {}).permit(:name, :size, :retailer, :score_from, :score_to, :usage_from, :usage_to)
        end

end

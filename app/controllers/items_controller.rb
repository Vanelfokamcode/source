class ItemsController < ApplicationController

    before_action :force_login
    
    def index
        # if there is a search filter 
        # if not show all
        if params[:q].present?
           # filtering here
           @items = Item.where("lower(title) LIKE ?","%" + params[:q].downcase + "%") 
        else
          @items = Item.all
        end
    end

    def show
        @item = Item.find(params[:id])
    end
end

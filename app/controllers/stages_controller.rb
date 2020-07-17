class StagesController < ApplicationController
    before_action :set_rave

    def new

    end

    def create
        
    end
   
    def show
    
    end

    private
    def set_rave
        @rave = Rave.find(params[:id])
    end
  
    
end
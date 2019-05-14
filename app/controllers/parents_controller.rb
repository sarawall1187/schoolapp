class ParentsController < ApplicationController

    def new
        @parent = Parent.new
    end
    #signup
    def create 
        @parent = Parent.new(parent_params)
        if @parent.save
            
            session[:user_id] = @parent.id
            binding.pry
            redirect_to @parent
        else 
            render :new
        end
    end

    def show 
        @parent = Parent.find(params[:id])
    end





    private 

    def parent_params
        params.require(:parent).permit(:email, :password, :admin)
    end
end

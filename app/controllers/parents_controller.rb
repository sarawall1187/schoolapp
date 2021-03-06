class ParentsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    before_action :set_parent, only: [:edit, :update, :destroy]
    
    def new
        @parent = Parent.new
    end

    #signup
    def create
        @parent = Parent.new(parent_params)
        if @parent.save
            session[:user_id] = @parent.id
            redirect_to @parent
        else
            render :new
        end
    end

    def show
        set_parent
        @child = Child.find_by(parent_id: params[:parent_id])
        @parent.children.order_by_age
        # @child.order_by_age
    end

    def edit
    end

    def update
        @parent.update(parent_params)
        @parent.save
        redirect_to @parent
    end

    def destroy
        @parent.destroy
        redirect_to root_path
    end





    private

    def set_parent 
        @parent = Parent.find(params[:id])
    end

    def parent_params
        params.require(:parent).permit(:email, :password, :admin)
    end
end

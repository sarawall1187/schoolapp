class SessionsController < ApplicationController



    def new 
        @parent = Parent.new 
    end

    #login
    def create
        # binding.pry
        @parent = Parent.find_by(email: params[:parent][:email])
        if @parent && @parent.authenticate(params[:parent][:password])
            session[:user_id] = @parent.id
            redirect_to parent_path(@parent)
        else
            redirect_to login_path
        end
    end

    #logout
    def destroy 
        session.clear
        redirect_to '/'
    end
end
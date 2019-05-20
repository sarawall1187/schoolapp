class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create, :index]


    def new 
      @parent = Parent.new 
    end

    #login
    def create
      #login with oauth
      if auth_hash 
        @parent = Parent.find_or_create_by_omniauth(auth_hash)
        session[:user_id] = @parent.id
        redirect_to parent_path(@parent)
      #normal login flow
      else
        @parent = Parent.find_by(email: params[:parent][:email])
         if @parent && @parent.authenticate(params[:parent][:password])
            session[:user_id] = @parent.id
            redirect_to parent_path(@parent)
         else
            redirect_to login_path
         end
       end
    end

    #logout
    def destroy 
      session.clear
      redirect_to '/'
    end

    private 

    def auth_hash
      request.env['omniauth.auth']
    end
end
class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create, :index]


    def new 
      @parent = Parent.new 
    end

    #login
    def create
         #login with oauth
        #  raise params.inspect
      if auth 
        #logged in previously
       oauth_email = request.env['omniauth.auth']['info']['email']
        if @parent = Parent.find_by(email: oauth_email)
            session[:user_id] = @parent.id
            redirect_to parent_path(@parent)
        else
            #logged in with FB first time
            @parent = Parent.create(email: oauth_email, password: SecureRandom.hex)
            session[:user_id] = @parent.id
            redirect_to parent_path(@parent)
        end
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

    def auth
      request.env['omniauth.auth']
    end
end
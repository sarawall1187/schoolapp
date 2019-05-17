class ParentsController < ApplicationController

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
        @parent = Parent.find(params[:id])
        @child = Child.find_by(parent_id: params[:parent_id])
    end

    def edit
       @parent = Parent.find(params[:id])
  end

  def update

      @parent = Parent.find(params[:id])

      @parent.update(parent_params)
      @parent.save
      redirect_to @parent
  end




    private

    def parent_params
        params.require(:parent).permit(:email, :password, :admin)
    end
end

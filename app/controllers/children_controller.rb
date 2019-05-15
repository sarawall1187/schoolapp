class ChildrenController < ApplicationController

    def new
        @child = Child.new
    end

    def create
        @child = Child.new(child_params)
        @child.parent_id = current_user.id
        # @child.name = params[:child][:name]
        # @child.age = params[:child][:age]
        # @child.parent_id = params[:child][:parent_id]
        @child.save   
        redirect_to parent_path(current_user)
    end


    private 

    def child_params
        params.require(:child).permit(:name, :age, :parent_id, :teacher_id)
    end
end

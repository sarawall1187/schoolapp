class ChildrenController < ApplicationController

    def new
        @child = Child.new 
        @teachers = Teacher.all.order_by_grade
    end

    def create
        @child = Child.new(child_params)
        @child.parent_id = current_user.id
       if  @child.save   
        redirect_to parent_path(current_user)
       else 
        render :new
       end
    end

    def show 
        set_child
    end

    def edit
        set_child
    end

    def update
        set_child
        @child.update(child_params)
        @child.save
        redirect_to @child
    end

    def destroy
        set_child.destroy
        redirect_to parent_path(@child.parent_id)
    end
    
    private 

    def child_params
        params.require(:child).permit(:name, :age, :parent_id, :teacher_id)
    end

    def set_child
        @child = Child.find_by(id: params[:id])
    end
end

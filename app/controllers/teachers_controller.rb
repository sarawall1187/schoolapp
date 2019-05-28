class TeachersController < ApplicationController
  def new
       if params[:school_id] && @school = School.find_by_id(params[:school_id])
         @teacher = @school.teachers.build
       else
         @teacher = Teacher.new
       end
   end

   def create
       @school = School.find_by_id(params[:school_id])
       @teacher = @school.teachers.build(teacher_params)
       if @teacher.save
           redirect_to school_path(@school)
       else
           render :new
       end
   end

   def show 
     @teacher = Teacher.find_by_id(params[:id]) 
   end

   def index
     @teachers = Teacher.order_by_name 
   end

   private 

   def teacher_params
     params.require(:teacher).permit(:name, :grade_taught, :school_id)
   end
end

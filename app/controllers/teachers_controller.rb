class TeachersController < ApplicationController
  def new
       if params[:school_id] && @school = School.find_by_id(params[:school_id])
         @teacher = @school.teachers.build
       else
         @teacher = Teacher.new 
       end
   end

   def create
    if params[:school_id]
       @school = School.find_by_id(params[:school_id])
       @teacher = @school.teachers.build(teacher_params)
      else
        @teacher = Teacher.new(teacher_params)
      # binding.pry
      end
       if @teacher.save
        respond_to do |f|
          f.html 
          f.json {render json: @teacher}
        end
          #  redirect_to school_path(@school)
       else
           render :new
       end
     
   end

   def show 
     @teacher = Teacher.find_by_id(params[:id]) 
   end

   def index
     @teachers = Teacher.all   
     respond_to do |f|
      f.html 
      f.json {render json: @teachers.order_by_grade}
     end
   end

   private 

   def teacher_params
     params.require(:teacher).permit(:name, :grade_taught, :school_id)
   end
end

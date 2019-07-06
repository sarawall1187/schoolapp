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
     @teachers = Teacher.all  
     @teachers.each do |teacher|
       @school = School.find_by(id: teacher.school_id)
     end
    #  binding.pry
     respond_to do |f|
      f.html 
      f.json {render json: @teachers}
     end
   end

   private 

   def teacher_params
     params.require(:teacher).permit(:name, :grade_taught, :school_id)
   end
end

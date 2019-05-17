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
           redirect_to school_path(@teacher.school_id)
       else
           render :new
       end
   end
end

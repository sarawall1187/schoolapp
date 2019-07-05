class SchoolsController < ApplicationController
    
  def index
       @schools = School.all
    #    @teachers = @school.teachers.order_by_grade
   end

   def show
       @school = School.find(params[:id]) 
       @teachers = @school.teachers.order_by_grade  
       respond_to do |f|
        f.html 
        f.json {render json: @teachers}
       end
   end
end

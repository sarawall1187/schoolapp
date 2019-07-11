class SchoolsController < ApplicationController
    
  def index
       @schools = School.all   
       respond_to do |f|
        f.html 
        f.json {render json: @schools}
       end
   
   end

   def show
       @school = School.find(params[:id]) 
       @teacher = @school.teachers.build
       respond_to do |f|
        f.html 
        f.json {render json: @school, include: [:teachers]}
       end
   end
end

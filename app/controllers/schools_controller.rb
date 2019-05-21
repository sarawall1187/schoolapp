class SchoolsController < ApplicationController
  def index
       @schools = School.all
   end

   def show
       @school = School.find(params[:id])
    #    @school.teachers.order_by_grade
   end
end

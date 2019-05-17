class TeachersController < ApplicationController
  def new
    if params[:school_id] && @school = School.find_by_id(params[:school_id])
        @teacher = @school.teachers.build
    else
      @teacher = Teacher.new
    end
end
end

class CourseController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update, :destroy]
  def index
    if teacher_signed_in?
      @courses = Course.where(:teacher_id => current_teacher.id).order("created_at DESC")
    end
  end
  
  def show
  
  end
  
  def new
    @course = Course.new
  end
  
  def create
    name = params[:name]
    description = params[:desc]
    @course = Course.new(:name => name, :description => description, :teacher_id => current_teacher.id) 
    if @course.save
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @course.update(course_params)
      redirect_to course_path(@course)
    else
      render 'edit'
    end
  end
  
  def destroy
    @course.destroy
    redirect_to course_index_path
  end
  
  private
    def course_params
      params.require(:course).permit(:name, :description)
    end
    
    def find_course
      @course = Course.find(params[:id])
    end
end

# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  before_action :update_user_activity
 
  def homepage
    # get data course
    @courses = Course.includes(:materials).all
    @latest_course = Course.includes(:materials).order(created_at: :desc).first
    render 'pages/home/index'
    I18n.locale = :id


  end
  def course_pages
    @courses = Course.all
    I18n.locale = :id
    render 'pages/courses/course_pages' # Mengambil semua course
  end

  # pages for course/:id
  def course_per_id
    @course = Course.find(params[:id])
    @materials = @course.materials
    render 'pages/courses/[course]'
  end

  private

  def update_user_activity
    if current_user
      current_user.update_attribute(:last_activity_at, Time.current)
    end
  end
end

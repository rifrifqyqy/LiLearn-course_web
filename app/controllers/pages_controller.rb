# app/controllers/pages_controller.rb
class PagesController < ApplicationController

  def homepage
    # get data course
    @courses = Course.includes(:materials).all
    @latest_course = Course.includes(:materials).order(created_at: :desc).first
    render 'pages/home/index'
    I18n.locale = :id


  end
  def course_pages
    @courses = Course.all
    render 'pages/courses/course_pages' # Mengambil semua course
  end

  # pages for course/:id
  def course_per_id
    @course = Course.find(params[:id])
    @materials = @course.materials
    render 'pages/courses/[course]'
  end
end

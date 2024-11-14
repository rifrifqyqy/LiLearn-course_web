class ReviewsController < ApplicationController
  before_action :set_course
  before_action :set_review, only: [:update, :destroy]
# Controller ReviewsController
  def create
    @course = Course.find(params[:course_id])
    @review = @course.reviews.find_or_initialize_by(user: current_user)

    if @review.new_record?
      @review.assign_attributes(review_params)
      if @review.save
        redirect_to request.referer, notice: 'Review successfully added.'
      else
        redirect_to request.referer, alert: 'There was an error with your review.'
      end
    else
      # Jika review sudah ada
      redirect_to request.referer, alert: 'You have already rated this course.'
    end
  end


   # Mengupdate review yang sudah ada
  def update
    if @review.update(review_params)
      redirect_to request.referer, notice: 'Review successfully updated.'
    else
      redirect_to request.referer, alert: 'There was an error updating your review.'
    end
  end

  # Menghapus review
  def destroy
    @review.destroy
    redirect_to request.referer, notice: 'Review successfully deleted.'
  end

  private
  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_review
    @review = @course.reviews.find_by(user: current_user) # Menemukan review yang dimiliki oleh current_user
  end
  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

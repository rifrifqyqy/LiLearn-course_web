class ReviewsController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
    @review = @course.reviews.build(review_params)
    @review.user = current_user # Pastikan user sedang login jika diperlukan
    
    if @review.save
      redirect_to @course, notice: 'Review successfully added.'
    else
      redirect_to @course, alert: 'There was an error with your review.'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

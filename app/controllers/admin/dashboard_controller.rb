class Admin::DashboardController < ApplicationController\
  # admin only restrict
  before_action :require_admin
  def index
    # Mengatur jumlah item per halaman
    items_per_page = 8
    page = params[:page].to_i > 0 ? params[:page].to_i : 1
    skip_items = (page - 1) * items_per_page

    # Mengambil data dengan pagination manual
    @courses = Course.order(created_at: :desc).skip(skip_items).limit(items_per_page)
    @latest_course = Course.order(created_at: :desc).first

    # Menghitung total halaman
    total_courses = Course.count
    @total_pages = (total_courses / items_per_page.to_f).ceil

    # Membuat variabel untuk halaman saat ini
    @current_page = page
    @button_id = params[:button_id] || 'dashboard'
  end
end

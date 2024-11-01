class Admin::DashboardController < ApplicationController\
  # admin only restrict
  before_action :require_admin

  def index

    # pagination area

    # course pagination
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
    if params[:button_id].nil?
      redirect_to admin_dashboard_path(button_id: 'dashboard') and return
    end

    # mengambil data user
    @users = User.all

    # mengambil data user berdasarkan role
    # user with role admin
    @onlyadmin = User.where(role: "admin")
    @onlyuser = User.where(role: "user")
  end
end

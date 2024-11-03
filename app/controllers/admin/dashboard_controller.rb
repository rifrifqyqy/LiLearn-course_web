class Admin::DashboardController < ApplicationController\
  # admin only restrict
  before_action :require_admin

  def index

    # =============== function area ===============
    @total_course = Course.count
    @total_users_registered = User.count
    @total_users_active = User.online.count
    @total_normaluser = User.userdefault.count
    @online_users = User.online.pluck(:id)

    # ================== pagination area ==================

    # course pagination
    # Mengatur jumlah item per halaman
    items_per_page_course = 8
    page_course = params[:page].to_i > 0 ? params[:page].to_i : 1
    skip_items = (page_course - 1) * items_per_page_course

    # Mengambil data dengan pagination manual
    @courses = Course.order(created_at: :desc).skip(skip_items).limit(items_per_page_course)
    @latest_course = Course.order(created_at: :desc).first

    # Menghitung total halaman
    total_courses = Course.count
    @total_pages = (total_courses / items_per_page_course.to_f).ceil

    # Membuat variabel untuk halaman saat ini
    @current_page_course = page_course 
    @button_id = params[:button_id] || 'dashboard'
    if params[:button_id].nil?
      redirect_to admin_dashboard_path(button_id: 'dashboard') and return
    end


    # pagination users
    items_per_page_users = 5
    page_users = params[:page_users].to_i > 0 ? params[:page_users].to_i : 1
    skip_users = (page_users - 1) * items_per_page_users
    @users = User.where(role: 'user').order(created_at: :desc).skip(skip_users).limit(items_per_page_users)
  
    # Menghitung total halaman untuk pengguna
    total_users = User.where(role: 'user').count
    @total_pages_users = (total_users / items_per_page_users.to_f).ceil
    @current_page_users = page_users

    # user with role admin
    @onlyadmin = User.where(role: "admin")
  end
end

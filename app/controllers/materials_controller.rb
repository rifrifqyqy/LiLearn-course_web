class MaterialsController < ApplicationController
  before_action :set_course
  before_action :set_material, only: [:show, :edit, :update, :destroy]

  # GET /courses/:course_id/materials/new
  def new
    @material = @course.materials.new
  end

  # POST /courses/:course_id/materials
  def create
    @material = @course.materials.new(material_params)
    if @material.save
      redirect_to course_path(@course), notice: 'Sukses menambahkan materi'
    else
      render :new
    end
  end

  # GET /courses/:course_id/materials/:id/edit
  def edit
  end

  # PATCH/PUT /courses/:course_id/materials/:id
  def update
    if @material.update(material_params)
      redirect_to course_path(@course), notice: 'Sukses mengupdate materi'
    else
      render :edit
    end
  end

  # DELETE /courses/:course_id/materials/:id
  def destroy
    @material.destroy
    redirect_to course_path(@course), notice: 'Materi berhasil dihapus'
  end

  private

  # Set course based on course_id parameter
  def set_course
    @course = Course.find(params[:course_id])
  end

  # Set material based on the provided ID
  def set_material
    @material = @course.materials.find(params[:id])
  end

  # Strong parameters to whitelist allowed material fields
  def material_params
    params.require(:material).permit(:title, :description, :content, :image)
  end
end

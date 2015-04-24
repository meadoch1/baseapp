class CurriculumsController < ApplicationController
  before_action :set_curriculum, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @curriculums = Curriculum.all
    respond_with(@curriculums)
  end

  def show
    respond_with(@curriculum)
  end

  def new
    @curriculum = Curriculum.new
    respond_with(@curriculum)
  end

  def edit
  end

  def create
    @curriculum = Curriculum.new(curriculum_params)
    @curriculum.save
    respond_with(@curriculum)
  end

  def update
    @curriculum.update(curriculum_params)
    respond_with(@curriculum)
  end

  def destroy
    @curriculum.destroy
    respond_with(@curriculum)
  end

  private
    def set_curriculum
      @curriculum = Curriculum.find(params[:id])
    end

    def curriculum_params
      params.require(:curriculum).permit(:name, :description)
    end
end

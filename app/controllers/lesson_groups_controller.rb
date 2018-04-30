class LessonGroupsController < ApplicationController
  before_action :set_lesson_group, only: [:show, :edit, :update, :destroy]

  # GET /lesson_groups
  # GET /lesson_groups.json
  def index
    @lesson_groups = LessonGroup.all
  end

  # GET /lesson_groups/1
  # GET /lesson_groups/1.json
  def show
  end

  # GET /lesson_groups/new
  def new
    @lesson_group = LessonGroup.new
  end

  # GET /lesson_groups/1/edit
  def edit
  end

  # POST /lesson_groups
  # POST /lesson_groups.json
  def create
        photo.save

    
    @lesson_group = LessonGroup.new(lesson_group_params)


    respond_to do |format|
      if @lesson_group.save
        format.html { redirect_to @lesson_group, notice: 'Lesson group was successfully created.' }
        format.json { render :show, status: :created, location: @lesson_group }
      else
        format.html { render :new }
        format.json { render json: @lesson_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_groups/1
  # PATCH/PUT /lesson_groups/1.json
  def update
    respond_to do |format|
      if @lesson_group.update(lesson_group_params)
        format.html { redirect_to @lesson_group, notice: 'Lesson group was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson_group }
      else
        format.html { render :edit }
        format.json { render json: @lesson_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_groups/1
  # DELETE /lesson_groups/1.json
  def destroy
    @lesson_group.destroy
    respond_to do |format|
      format.html { redirect_to lesson_groups_url, notice: 'Lesson group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_group
      @lesson_group = LessonGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_group_params
      params.require(:lesson_group).permit(:title, :order, :photo)
    end
end

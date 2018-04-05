class LessonCompletedsController < ApplicationController
  before_action :set_lesson_completed, only: [:show, :edit, :update, :destroy]

  # GET /lesson_completeds
  # GET /lesson_completeds.json
  def index
    @lesson_completeds = LessonCompleted.all
  end

  # GET /lesson_completeds/1
  # GET /lesson_completeds/1.json
  def show
  end

  # GET /lesson_completeds/new
  def new
    @lesson_completed = LessonCompleted.new
  end

  # GET /lesson_completeds/1/edit
  def edit
  end

  # POST /lesson_completeds
  # POST /lesson_completeds.json
  def create
    @lesson_completed = LessonCompleted.new(lesson_completed_params)

    respond_to do |format|
      if @lesson_completed.save
        format.html { redirect_to @lesson_completed, notice: 'Lesson completed was successfully created.' }
        format.json { render :show, status: :created, location: @lesson_completed }
      else
        format.html { render :new }
        format.json { render json: @lesson_completed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_completeds/1
  # PATCH/PUT /lesson_completeds/1.json
  def update
    respond_to do |format|
      if @lesson_completed.update(lesson_completed_params)
        format.html { redirect_to @lesson_completed, notice: 'Lesson completed was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson_completed }
      else
        format.html { render :edit }
        format.json { render json: @lesson_completed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_completeds/1
  # DELETE /lesson_completeds/1.json
  def destroy
    @lesson_completed.destroy
    respond_to do |format|
      format.html { redirect_to lesson_completeds_url, notice: 'Lesson completed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_completed
      @lesson_completed = LessonCompleted.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_completed_params
      params.require(:lesson_completed).permit(:lesson_id, :user_id)
    end
end

# frozen_string_literal: true

class QuizzesController < ApplicationController
  before_action :authorize, only: %i[new edit create update destroy]
  before_action :set_quiz, only: %i[show edit update destroy]

  def index
    @quizzes = Quiz.all
  end

  def show; end

  def new
    @quiz = Quiz.new
    question = @quiz.questions.build
    3.times { question.answers.build }
  end

  def edit; end

  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: 'Quiz was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def quiz_params
    params.require(:quiz).permit(:name,
                                 questions_attributes: [:name, :id, :_destroy,
                                                        { answers_attributes: %i[name id _destroy] }])
  end
end

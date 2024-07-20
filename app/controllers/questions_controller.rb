class QuestionsController < ApplicationController
  before_action :set_question!, only: %i[show destroy edit update]

  def show
    @answer = @question.answers.build
    @allanswers = @question.answers.all
    @answers = @question.answers.order(created_at: :desc).page(params[:page]).per(7)
    # Answer.where(question: @question).order(created_at: :desc)
  end

  def destroy
    @question.destroy
    flash[:success] = t('.success')
    redirect_to questions_path
  end

  def edit
  end

  def update
    if !current_user.present?
      flash[:success] = "Изменять без авторизации нельзя!"
      redirect_to questions_path
    elsif current_user.id == @question.user_id
      if @question.update question_params
        flash[:success] = t('.success')
        redirect_to questions_path
        # redirect_to questions_path(anchor: "question-#{@question.id}")
      else
        render :edit
      end
    else
      flash[:success] = "Изменять чужой вопрос нельзя!"
      redirect_to questions_path
    end
  end

  def index
    @questions = Question.where(user_id: current_user.id).order(created_at: :desc).page(params[:page]).per(7)
  end

  def all
    if current_user.present?
      @questions = Question.where(
        "title LIKE ?", "%#{params[:search]}%").where(
          "user_id != ?", current_user.id).order(created_at: :desc).page(params[:page]).per(7)
    else
      @questions = Question.where(
        "title LIKE ?", "%#{params[:search]}%").order(created_at: :desc).page(params[:page]).per(7)
    end
  end

  def new
    @question = Question.new
  end

  def create
    if !current_user.present?
      flash[:success] = "Сначала авторизуйтесь!"
      redirect_to questions_path
    else
      @question = current_user.questions.build question_params
      if @question.save
        flash[:success] = t('.success')
        redirect_to questions_path
      else
        render :new
      end
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def set_question!
    @question = Question.find params[:id]
  end

  def check_user!
    if current_user.present?
      render 
    end
  end
end
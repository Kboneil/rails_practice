class AnswersController < ApplicationController
  def create
    question = Question.find(params[:answer][:question_id])
    answer = question.answers.create(answer_params)

    MainMailer.notify_question_author(answer).deliver_now
    question.answers.create(answer_params)
    session[:current_user_email] = answer_params[:email]
    Answer.create(answer_params)
    redirect_to question
  end

  private

  def answer_params
    params.require(:answer).permit(:email, :body)
  end
end

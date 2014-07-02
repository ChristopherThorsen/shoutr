class TextSubjectsController < ApplicationController
  def create
    text_subject = TextSubject.create(text_subject_params)
    new_shout = {user_id: current_user.id, subject_id: text_subject.id, subject_type: "TextSubject"}

    current_user.shouts.create(new_shout)
    redirect_to :dashboard
  end


  private

  def text_subject_params
    params.require(:text_subject).permit(
      :body,
    )
  end
end

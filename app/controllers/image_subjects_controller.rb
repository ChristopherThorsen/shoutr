class ImageSubjectsController < ApplicationController
  def create
    image_subject = ImageSubject.create(image_subject_params)
    new_shout = {user_id: current_user.id, subject_id: image_subject.id, subject_type: "ImageSubject"}
    current_user.shouts.create(new_shout)
    redirect_to :dashboard
  end



  private

  def image_subject_params
    params.require(:image_subject).permit(
      :url,
    )
  end
end

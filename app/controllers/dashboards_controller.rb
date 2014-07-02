class DashboardsController < ApplicationController
  def show
    @image_subject = ImageSubject.new
    @text_subject = TextSubject.new
    @timeline = current_user.timeline
  end
end

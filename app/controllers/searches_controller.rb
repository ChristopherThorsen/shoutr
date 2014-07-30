class SearchesController < ApplicationController
  def show
    @search_results = User.where("username LIKE ?", "%#{ params[:q]}%")
  end
end

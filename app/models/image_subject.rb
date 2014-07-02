class ImageSubject < ActiveRecord::Base
  has_many :shouts, as: :subject
end

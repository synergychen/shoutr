class SearchesController < ApplicationController
  def show
    query = params[:query]

    users_match = User.where("email ILIKE ?", "%#{query}%")

    text_subject_match = TextSubject.where("body ILIKE ?", "%#{query}%")
    shouts_match_text_subject = text_subject_match.map { |text_sub| text_sub.shout }

    image_subject_match = ImageSubject.where("url ILIKE ?", "%#{query}%")
    shouts_match_image_subject = image_subject_match.map { |image_sub| image_sub.shout }

    @results = users_match + shouts_match_text_subject + shouts_match_image_subject
  end
end

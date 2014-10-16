class TextSubject < ActiveRecord::Base
  has_one :shout, as: :subject

  validates :body, presence: true
end

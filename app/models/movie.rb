class Movie < ApplicationRecord
has_many  :comments
has_many :users, through: :comments, dependent: :destroy

end

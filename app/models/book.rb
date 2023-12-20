class Book < ApplicationRecord
  has_one_attached :image  
  elongs_to :user
end

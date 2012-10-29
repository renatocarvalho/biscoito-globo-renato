class News < ActiveRecord::Base
  attr_accessible :content, :subtitle, :title
  validates :title, :subtitle, :content, presence: true
end
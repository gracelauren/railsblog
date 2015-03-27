class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  validates :title, :presence => true
  validates :entry, :presence => true
  validates :date, :presence => true
  attr_accessible :title, :date, :entry



  default_scope {order('date DESC')}
end

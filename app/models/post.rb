class Post < ActiveRecord::Base
  has_many :comments

  validates :title, :presence => true
  validates :entry, :presence => true
  validates :date, :presence => true


  default_scope {order('date DESC')}end
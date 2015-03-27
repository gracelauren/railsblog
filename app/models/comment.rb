class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :title, :presence => true
  validates :entry, :presence => true
  validates :date, :presence => true


  default_scope {order('date DESC')}
end

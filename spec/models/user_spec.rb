require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :posts }
  it { should have_many :comments }
  it { validate_presence_of :username }
end

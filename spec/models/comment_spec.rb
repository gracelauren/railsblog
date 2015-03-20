require 'rails_helper'

describe Comment do
  it { should validate_presence_of :title }
  it { should validate_presence_of :entry }
  it { should validate_presence_of :date }


  it { should belong_to :post }
end

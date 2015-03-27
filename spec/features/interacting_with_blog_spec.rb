require 'rails_helper'

describe "user interacts with blog" do
  it "signs up a user" do
    visit('/')
    click_link("Sign Up")
    fill_in('Email', :with => 'testing@123.com')
    fill_in('Username', :with => 'tester')
    fill_in('Password', :with => '12345678')
    fill_in('Password confirmation', :with => '12345678')
    click_on "Sign up"
    expects_a_page_to_have_content("Welcome!")
  end

  it "logs in" do
    visit('/')
    user = FactoryGirl.create(:user)
    click_link("Login")
    fill_in('Username', :with => 'TestUser')
    fill_in('Password', :with => '12345678')
    click_button "Login"
    expects_a_page_to_have_content("Logged")
  end

  it "adds a new post" do
    visit('/')
    user = FactoryGirl.create(:user)
    click_link("Login")
    fill_in('Username', :with => 'TestUser')
    fill_in('Password', :with => '12345678')
    click_button "Login"
    click_link("Create New Post")
    expects_a_page_to_have_content("Date")

    fill_in_forms('Test Post Title', 'Test Post Entry')
    click_on "Create Post"
    expects_a_page_to_have_content("Post successfully added!")
    click_link 'The Gouda Life'
    expects_a_page_to_have_content('Create New Post')
  end

  it "edits a post" do
    visit('/')
    user = FactoryGirl.create(:user)
    click_link("Login")
    fill_in('Username', :with => 'TestUser')
    fill_in('Password', :with => '12345678')
    click_button "Login"
    post = FactoryGirl.create(:post)
    visit('/posts')
    click_link 'Test Post Title'
    click_link 'Edit Post'
    fill_in_forms('New Post Title', 'Test Post Entry')
    click_on 'Update Post'
    expects_a_page_to_have_content('New Post Title')
  end

  it "destroys a post" do
    visit('/')
    user = FactoryGirl.create(:user)
    click_link("Login")
    fill_in('Username', :with => 'TestUser')
    fill_in('Password', :with => '12345678')
    click_button "Login"
    post = FactoryGirl.create(:post)
    visit('/posts')
    click_link 'Test Post Title'
    click_link "Delete"
    expect(page).to_not have_content('Test Post Title')
  end

  it "adds a new comment" do
    visit('/')
    user = FactoryGirl.create(:user)
    click_link("Login")
    fill_in('Username', :with => 'TestUser')
    fill_in('Password', :with => '12345678')
    click_button "Login"
    post = FactoryGirl.create(:post)
    visit('/posts')
    click_link 'Test Post Title'
    click_link "Add a Comment"
    fill_in_forms('Test Comment Title', 'Test Comment Entry')
    click_button('Create Comment')
    expects_a_page_to_have_content("Test Comment Title")
  end

  it "edits and destroys a new comment" do
    user = FactoryGirl.create(:user)
    visit('/')
    click_link("Login")
    fill_in('Username', :with => 'TestUser')
    fill_in('Password', :with => '12345678')
    click_button "Login"
    post = FactoryGirl.create(:post)
    visit('/posts')
    click_link 'Test Post Title'
    click_link "Add a Comment"
    fill_in_forms('Test Comment Title', 'Test Comment Entry')
    click_button('Create Comment')
    click_link "EDIT"
    fill_in_forms('New Comment Title', 'New Comment Entry')
    click_on('Update')
    expects_a_page_to_have_content("New Comment Title")

    click_link "DELETE"
    expect(page).to_not have_content('New Comment Title')
  end

end


def fill_in_forms(title, entry)
  fill_in('Title', :with => title)
  fill_in('Entry', :with => entry)
end

def expects_a_page_to_have_content(content)
  expect(page).to have_content(content)
end

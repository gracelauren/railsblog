require 'rails_helper'

describe "user interacts with blog" do
  it "adds a new post" do
    visit('/')
    click_link("Create New Post")
    expects_a_page_to_have_content("Post")

    fill_in_forms('Test Post Title', 'Test Post Entry', '2015/03/20')
    click_on "Create Post"
    expects_a_page_to_have_content("Post successfully added!")
    click_link 'The Gouda Life'
    expects_a_page_to_have_content('A Food Blog')
  end

  it "edits a post" do
    visit('/posts')
    create_a_new_post
    click_link 'Test Post Title'
    expects_a_page_to_have_content('Test Post Entry')

    click_link 'Edit'
    fill_in_forms('New Post Title', 'New Post Entry', '2015/03/20')
    click_on 'Update Post'
    expects_a_page_to_have_content('New Post Title')
    expects_a_page_to_have_content('New Post Entry')
  end

  it "destroys a post" do
    visit('/posts')
    create_a_new_post
    click_link 'Test Post Title'
    click_link "Delete"
    expect(page).to_not have_content('Test Post Title')
  end

  it "adds a new comment" do
    visit('/posts')
    create_a_new_post
    click_link 'Test Post Title'
    click_link "Add a Comment"
    fill_in_forms('Test Comment Title', 'Test Comment Entry', '2015/03/20')
    expects_a_page_to_have_content("Test Comment Title")
  end

  it "edits and destroys a new comment" do
    visit('/posts')
    create_a_new_post
    click_link 'Test Post Title'
    click_link "Add a Comment"
    fill_in_forms('Test Comment Title', 'Test Comment Entry', '2015/03/20')
    click_link "Edit"
    fill_in_forms('New Comment Title', 'New Comment Entry', '2015/03/20')
    expects_a_page_to_have_content("New Comment Title")

    click_link "Delete"
    expect(page).to_not have_content('New Comment Title')
  end

end

def create_a_new_post
  click_link("Create New Post")
  expects_a_page_to_have_content("Post")
  fill_in_forms('Test Post Title', 'Test Post Entry', '2015/03/20')
  click_on "Create Post"
end


def fill_in_forms(title, entry, date)
  fill_in('Title', :with => title)
  fill_in('Entry', :with => entry)
  select('Date', :from => date)
end

def expects_a_page_to_have_content(content)
  expect(page).to have_content(content)
end

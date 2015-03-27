FactoryGirl.define do
  factory(:user) do
    email('TestUser@test.com')
    username('TestUser')
    password('12345678')
    password_confirmation { "12345678" }
    id(1)
  end
  factory(:post) do
    title('Test Post Title')
    entry('Test Post Entry')
    date('2015/March/27-19:12')
    user_id(1)
  end
  factory(:comment) do
    title('Test Comment Title')
    entry('Test Comment Entry')
    date('2015/March/27-19:12')
    user_id(1)
    post_id(1)
  end
end

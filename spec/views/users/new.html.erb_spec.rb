require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :name => "MyText",
      :email => "email@email.com",
      :password_digest => "MyText"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "text_field[name=?]", "user[name]"

      assert_select "text_field[name=?]", "user[email]"

      assert_select "text_field[name=?]", "user[password_digest]"
    end
  end
end

require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "MyText",
      :email => "email@email.com",
      :password_digest => "MyText"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "textarea[name=?]", "user[name]"

      assert_select "textarea[name=?]", "user[email]"
    end
  end
end

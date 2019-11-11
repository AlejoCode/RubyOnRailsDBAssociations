require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "MyText",
      :email => "email@email.com",
      :password_digest => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/email@email.com/)
    expect(rendered).to match(/MyText/)
  end
end

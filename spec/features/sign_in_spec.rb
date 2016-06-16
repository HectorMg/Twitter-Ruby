require 'rails_helper'

describe "the signin process", :type => :feature do
  before do
    @user = FactoryGirl.create :user
  end

  it "signs in successfully" do
    visit "users/sign_in"
    fill_in "Email", with: @user.email
    fill_in "user_password", with: "123456"
    click_button "Log in"

    expect(page).to have_content "Log out"
  end

  it "signs in unsuccessfully" do
    visit "users/sign_in"
    fill_in "Email", with: @user.email
    fill_in "user_password", with: "12356"
    click_button "Log in"

    expect(page).to have_content "Log in"
  end
end

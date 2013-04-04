require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign Up') }
    it { should have_selector('title', text: "Sign Up") }
  end


  describe "signin page" do
    before { visit signin_path }

    it { should have_selector('h1',    text: 'Sign in') }
    it { should have_selector('title', text: "Ruby on Rails Tutorial Sample App | Sign in") }
  end

 
describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end
describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }  

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end


#  describe "User pages" do
#  before { visit user_path }
#    let(:submit) { "Sign in" } 
 #   describe "with valid information" do
  #    it "should not create a user" do
   #     expect { click_button submit }.not_to change(User, :count)
    #  end
    #end
    
    #describe "after saving the user" do
     #   before do
      #  fill_in "Name",         with: "Example User"
       # fill_in "Password",     with: "foobar"
      #end
       # it { should have_link('Sign out') }
      #end
    #end
  #end
end
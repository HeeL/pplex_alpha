require 'spec_helper'

describe UsersController do

  before :each do
    @user = FactoryGirl.create(:user, name: 'Test', min_price: 1, max_price: 2, uid: '123')
    sign_in @user
  end

  describe '#edit' do
    render_views

    it "shows a filled form" do
      get :edit
      response.body.should have_xpath('//input[@name="name" and @value="Test"]')
      response.body.should have_xpath('//input[@name="min_price" and @value="1"]')
      response.body.should have_xpath('//input[@name="max_price" and @value="2"]')
    end
  end

  describe '#update' do
    it "rejects bad params" do
      put :update, uid: '12345'
      @user.reload
      @user.uid.should == '123'
    end

    it "updates user profile" do
      put :update, name: 'Name', min_price: 3, max_price: 7
      @user.reload
      @user.name.should == 'Name'
      @user.min_price.should == 3
      @user.max_price.should == 7
    end
  end

end
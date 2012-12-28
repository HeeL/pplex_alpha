require 'spec_helper'

describe UsersController do

  before :each do
    @user = FactoryGirl.create(:user, name: 'Test', uid: '123')
    @user.learner.min_price = 1
    @user.learner.max_price = 3
    @user.learner.languages = 'Ruby, Test'
    
    @user.teacher.min_price = 5
    @user.teacher.max_price = 7
    @user.teacher.max_price = 7
    @user.teacher.languages = 'Python, Test2'
    @user.save
    @user.reload
    
    sign_in @user
  end

  describe '#edit' do
    render_views

    it "shows a filled form" do
      get :edit
      response.body.should have_xpath("//input[@name='name' and @value='#{@user.name}']")
      
      response.body.should have_xpath("//input[@name='teacher_min_price' and @value='#{@user.teacher.min_price}']")
      response.body.should have_xpath("//input[@name='teacher_max_price' and @value='#{@user.teacher.max_price}']")
      response.body.should have_xpath("//input[@name='teacher_langs' and @value='#{@user.teacher.languages}']")
      
      response.body.should have_xpath("//input[@name='learner_min_price' and @value='#{@user.learner.min_price}']")
      response.body.should have_xpath("//input[@name='learner_max_price' and @value='#{@user.learner.max_price}']")
      response.body.should have_xpath("//input[@name='learner_langs' and @value='#{@user.learner.languages}']")
    end
  end

  describe '#update' do
    it "rejects bad params" do
      put :update, uid: '12345'
      @user.reload
      @user.uid.should == '123'
    end
  end

end
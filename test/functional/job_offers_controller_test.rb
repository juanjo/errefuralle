require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class JobOffersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  context 'basics' do
    setup do
      @user = Factory(:user)
      @user.roles << Role[:admin]
      @user.confirm!
      sign_in @user
    end

    should 'have an index' do
      2.times { Factory(:job_offer, :user => @user) }
      get :index
      assert_template 'index'
      assert_equal( 2, assigns(:job_offers).size )
    end
    
    should 'have a show' do
      job_offer = Factory(:job_offer, :user => @user)
      get :show, :id => job_offer.to_param
      assert_template 'show'
      assert_not_nil( assigns(:job_offer) )
    end
    
    should 'have a new' do
      get :new
      assert_template 'new'
      assert_not_nil( assigns(:job_offer) )
    end
    
    should 'return an alert if error in create' do
      JobOffer.any_instance.stubs(:valid?).returns(false)
      post :create
      assert_template 'new'
      assert_not_nil( flash[:alert] )
    end
    
    should 'create success' do
      job_offer_params = Factory.attributes_for(:job_offer)
      assert_difference "JobOffer.count", 1 do
        post :create, :job_offer => job_offer_params
      end
      assert_redirected_to job_offer_url( assigns(:job_offer) )
      assert_not_nil( flash[:notice] )
    end
    
    should 'have an edit' do
      job_offer = Factory(:job_offer, :user => @user)
      get :edit, :id => job_offer.to_param
      assert_template 'edit'
      assert_not_nil( assigns(:job_offer) )
    end
    
    should 'return an alert if error in update' do
      job_offer = Factory(:job_offer, :user => @user)
      JobOffer.any_instance.stubs(:valid?).returns(false)
      put :update, :id => job_offer.to_param
      assert_template 'edit'
      assert_not_nil( flash[:alert] )
    end
    
    should 'update valid' do
      job_offer = Factory(:job_offer, :user => @user)
      put :update, :id => job_offer.to_param, :job_offer => { :title => 'new title' }
      assert_redirected_to job_offer_url( assigns(:job_offer) )
      job_offer.reload
      assert_equal( 'new title', job_offer.title )
      assert_not_nil( flash[:notice] )
    end
    
    should 'have a destroy' do
      job_offer = Factory(:job_offer, :user => @user)
      delete :destroy, :id => job_offer.to_param
      assert_redirected_to job_offers_url
      assert !JobOffer.exists?(job_offer.id)
      assert_not_nil( flash[:notice] )
    end
  end
end

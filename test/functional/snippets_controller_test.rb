require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class SnippetsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  context 'basics' do
    setup do
      @user = Factory(:user)
      @user.roles << Role[:admin]
      @user.confirm!
      sign_in @user
    end

    should 'have an index' do
      2.times { Factory(:snippet, :user => @user) }
      3.times { Factory(:snippet, :user => @user).expire! }
      4.times { Factory(:snippet, :user => @user).cancel! }
      get :index
      assert_template 'index'
      assert_equal( 2, assigns(:snippets).size )
    end
    
    should 'have a show in html format' do
      snippet = Factory(:snippet, :user => @user)
      get :show, :id => snippet.to_param
      assert_template 'show'
      assert_equal( 'text/html', @response.content_type )
      assert_not_nil( assigns(:snippet) )
    end
    
    should 'have a show in R format' do
      snippet = Factory(:snippet, :user => @user)
      get :show, :id => snippet.to_param, :format => 'R'
      assert_equal( 'text/x-R', @response.content_type )
      assert_equal(snippet.code, @response.body)
    end
    
    should 'have a new' do
      get :new
      assert_template 'new'
      assert_not_nil( assigns(:snippet) )
    end
    
    should 'return an error if error in create' do
      Snippet.any_instance.stubs(:valid?).returns(false)
      post :create
      assert_template 'new'
      assert_not_nil( flash[:error] )
    end
    
    should 'create success' do
      snippet_params = Factory.attributes_for(:snippet)
      assert_difference "Snippet.count", 1 do
        post :create, :snippet => snippet_params
      end
      assert_redirected_to snippet_url( assigns(:snippet) )
      assert_not_nil( flash[:notice] )
    end
    
    should 'have an edit' do
      snippet = Factory(:snippet, :user => @user)
      get :edit, :id => snippet.to_param
      assert_template 'edit'
      assert_not_nil( assigns(:snippet) )
    end
    
    should 'return an error if error in update' do
      snippet = Factory(:snippet, :user => @user)
      Snippet.any_instance.stubs(:valid?).returns(false)
      put :update, :id => snippet.to_param
      assert_template 'edit'
      assert_not_nil( flash[:error] )
    end
    
    should 'update valid' do
      snippet = Factory(:snippet, :user => @user)
      put :update, :id => snippet.to_param, :snippet => { :title => 'new title' }
      assert_redirected_to snippet_url( assigns(:snippet) )
      snippet.reload
      assert_equal( 'new title', snippet.title )
      assert_not_nil( flash[:notice] )
    end
    
    should 'have a destroy' do
      snippet = Factory(:snippet, :user => @user)
      delete :destroy, :id => snippet.to_param
      assert_redirected_to snippets_url
      assert !Snippet.exists?(snippet.id)
      assert_not_nil( flash[:notice] )
    end
  end
end

require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class PostsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  context 'basics' do
    setup do
      @user = Factory(:user)
      @user.roles << Role[:admin]
      @user.confirm!
      sign_in @user
    end

    should 'have an index' do
      2.times { Factory(:post, :user => @user) }
      get :index
      assert_template 'index'
      assert_equal( 2, assigns(:posts).size )
    end
    
    should 'have a show' do
      post = Factory(:post, :user => @user)
      get :show, :id => post.to_param
      assert_template 'show'
      assert_not_nil( assigns(:post) )
    end
    
    should 'have a new' do
      get :new
      assert_template 'new'
      assert_not_nil( assigns(:post) )
    end
    
    should 'return an error if error in create' do
      Post.any_instance.stubs(:valid?).returns(false)
      post :create
      assert_template 'new'
      assert_not_nil( flash[:error] )
    end
    
    should 'create success' do
      post_params = Factory.attributes_for(:post)
      assert_difference "Post.count", 1 do
        post :create, :post => post_params
      end
      assert_redirected_to post_url( assigns(:post) )
      assert_not_nil( flash[:notice] )
    end
    
    should 'have an edit' do
      post = Factory(:post, :user => @user)
      get :edit, :id => post.to_param
      assert_template 'edit'
      assert_not_nil( assigns(:post) )
    end
    
    should 'return an error if error in update' do
      post = Factory(:post, :user => @user)
      Post.any_instance.stubs(:valid?).returns(false)
      put :update, :id => post.to_param
      assert_template 'edit'
      assert_not_nil( flash[:error] )
    end
    
    should 'update valid' do
      post = Factory(:post, :user => @user)
      put :update, :id => post.to_param, :post => { :title => 'new title' }
      assert_redirected_to post_url( assigns(:post) )
      post.reload
      assert_equal( 'new title', post.title )
      assert_not_nil( flash[:notice] )
    end
    
    should 'have a destroy' do
      post = Factory(:post, :user => @user)
      delete :destroy, :id => post.to_param
      assert_redirected_to posts_url
      assert !Post.exists?(post.id)
      assert_not_nil( flash[:notice] )
    end
  end
end

require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class MembersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  context 'basics' do
    setup do
      @user = Factory(:user)
      @user.roles << Role[:admin]
      @user.confirm!
      sign_in @user
    end

    should 'have an index' do
      # admins
      2.times do
        user = Factory(:user)
        user.confirm!
        user.roles << Role[:admin]
      end
      
      # editors
      4.times do
        user = Factory(:user)
        user.roles << Role[:editor]
        user.confirm!
      end
      
      # confirmed
      5.times do
        user = Factory(:user)
        user.confirm!
      end
      
      # not confirmed
      6.times do
        Factory(:user)
      end
      
      get :index
      assert_template 'index'

      assert_equal( 12, assigns(:members).size ) # adding the @user
      assert_equal( 3, assigns(:admins) )        # adding the @user
      assert_equal( 4, assigns(:editors) )
      assert_equal( 5, assigns(:registered) )
      assert_equal( 6, assigns(:unconfirmed) )
    end
        
    should 'have an edit' do
      user = Factory(:user)
      user.confirm!
      get :edit, :id => user.to_param
      assert_template 'edit'
      assert_not_nil( assigns(:member) )
    end
    
    should 'return an alert en edit if the user to be edited is not confirmed' do
      user = Factory(:user)
      get :edit, :id => user.to_param
      assert_redirected_to members_url
      assert_not_nil( flash[:error] )
    end
    
    should 'update valid' do
      user = Factory(:user)
      user.roles << Role[:admin]
      assert( !user.role?(:editor) )
      assert( user.role?(:admin) )
      
      put(
        :update, 
        :id => user.to_param, 
        :user => { :username => 'new_name' },
        :role_id => ['editor']
      )
      
      assert_redirected_to members_url
      assert_not_nil( flash[:notice] )

      user.reload
      assert_equal( 'new_name', user.username )
      assert( user.role?(:editor) )
    end
    
    should 'return an error if error in update' do
      user = Factory(:user)
      User.any_instance.stubs(:valid?).returns(false)
      put :update, :id => user.to_param
      assert_template 'edit'
      assert_not_nil( flash[:error] )
    end

    should 'have a destroy' do
      user = Factory(:user)
      delete :destroy, :id => user.to_param
      assert_redirected_to members_url
      assert !User.exists?(user.id)
      assert_not_nil( flash[:notice] )
    end
    
    # I don't understand this: do you mean 'not possible to destroy the current_user?' instead.
    should 'not possible to destroy the first User' do
      user = User.first
      delete :destroy, :id => user.to_param
      assert_redirected_to members_url
      assert User.exists?(user.id)
      assert_not_nil( flash[:error] )
    end
  end
end

require 'test_helper'

class JobOffersControllerTest < ActionController::TestCase
  include Devise::TestHelpers
    
  def setup
    @user = Factory(:user)
    sign_in @user
  end

  def test_index
    2.times { Factory(:job_offer) }
    get :index
    assert_template 'index'
    assert_equal( 2, assigns(:job_offers).size )
  end

  def test_show
    item = Factory(:item, :shop => @shop)
    get :show, :shop_id => @shop.to_param, :id => item.to_param
    assert_template 'show'
    assert_not_nil( assigns(:item) )
  end

  def test_new
    get :new, :shop_id => @shop.to_param
    assert_template 'new'
    assert_not_nil( assigns(:item) )
  end

  def test_create_invalid
    Item.any_instance.stubs(:valid?).returns(false)
    post :create, :shop_id => @shop.to_param
    assert_template 'new'
    assert_not_nil( flash[:alert] )
  end

  def test_create_valid
    item_params = Factory.attributes_for(:item)
    assert_difference "Item.count", 1 do
      post :create, :shop_id => @shop.to_param, :item => item_params      
    end
    assert_redirected_to backshop_item_url(@shop, assigns(:item))
    assert_not_nil( flash[:notice] )
  end

  def test_edit
    item = Factory(:item, :shop => @shop)
    get :edit, :shop_id => @shop.to_param, :id => item.to_param
    assert_template 'edit'
    assert_not_nil( assigns(:item) )
  end

  def test_update_invalid
    item = Factory(:item, :shop => @shop)
    Item.any_instance.stubs(:valid?).returns(false)
    put :update, :shop_id => @shop.to_param, :id => item.to_param
    assert_template 'edit'
    assert_not_nil( flash[:alert] )
  end

  def test_update_valid
    item = Factory(:item, :shop => @shop)
    put :update, :shop_id => @shop.to_param, :id => item.to_param, :item => { :title => 'new title' }
    assert_redirected_to backshop_item_url(@shop, assigns(:item))
    item.reload
    assert_equal( 'new title', item.title )
    assert_not_nil( flash[:notice] )
  end

  def test_destroy
    item = Factory(:item, :shop => @shop)
    delete :destroy, :shop_id => @shop.to_param, :id => item.to_param
    assert_redirected_to backshop_items_url( @shop )
    assert !Item.exists?(item.id)
    assert_not_nil( flash[:notice] )
  end

end

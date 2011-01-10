require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class StaticPagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  context 'basics' do
    should 'render static pages' do
      StaticPagesController::AVAILABLE_PAGES.each do |page|
        get page.to_sym
        assert_template page
      end
    end
  end
end

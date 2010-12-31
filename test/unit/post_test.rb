require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class PostTest < ActiveSupport::TestCase
  subject { Factory(:post) }

  should belong_to(:user)

  should validate_presence_of   :title
  should validate_uniqueness_of :title
  should ensure_length_of(:title).is_at_least(4).is_at_most(255)
  should have_db_index :title

  should validate_presence_of   :content
  should ensure_length_of(:content).is_at_least(25).is_at_most(1200)

  context 'basics' do
    setup do
      @post  = Factory(:post)
    end

    should 'be converted the content after save' do
      post  = Factory.build(:post)
      assert_nil post.content_html
      post.save
      assert_not_nil post.content_html      
    end

  end

end

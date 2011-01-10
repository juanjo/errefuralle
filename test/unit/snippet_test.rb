require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class SnippetTest < ActiveSupport::TestCase

  subject { Factory(:snippet) }

  should belong_to(:user)

  should validate_presence_of   :title
  should validate_uniqueness_of :title
  should ensure_length_of(:title).is_at_least(4).is_at_most(255)

  should validate_presence_of   :code

  context "basics" do
    setup do
    end

    should 'save the number of lines' do
      snippet = Factory(:snippet, :code => 'Hocus')
      assert_equal 1, snippet.lines
      snippet = Factory(:snippet, :code => "Hocus\nPocus")
      assert_equal 2, snippet.lines
      
    end

    context 'state machine' do

      should 'have state pending just created' do
        snippet = Factory.build(:snippet)
        assert_equal 'pending', snippet.state
      end

      should 'have state published after create' do
        snippet = Factory(:snippet)
        assert_equal 'published', snippet.state
      end
    end
  end

end

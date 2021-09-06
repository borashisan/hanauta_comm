require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(title: "90年代の曲です",
                                      file: "menuettm.mp3")
  end

  #拡張子のテスト

=begin
  test "should be valid" do
    assert @micropost.valid?
  end
=end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "content should be present" do
    @micropost.title = "   "
    assert_not @micropost.valid?
  end

  test "content should be at most 64 character" do
    @micropost.title = "a" * 65
     assert_not @micropost.valid?
  end

  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end
end

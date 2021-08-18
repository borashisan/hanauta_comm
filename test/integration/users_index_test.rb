require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "index including pagination" do
    log_in_as(@user)
    get users_path
    assert_template 'users/index'
    assert_select 'ul.pagination'
    # @users = User.paginate(page: params[:page])
    # User.paginate(page: 1).each do |user|
    # @users = User.page(params[:page]).per(20)
  end
end

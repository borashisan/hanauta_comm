require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end

  test "micropost interface" do
    log_in_as(@user)
    get root_path
    assert_template 'sessions/new'
    assert_select 'ul.pagination'
    #無効な送信(タイトル)
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { micropost: { content: "",
                                                file: ""} }
    end
    assert_select 'div#error_explanation'
    #無効な送信(音声なし)
    title = "80年代の曲だと思います"
    file = "menuettm.mp3"
    #投稿を削除する
    assert_select 'a', text: '削除'
    first_micropost = @user.microposts.page(1).first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end
    #違うユーザーのプロフィールにアクセス
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end
end

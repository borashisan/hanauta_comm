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
    #assert_select 'a[href=?]', '/?page=2'
    #無効な送信(音声なし)
    title = "80年代の曲だと思います"
    file = "menuettm.mp3"
=begin
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { micropost: { title: title, 
                                                file: "" } }
    end
    #有効な送信
    assert_difference 'Micropost.count', 1 do
      post microposts_path, params: { micropost: { title: title,
                                                file: file} }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match title, response.body
=end
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

  #test "micropost should have detail link when root" do
    
  #end
end

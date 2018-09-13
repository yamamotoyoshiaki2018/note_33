module UsersHelper
  # 現在ログイン中ユーザーのページではフォローボタンが出ないようにするためのもの
  def current_user?(user)
    user == current_user
  end
end

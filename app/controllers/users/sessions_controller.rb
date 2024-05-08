class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    # guest_sign_inという名前のアクション
    user = User.guest
    sign_in user
    redirect_to user_path(user), notice: "こんにちは、ゲストさん。"
  end
end
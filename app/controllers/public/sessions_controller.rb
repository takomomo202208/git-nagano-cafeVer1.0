# frozen_string_literal: true

#顧客のログイン機能を管理するコントローラー
class Public::SessionsController < Devise::SessionsController
  #ログイン処理が実行される前に、退会ステータス確認
  before_action :customer_state, only: [:create]

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # 退会しているかを判断するメソッド
  def customer_state
    #sigin_in時に入力されたemailからアカウントを１件取得
    @customer = Customer.find_by(email: params[:customer][:email])

    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    ## 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted == "withdrawal"
      ##trueだった場合、退会しているのでサインアップ画面に遷移する
      flash[:alert] = "このアカウントは退会済みです。"
      redirect_to new_customer_registration_path
    end
    ##falseだった場合、退会していないのでそのままcreateアクションを実行させる処理を実行する
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

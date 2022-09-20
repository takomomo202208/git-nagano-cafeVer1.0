class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #devise利用の機能（ユーザ登録、ログイン認証など）が使われる前にconfigure_permitted_parametersメソッドが実行されます。

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    #configure_permitted_parametersメソッドでは、devise_parameter_sanitizer.permitメソッドを使うことで
    #ユーザー登録(sign_up)の際に、ユーザー姓(first_name)のデータ操作を許可しています。
    #先ほど述べたように、これはストロングパラメータと同様の機能です。
    #privateは記述をしたコントローラ内でしか参照できません。
    #一方、protectedは呼び出された他のコントローラからも参照することができます。

    #カリキュラム「アプリケーションを完成させよう２-６章-controller」を参照
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:frist_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:postal_code])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:telephone_number])
  end
end

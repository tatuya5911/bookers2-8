class UserNotifierMailer < ApplicationMailer

  default :from => "kka76904@gmail.com"
  default :to => "kka76904@gmail.com"

    def send_signup_email(resource)
        @user = resource
        mail( :to => @user.email, :subject => "会員登録が完了しました。" )
    end
end

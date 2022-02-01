class Users::Mailer < Devise::Mailer
  get "verify" , :to => "users/registrations#verify"
end
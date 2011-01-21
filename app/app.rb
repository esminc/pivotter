class Pivotter < Padrino::Application
  register SassInitializer
  register Padrino::Mailer
  register Padrino::Helpers

  get "/" do
    redirect "/admin"
  end
end

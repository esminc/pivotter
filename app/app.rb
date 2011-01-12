class Pivotter < Padrino::Application
  configure do
    register SassInitializer
  end

  get "/" do
    redirect "/admin"
  end
end

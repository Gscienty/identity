module Identity
  class Default < Sinatra::Base
    register Identity::ErrorHandling

    configure do
      set :views, "#{Config.root}/views"
    end

    get "/" do
      redirect to("/login")
    end

    not_found do
      slim :"errors/404", layout: :"layouts/classic"
    end
  end
end
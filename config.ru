require 'rack/action'
require 'rack/router'

class RhizomeBuilderMain < Rack::Action
  def respond
    "home"
  end
end

class RhizomeBuilderAuthorized < Rack::Action
  before_filter :authorize
  def authorize
    @authorized = (ENV["RHIZOME_BUILDER_KEY"] == params[:key])
  end
end

class RhizomeBuilderGet < Rack::Action
  def respond
    "foo"
  end
end

class RhizomeBuilderPost < RhizomeBuilderAuthorized
  def respond
    response['Content-Type'] = "application/json"
    if @authorized
      params.to_json
    else
      {"error": "Forbidden"}.to_json
    end
  end
end

router = Rack::Router.new do
  get "/builder/?" => RhizomeBuilderMain
  post "/builder/key/:key" => RhizomeBuilderPost
end

run router

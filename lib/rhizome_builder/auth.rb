require 'cgi'

module RhizomeBuilder
  module Auth
    def authorized
      #params = Rack::Utils.parse_query @request.query_string
      #if params["key"] == ENV["RHIZOME_BUILDER_KEY"]
      if @params["key"] == ENV["RHIZOME_BUILDER_KEY"]
        return true
      end
      false
    end
  end
end

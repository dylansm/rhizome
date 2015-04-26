require_relative './auth'

module RhizomeBuilder
  class HTTPMethods
    extend Auth
    @request = nil
    @params  = nil

    class << self
      attr_accessor :request
      attr_accessor :params

      def get
        [200, {'Content-Type' => 'text/html'}, ["GET"]]
      end

      def post
        @params = Rack::Utils.parse_query @request.query_string
        if authorized
          [200, {'Content-Type' => 'application/json'}, [{body:"Post"}.to_json]]
        else
          return Errors.new.not_authorized('application/json')
        end
      end
    end
  end
end

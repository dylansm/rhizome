require 'json'

require_relative "./http_methods"
require_relative "./errors"

module RhizomeBuilder
  def self.call(env)
    @request = Rack::Request.new(env)
    method_sym = @request.request_method.downcase.to_sym

    if HTTPMethods.respond_to? method_sym
      HTTPMethods.request = @request
      method_obj = HTTPMethods.method method_sym
      @response = method_obj.call
      return @response
    else
      return Errors.new.bad_request
    end
  end

  private

end

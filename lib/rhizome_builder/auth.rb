module RhizomeBuilder
  module Auth

    #AUTH_ACTIONS = ["post", "put", "delete", "patch"]

    def post
    end

    def authorize!
      key = ENV["RHIZOME_BUILDER_KEY"]
      puts "key = #{key}"
    end
  end
end

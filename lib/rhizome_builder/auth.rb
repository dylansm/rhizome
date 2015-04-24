module RhizomeBuilder
  module Auth
    def authorize!
      key = ENV["RHIZOME_BUILDER_KEY"]
      puts "key = #{key}"
    end
  end
end

require "cenit/collection/shipstation/version"

module Cenit
  module Collection
    require "cenit/collection/shipstation/build"
    require "cenit/client"

    # bundle exec irb -I lib -r 'cenit/collection/shipstation'
    # config = {:push_url => "https://www.cenithub.com/api/v1/push", :connection_token => "My Conn Token", :connection_key => "My Conn Key"}
    # config = {:push_url => "https://www.cenithub.com/api/v1/push", :user_token => "My User Token", :user_key => "My User Key"}
    # Cenit::Collection::Shipstation.push_collection config
    # Cenit::Collection::Shipstation.shared_collection

    @shipstation = Cenit::Collection::Shipstation::Build.new

    # Include Collection Gem dependency
    # require "cenit/collection/[My Dependency Collection]/build"
    # Collection dependency
    # @shipstation.register_dep(Cenit::Collection::[My Dependency Collection]::Build.new)

    def self.push_collection (config)
      Cenit::Client.push(@shipstation.shared_collection.to_json, config)
    end

    def self.show_collection
      @shipstation.shared_collection
    end

    def self.pull_collection (parameters,config)
      @shipstation.shared_collection
    end

    def self.push_sample(model, config)
      Cenit::Client.push(@shipstation.sample_data(model).to_json, config)
    end
  end
end
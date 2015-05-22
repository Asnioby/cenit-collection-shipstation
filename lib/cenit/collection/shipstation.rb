module Cenit
  module Collection
    require File.expand_path(File.join(*%w[ shipstation build ]), File.dirname(__FILE__))
    require "cenit/client"

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
      Cenit::Client.push(@shipstation.sample_model(model).to_json, config)
    end

    def self.import(data)
      @shipstation.import_data(data)
    end
  end
end
require 'cenit/collection/shipstation/version'
require 'cenit/collection/base/build'

module Cenit
  module Collection
    module Shipstation
      class Build < Cenit::Collection::Base::Build
        def initialize
          super(__dir__)
        end
      end
    end
  end
end
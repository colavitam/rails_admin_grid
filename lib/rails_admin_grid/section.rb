require 'rails_admin/config/sections'
require 'rails_admin/config/sections/base'

module RailsAdmin
  module Config
    module Sections
      # Configuration of the explore view
      class Grid < Base
        register_instance_option :thumbnail do
          nil
        end
      end
    end
  end
end
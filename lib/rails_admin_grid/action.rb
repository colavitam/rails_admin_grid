require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
  module Config
    module Actions
      class Grid < Base
        RailsAdmin::Config::Actions.register(self)
        
        register_instance_option :collection do
          true
        end

        register_instance_option :http_methods do
          [:get, :post]
        end

        register_instance_option :route_fragment do
          'grid'
        end

        register_instance_option :controller do
          proc do
            @objects ||= list_entries

            unless @model_config.list.scopes.empty?
              if params[:scope].blank?
                unless @model_config.list.scopes.first.nil?
                  @objects = @objects.send(@model_config.list.scopes.first)
                end
              elsif @model_config.list.scopes.collect(&:to_s).include?(params[:scope])
                @objects = @objects.send(params[:scope].to_sym)
              end
            end
            
            render @action.template_name, status: (flash[:error].present? ? :not_found : 200)
          end
        end

        register_instance_option :link_icon do
          'icon-th-large'
        end
      end
    end
  end
end





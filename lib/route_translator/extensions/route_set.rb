require 'action_dispatch'

module ActionDispatch
  module Routing
    class RouteSet
      def add_localized_route(mapping, path_ast, name, anchor, scope, path, controller, default_action, to, via, formatted, options_constraints, options)
        RouteTranslator::Translator.translations_for(scope, self, name, path, controller, default_action, to, via, formatted, options_constraints, anchor, options) do |*translated_args|
          add_route(*translated_args)
        end

        if RouteTranslator.config.generate_unnamed_unlocalized_routes
          add_route mapping, path_ast, nil, anchor
        elsif RouteTranslator.config.generate_unlocalized_routes
          add_route mapping, path_ast, name, anchor
        end
      end
    end
  end
end

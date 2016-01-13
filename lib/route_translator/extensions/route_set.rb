require 'action_dispatch'

module ActionDispatch
  module Routing
    class RouteSet
      def add_localized_route(mapping, path_ast, name, anchor, scope, path, controller, default_action, to, via, formatted, options_constraints, options)
        RouteTranslator::Translator.translations_for(scope, mapping, path_ast, name, path, controller, default_action, to, via, formatted, options_constraints, anchor, options, self) do |*translated_args|
          add_route(*translated_args)
        end
      end
    end
  end
end

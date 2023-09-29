# frozen_string_literal: true

module Hanami
  module View
    module Rendering
      class Subscope < Scope
        protected

        def method_missing(m, *args, **kwargs, &block)
          ::Hanami::View::Escape.html(
            # FIXME: this isn't compatible with Hanami 2.0, as it extends a view
            # that we want to be frozen in the future
            #
            # See https://github.com/hanami/view/issues/130#issuecomment-319326236
            if @locals.key?(m)
              @locals[m]
            else
              super
            end
          )
        end
      end
    end
  end
end

# frozen_string_literal: true

module RailsControllerServices
  module Extender
    refine String do
      def with(format, args)
        send(format, args)
      end

      # @return [Array<String>]
      def actions(args)
        args.map { |arg| [self, arg].join('#') }
      end
    end

    refine Array do
      def with(format, args)
        send(format, args)
      end

      # @return [Array]
      def models(args)
        args.map { |arg| map { |str| [str, arg].join('-') } }.flatten
      end
    end
  end
end

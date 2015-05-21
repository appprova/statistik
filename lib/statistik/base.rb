module Statistik
  class Base
    extend Forwardable

    class << self
      attr_reader :api_methods,
                  :relationships

      @@relationships = {}

      def setup_delegators(*delegators)
        @api_methods = delegators
        def_delegators *delegators
      end

      def client
        @client ||= Statistik::Client.new
      end

      def parse_with_class(hash)
        hash.inject(hash) do |h, (k,v)|
          if @@relationships.include?(k.to_sym)
            h[k] = Object.const_get(@@relationships[k.to_sym]).new v; h
          else
            h[k] = v; h
          end
        end

        self.new hash
      end

      def relationship(relationship)
        klass = "mock_#{relationship.to_s}".camelize
        @@relationships[relationship] = "Statistik::#{klass}"
      end

      def request(path_pattern, params, options)
        parse_with_class client.request(path_pattern, params, options)
      end
    end

    def initialize(hash)
      @struct = OpenStruct.new hash
    end

    def api_methods
      self.class.api_methods
    end
  end
end
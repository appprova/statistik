module Statistik
  class Mock
    class << self
      def find(id, options = {})
        request('/mocks/:id/', id, options)
      end
    end
  end
end
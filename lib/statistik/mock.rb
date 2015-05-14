module Statistik
  class Mock < Base

    setup_delegators :@struct, :mock_id,
                               :url,
                               :questions_count,
                               :answers_count,
                               :answers_correct_count,
                               :answers_correct_rate,
                               :users_count,
                               :comparison,
                               :school

    relationship :comparison
    relationship :school

    class << self
      def find(id, options = {})
        request('mocks/:id', id, options)
      end
    end
  end
end
module Statistik
  class MockComparison < Base
    setup_delegators :@struct, :answers_count,
                               :answers_correct_count,
                               :answers_correct_rate,
                               :users_count
  end
end
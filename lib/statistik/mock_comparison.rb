module Statistik
  class MockComparison < Base
    setup_delegators :@struct, :answers_count,
                               :answers_correct_count,
                               :answers_correct_rate,
                               :question_answers_count,
                               :question_answers_rate,
                               :users_count,
                               :questions_count
  end
end
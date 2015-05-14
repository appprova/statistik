module Statistik
  class MockSchool < Base
    setup_delegators :@struct, :school_id,
                               :answers_count,
                               :answers_correct_count,
                               :answers_correct_rate,
                               :users_count
  end
end
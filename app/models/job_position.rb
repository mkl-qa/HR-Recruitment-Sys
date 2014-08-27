class JobPosition < ActiveRecord::Base
  default_scope -> { order('dept DESC') }

end

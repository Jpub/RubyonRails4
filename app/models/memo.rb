class Memo < ActiveRecord::Base
  belongs_to :memoable, polymorphic: true
end

class Stage < ApplicationRecord
  belongs_to :raves, optional: true
  belongs_to :artists, optional: true
end

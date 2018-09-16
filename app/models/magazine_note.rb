class MagazineNote < ApplicationRecord
  belongs_to :magazine
  belongs_to :note
end

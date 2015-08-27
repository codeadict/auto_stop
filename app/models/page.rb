class Page < ActiveRecord::Base

  scope :servicios, -> {
    where(layout: 1)
  }

  scope :nosotros, -> {
    where(layout: 2)
  }

end

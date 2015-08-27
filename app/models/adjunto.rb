class Adjunto < ActiveRecord::Base
  belongs_to :estado_vehiculo

  has_attached_file :archivo,
                    :path => ":rails_root/public/adjuntos/:id/:filename",
                    :url  => "/adjuntos/:id/:filename"

  do_not_validate_attachment_file_type :archivo
end
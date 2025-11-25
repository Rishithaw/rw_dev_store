# app/models/active_storage/blob.rb
class ActiveStorage::Blob < ApplicationRecord
  self.table_name = "active_storage_blobs"

  def self.ransackable_attributes(auth_object = nil)
    %w[id filename content_type metadata byte_size checksum created_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end

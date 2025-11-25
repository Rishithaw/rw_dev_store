# app/models/active_storage/attachment.rb
class ActiveStorage::Attachment < ApplicationRecord
  self.table_name = "active_storage_attachments"

  def self.ransackable_attributes(auth_object = nil)
    %w[id name record_type record_id blob_id created_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[blob]
  end
end

class ReleaseSerializer < ActiveModel::Serializer
  attributes :id, :artist_id, :catalogue_number, :expense_ids, :name, :created_at, :updated_at
end

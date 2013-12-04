class ReleaseSerializer < ActiveModel::Serializer
  attributes :id, :artist_id, :catalogue_number, :name, :created_at, :updated_at
end

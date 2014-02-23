class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :created_at, :updated_at, :release_ids, :author_id
end

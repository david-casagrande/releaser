class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :description, :cost, :release_id, :created_at, :updated_at, :author_id
end

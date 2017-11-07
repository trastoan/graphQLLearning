GraphQLLearningSchema = GraphQL::Schema.define do
  mutation(Types::MutationType)
  query(Types::QueryType)

  id_from_object lambda { |object, _definition, _ctx|
    GraphQL::Schema::UniqueWithinType.encode(object.class.name, object.id)
  }
  
end

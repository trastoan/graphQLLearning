Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  
  field :allPerformances, !types[Types::PerformanceType]  do
    resolve -> (obj, args, ctx) { Performance.all }
  end
  
end

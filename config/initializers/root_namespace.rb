module Frest
  RootNamespaceID = '70ce7259-dce7-418b-9242-07b66eb8ab8f'
  RootNamespace = Namespace.find_or_create_by id: RootNamespaceID, name: 'root'
end
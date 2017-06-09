require 'rdf'
require 'rdf/ntriples'
require 'net/http'
require 'openssl'

# Read the patent n-triples data
graph = RDF::Graph.load('patent_data.nt')

#Inspect the triples and obtain all unique values
puts graph.subjects
puts graph.predicates
puts graph.objects

# Enumerating all values
# This method yields a unique statement component in the graph,
# Making sure no component is repeated twice.
graph.each_subject { |value| puts value.inspect }
graph.each_predicate { |value| puts value.inspect }
graph.each_object { |value| puts value.inspect }

# Read the RDF data
RDF::Reader.open('patent_data.nt') do |reader|
  reader.each_statement do |statement|
    puts statement.inspect
  end
end

url = 'http://patents.data.gov.uk/id/agents/0023780d0be78ad1d314afedd4b34b94'

# Parsing RDF statements from a string
input = open('patent_data.nt').read

RDF::Reader.for(:ntriples).new(input) do |reader|
  reader.each_statement do |statement|
    puts statement.inspect    
  end
end

graph.query([RDF::URI(url), RDF::URI("http://www.w3.org/2000/01/rdf-schema#label"), nil]) do |statement|
  puts statement.object.to_s
end

# Query with wild card components
graph.query([nil, ])

# display the result on the screen
puts graph.dump(:ntriples)

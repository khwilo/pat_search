require 'rubygems'
require 'rdf'
require 'linkeddata'
require 'sparql'

queryable = RDF::Repository.load("patent_data.nt")

# Retrieve the inventors, invention, dates
solution = SPARQL.parse(%(
  SELECT DISTINCT ?invention
  WHERE {
    ?s <http://patents.data.gov.uk/def/patents/inventor> ?inventor .
    ?s <http://www.w3.org/2000/01/rdf-schema#label> ?invention .
    ?s <http://patents.data.gov.uk/def/patents/filingDate> ?fDate .
    ?s <http://patents.data.gov.uk/def/patents/lodgedDate> ?lDate .
    ?s <http://patents.data.gov.uk/def/patents/agent> ?agentsID .
    ?s <http://patents.data.gov.uk/def/patents/applicant> ?applicants .
    ?applicants <http://patents.data.gov.uk/def/patents/address> ?address .
    ?applicants <http://www.w3.org/2000/01/rdf-schema#label> ?organization .
    ?s <http://purl.org/dc/terms/subject> ?bis .
    ?applicants <http://research.data.gov.uk/def/project/location> ?locationURI .
    ?locationURI <http://research.data.gov.uk/def/project/postcode> ?postcode .
    ?locationURI <http://www.w3.org/2003/01/geo/wgs84_pos#lat> ?lat .
    ?locationURI <http://www.w3.org/2003/01/geo/wgs84_pos#long> ?lon .
  }
  LIMIT 10
))

result = solution.execute(queryable)
puts result.to_json

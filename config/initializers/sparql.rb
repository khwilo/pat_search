require 'rubygems'
require 'rdf'
require 'linkeddata'
require 'sparql'

def sparql_query
    repository = RDF::Repository.load(File.expand_path(File.dirname(__FILE__) + "/../../script/patent_data.nt"))
    #repository = RDF::Repository.load("patent_data.nt")
    
    # Retrieve the inventors, invention, dates
    query = SPARQL.parse(%(
      SELECT DISTINCT ?invention ?fDate ?lDate ?address ?organization ?postcode 
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
      LIMIT 5
    ))

    solution = query.execute(repository)
    @result  = solution.to_json
    @test    = JSON.parse(@result) 
    #@test["results"]["bindings"][0]["invention"]["value"]
    #searchCount = @test["results"]["bindings"]
    #length = searchCount.length
    #searchCount[0]["invention"]["value"]
    #for k in 0...length
    #    invention    = searchCount[k]["invention"]["value"]
    #    filingDate   = searchCount[k]["fDate"]["value"]
    #    lodgedDate   = searchCount[k]["lDate"]["value"]
    #    address      = searchCount[k]["address"]["value"]
    #    organization = searchCount[k]["organization"]["value"]
    #    postcode     = searchCount[k]["postcode"]["value"]
    #    puts postcode
    #end
    #searchCount.each do |solution|
    #    solution.count
    #end

    #puts length
    #return inventor
    #return @inventor
    #@test.length
    return @test
end

#def findLength
#  return @count
#end

#RESULT = sparql_query

#puts @count
puts sparql_query

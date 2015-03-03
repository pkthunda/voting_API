# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Candidate.create(name: "John", party: "Repulican")
Candidate.create(name: "Bill", party: "Democrat")
Voter.create(name: "Michael", party: "Republican")
Voter.create(name: "Yang", party: "Democrat")
Vote.create(voter_id: 1, candidate_id: 1)
Vote.create(voter_id: 2, candidate_id: 2)

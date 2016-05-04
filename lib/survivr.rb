require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"
require_relative "colorizr"
String.create_colors

#After your tests pass, uncomment this code below
#=========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

# # Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))

# # Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
  puts "Each tribe will compete in 8 gruesome challanges, a member from each losing tribe will be voted off.".white
  8.times do
    losing_tribe = @borneo.immunity_challenge
    losers = losing_tribe.members.shuffle!(random: Random.new(1))
    immune = losers.sample
    losing_tribe.tribal_council(immune: immune)
  end
end

def phase_two
  3.times do
    @borneo.individual_immunity_challenge
  end
end

def phase_three
  puts "In phase three the tribe will compete in seven more individual challanges. The individuals that are voted off will become the Jury and vote for a final Survivr!".white
  7.times do
    jury_member = @borneo.individual_immunity_challenge
    @jury.add_member(jury_member)
  end
end

# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
puts "In the second phase of Survivr the original two tribes will merge to form one tribe. The tribe will compete in individual chalanges and a loser will be voted off.".white
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner

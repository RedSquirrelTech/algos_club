require 'benchmark'
require_relative 'test_array'
require '../lib/algos_club'
require '../lib/algos_club/sorting'

# TODO: improvement - modify this to take input from the terminal
""" Instructions """
# add your contenders, choose from:
  # Bubble Sort
  # Selection Sort
  # Merge Sort
  # Quick Sort
  # Insertion Sort
  # Heap Sort
  # Tim Sort
red_corner = "Bubble Sort"
blue_corner = "Insertion Sort"
# add the array size
array_size = 100
# run the file in the terminal ("ruby battle.rb")


""" 👇 This is where the magic happens 👇 """
# build array to be sorted
raise Exception.new "Array size has a maximum of 3200" if array_size > 3200
start_index = rand(NUMS.length - array_size)
end_index = start_index + array_size
array_to_be_sorted = NUMS[start_index...end_index]

# get contenders
contender_stable = {
  "bubble sort" => AlgosClub::Sorting.method(:bubble_sort!),
  "selection sort" => AlgosClub::Sorting.method(:selection_sort!),
  "merge sort" => AlgosClub::Sorting.method(:merge_sort),
  "quick sort" => AlgosClub::Sorting.method(:quick_sort!),
  "insertion sort" => AlgosClub::Sorting.method(:insertion_sort!),
  "heap sort" => AlgosClub::Sorting.method(:heap_sort),
  "tim sort" => AlgosClub::Sorting.method(:tim_sort_no_gallop),
}
contender_1 = contender_stable[red_corner.downcase]
raise Exception.new "Your choice for red corner was not found!" if !contender_1
contender_2 = contender_stable[blue_corner.downcase]
raise Exception.new "Your choice for blue corner was not found!" if !contender_2

# announce the contenders
introductions = [
  "ANNOUNCER: In the red corner we have #{red_corner}, and in the blue corner we have #{blue_corner}.",
  "ANNOUNCER: May the fastest algorithm win!",
  "ANNOUNCER: #{red_corner}, are you ready?",
  "#{red_corner}: Yes!",
  "ANNOUNCER: #{blue_corner}, are you ready?",
  "#{blue_corner}: I am!",
  "ANNOUNCER: Protect yourselves at all times, touch gloves, and come out fighting!",
]
0.upto(introductions.length - 1) do |idx|
  puts introductions[idx]
  sleep rand()
end
print "ANNOUNCER: "
countdown = "3...2...1..."
0.upto(countdown.length - 1) do |idx|
  print countdown[idx]
  sleep 0.25
end
puts "FIGHT!!\n\n"

# add fight sounds, from https://www.66batmania.com/trivia/bat-fight-words/
fight_sounds = [
  '🥊', '💥', '🤪', '😮‍💨', '😤', '😖', '🤕', '💀', '😪', '💨', '🤬', '🥴',
  '😨', '🗯', '🦸', '🦹', '🏃', '🕺', '🤸', '🤼', '📸', '🩸', '❗', 'AIEEE!',
  'AIIEEE!', 'ARRGH!', 'AWK!', 'AWKKKKKK!', 'BAM!', 'BANG!', 'BANG-ETH!',
  'BIFF!', 'BLOOP!', 'BLURP!', 'BOFF!', 'BONK!', 'CLANK!', 'CLANK-EST!',
  'CLASH!', 'CLUNK!', 'CLUNK-ETH!', 'CRRAACK!', 'CRASH!', 'CRRAACK!',
  'CRUNCH!', 'CRUNCH-ETH!', 'EEE-YOW!', 'FLRBBBBB!', 'GLIPP!', 'GLURPP!',
  'KAPOW!', 'KAYO!', 'KER-SPLOOSH!', 'KERPLOP!', 'KLONK!', 'KLUNK!',
  'KRUNCH!', 'OOOFF!', 'OOOOFF!', 'OUCH!', 'OUCH-ETH!', 'OWWW!', 'OW-ETH',
  'PAM!', 'PLOP!', 'POW!', 'POWIE!', 'QUNCKKK!', 'RAKKK!', 'RIP!',
  'SLOSH!', 'SOCK!', 'SPLATS!', 'SPLATT!', 'SPLOOSH!', 'SWAAP!', 'SWISH!',
  'SWOOSH!', 'THUNK!', 'THWACK!', 'THWACKE!', 'THWAPE!', 'THWAPP!', 'UGGH!',
  'URKKK!', 'VRONK!', 'WHACK!', 'WHACK-ETH!', 'WHAM-ETH!', 'WHAMM!', 'WHAMMM!',
  'WHAP!', 'Z-ZWAP!', 'ZAM!', 'ZAMM!', 'ZAMMM!', 'ZAP!', 'ZAP-ETH', 'ZGRUPPP!',
  'ZLONK!', 'ZLOPP!', 'ZLOTT!', 'ZOK!', 'ZOWIE!', 'ZWAPP!', 'ZZWAP!', 'ZZZZZWAP!',
]
0.upto(rand(5..10)) do |_|
  print fight_sounds[rand(0..fight_sounds.length - 1)]
  sleep rand()
end
puts "\n\n"

# run benchmark reports
# TODO: improvement - run benchmark reports 100 times and get the average runtime
contender_1_result = Benchmark.realtime { contender_1.call(array_to_be_sorted) }
contender_2_result = Benchmark.realtime { contender_2.call(array_to_be_sorted) }

# calculate winner, and by how much
winner = contender_1_result > contender_2_result ? red_corner : blue_corner
winner_corner = winner == red_corner ? 'red corner' : 'blue corner'
winning_margin = [contender_1_result, contender_2_result].max - [contender_1_result, contender_2_result].min

# announce winner
# TODO: improvement - give a better win margin statistic, 0.00007 doesn't mean much, maybe give it as a fraction like "2x faster"?
results = [
  "ANNOUNCER: And the winner is, by a margin of #{winning_margin} seconds...",
  "ANNOUNCER: ...your chaaaaaaaampion...",
  "ANNOUNCER: ...",
  "ANNOUNCER: ...in the #{winner_corner}, #{winner.upcase}!!!",
]
0.upto(results.length - 1) do |idx|
  puts results[idx]
  sleep rand()
end
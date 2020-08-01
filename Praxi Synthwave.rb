use_bpm 84

# Base Arpeggio

arp1 = [:gs4, :b4, :ds5, :fs5]
arp2 = [:ds4, :fs4, :as4, :cs5]

live_loop :arpeggio do
  use_synth :prophet
  
  with_fx :reverb, room: 0.8, mix: 0.6 do
    32.times do
      play arp1[0], release: 0.25
      sleep 0.25
      
      arp1 = arp1.rotate
    end
    
    32.times do
      play arp2[0], release: 0.25
      sleep 0.25
      
      arp2 = arp2.rotate
    end
  end
end

# Drums

live_loop :snare do
  ##| stop
  
  sample :drum_cymbal_closed, amp: 1
  sleep 0.25
end

live_loop :drums do
  ##| stop
  
  sample :drum_heavy_kick, amp: 2
  sleep 1
  
  sample :drum_snare_hard, rate: 0.75, amp: 0.8
  sleep 1
end

# Melody

live_loop :melody do
  sync :arpeggio
  use_synth :blade
  
  ##| stop
  
  with_fx :reverb, room: 0.8, amp: 2 do
    2.times do
      
      play :gs5, sustain: 3
      sleep 2
      play :fs6
      sleep 1
      
      play :gs6, release: 0.25
      sleep 0.25
      play :ds6, release: 0.25
      sleep 0.25
      play :b5, release: 0.25
      sleep 0.25
      
      play :ds6, sustain: 2, release: 1.25
      sleep 3.25
      
      play :cs6, release: 0.25
      sleep 0.25
      play :ds6, release: 0.25
      sleep 0.25
      play :cs6, release: 0.25
      sleep 0.25
      
      play :gs5, sustain: 2, release: 1.25
      sleep 3.25
      
      play :cs6, release: 0.25
      sleep 0.25
      play :ds6, release: 0.25
      sleep 0.25
      play :cs6, release: 0.25
      sleep 0.25
      
      play :gs5, sustain: 1, release: 0.75
      sleep 1.75
      
      play :b5, release: 0.5
      sleep 0.5
      play :as5
      sleep 1
      play :b5, release: 0.5
      sleep 0.5
      play :as5, release: 0.5
      sleep 0.5
    end
  end
end


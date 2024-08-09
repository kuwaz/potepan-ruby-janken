# ジャンケンの手を定義
hands = ["グー", "チョキ", "パー"]
directions = ["上", "下", "左", "右"]

def get_input(prompt, choices)
  loop do
    puts prompt
    choices.each_with_index { |choice, index| puts "#{index}: #{choice}" }
    input = gets.chomp.to_i
    return input if input.between?(0, choices.length - 1)
    puts "不正な値です。もう一度入力してください。"
  end
end

def janken(hands)
  player_hand = get_input("ジャンケンの手を選んでください:", hands)
  computer_hand = rand(3)

  puts "あなたの手: #{hands[player_hand]}"
  puts "コンピュータの手: #{hands[computer_hand]}"

  if player_hand == computer_hand
    puts "あいこです。"
    return :draw
  elsif (player_hand == 0 && computer_hand == 1) || (player_hand == 1 && computer_hand == 2) || (player_hand == 2 && computer_hand == 0)
    puts "あなたの勝ちです！"
    return :player_win
  else
    puts "コンピュータの勝ちです。"
    return :computer_win
  end
end

def acchi_muite_hoi(directions, winner)
  if winner == "あなた"
    puts "あなたのターン: 指を差す方向を選んでください。"
    player_direction = get_input("方向を選んでください:", directions)
    computer_direction = rand(4)

    puts "あなたの方向: #{directions[player_direction]}"
    puts "コンピュータの方向: #{directions[computer_direction]}"

    if player_direction == computer_direction
      puts "あなたの勝利です！"
      return true
    else
      puts "勝負がつきませんでした。"
      return false
    end
  elsif winner == "コンピュータ"
    puts "あなたのターン: 顔を向ける方向を選んでください。"
    computer_direction = rand(4)
    player_direction = get_input("顔を向ける方向を選んでください:", directions)

    puts "コンピュータの方向: #{directions[computer_direction]}"
    puts "あなたの方向: #{directions[player_direction]}"

    if player_direction == computer_direction
      puts "コンピュータの勝利です。"
      return true
    else
      puts "勝負がつきませんでした。"
      return false
    end
  end
end

# メインループ
loop do
  result = janken(hands)
  next if result == :draw

  if result == :player_win
    break if acchi_muite_hoi(directions, "あなた")
  elsif result == :computer_win
    break if acchi_muite_hoi(directions, "コンピュータ")
  end
end

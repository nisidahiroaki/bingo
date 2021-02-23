S = gets.to_i
# ビンゴカード入力
bingo_card = Array.new(S){ gets.split }
word_list  = bingo_card.flatten

# ワード入力
N = gets.to_i
hit_words = Array.new(N){ gets.chomp }

hit_list = Array.new(S*S)
hit_words.each do |hit|
  if ix = word_list.find_index(hit)
    hit_list[ix] = true
  end
end

hit_card = hit_list.each_slice(S).to_a

# ビンゴ判定 
## 斜め判定
naname1 = Array.new(S){|i| hit_card[i][i] }.all?
naname2 = Array.new(S){|i| hit_card[i][-i-1] }.all?
## 横判定
yoko = hit_card.any?(&:all?)
## 縦判定
tate = hit_card.transpose.any?(&:all?)

## 結果出力
if yoko || tate || naname1 || naname2
  puts "yes"
else
  puts "no"
end
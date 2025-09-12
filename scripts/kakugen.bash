#!/bin/bash

# 格言リスト
# 各要素は「日本語\n英語\n人物名」の形式で記述します。
# 新しい格言を追加する場合は、このリストに追記してください。
quotes=(
  "明日死ぬかのように生きよ。永遠に生きるかのように学べ。\nLive as if you were to die tomorrow. Learn as if you were to live forever.\n- Mahatma Gandhi"
  "夢見ることができれば、それは実現できる。\nIf you can dream it, you can do it.\n- Walt Disney"
  "あなたの時間は限られている。だから他人の人生を生きたりして無駄に過ごしてはいけない。\nYour time is limited, so don't waste it living someone else's life.\n- Steve Jobs"
  "知るは力なり。\nKnowledge is power.\n- Francis Bacon"
  "終わりよければすべてよし。\nAll's well that ends well.\n- William Shakespeare"
  "困難の中に機会がある。\nIn the middle of difficulty lies opportunity.\n- Albert Einstein"
  "千里の道も一歩から。\nA journey of a thousand miles begins with a single step.\n- 老子 (Lao Tzu)"
  "求めよ、さらば与えられん。\nAsk, and it will be given to you.\n- 聖書 (The Bible)"
  "自分自身でいること。それが他の誰にもできないことだから。\nBe yourself; everyone else is already taken.\n- Oscar Wilde"
  "速さも大事だが、正確さがすべてだ。\nFast is fine, but accuracy is everything.\n- Wyatt Earp"
  "幸福は旅の途中にあるものであり、目的地ではない。\nHappiness is not something ready made. It comes from your own actions.\n- Dalai Lama" 
  "人生は短い。笑い続けよう。\nLife is short. Smile while you still have teeth.\n- Mallory Hopkins"
  "自分を信じることが、すべての成功の始まりだ。\nBelieve in yourself and all that you are. Know that there is something inside you that is greater than any obstacle.\n- Christian D. Larson"
  "未来は今日始まる。明日ではない。\nThe future starts today, not tomorrow.\n- Pope John Paul II"
  "成功は最終的なものではなく、失敗も致命的なものではない。重要なのは続ける勇気だ。\nSuccess is not final, failure is not fatal: It is the courage to continue that counts.\n- Winston Churchill"
  "あなたができると思うこと、できないと思うこと、どちらも正しい。\nWhether you think you can or you think you can't, you're right.\n- Henry Ford"
  "信じると捨てることは同じこと。\nBelieving and letting go are the same thing.\n- Shigeru Akagi"
  "他人から常軌を逸していると思われるようなことをやっていないとしたら、あなたは間違っている。\nIf you're not doing something that seems crazy to others, you're doing it wrong.\n- Larry Page"
  "行動がすべてを変える。\nAction is the foundational key to all success.\n- Pablo Picasso"
  "お前を信じる俺を信じろ。\nBelieve in the me that believes in you.\n- Kamina (Tengen Toppa Gurren Lagann)"
  "唯一の真の英知は、自分が何も知らないということを知ることである。\nThe only true wisdom is in knowing you know nothing.\n- Socrates"
)

# 格言の総数を取得
num_quotes=${#quotes[@]}

# 0から (総数-1) までのランダムなインデックスを生成
index=$(($RANDOM % num_quotes))

# ランダムに選ばれた格言を出力
# -e オプションで \n (改行) を解釈させる
echo -e "${quotes[$index]}"

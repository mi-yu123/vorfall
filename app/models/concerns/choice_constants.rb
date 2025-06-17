module GameConstants
  ROOMS = {
    start: {
      title: "見知らぬ寝室",
      description: "目を覚ますと、見知らぬ寝室にいた。\n\n[...]",
      room_type: :start
    },
    mirror: {
      title: "女性の部屋（鏡台）",
      description: "ヒビの入った鏡に"私"が映る。[...]",
      room_type: :choice
    },
    doll: {
      title: "子供部屋（人形）",
      description: "整然と並ぶ人形たち。どれもパーツが欠けている。だが、その欠落はどこか"計画的"に見える。\n" \
                "私の目、腕、脚。どれかが似ている気がして、息が苦しくなる。\n" \
                "どれを戻してあげる？",
      room_type: :choice
    },
    diary: {
      title: "書斎（日記）",
      description: "日記にはこう書かれている。\n" \
                "「今年も祝祭の季節がやってきた。どうか、間違えませんように。」\n" \
                "間違えてはいけない？誰のために？私のため？それとも——",
      room_type: :puzzle
    },
    tv: {
      title: "リビング（テレビ）",
      description: "テレビが勝手に点いている。映っているのはこの家の廊下、階段、今いる部屋——。\n" \
                  "その画面の中で、誰かがゆっくりとこちらを見た。\n" \
                  "……あれは、誰？",
      room_type: :choice
    },
    fireplace: {
      title: "リビング（暖炉）",
      description: "薪のはずなのに、焦げた臭いが違う。何かが燃やされている。ページの残骸、綿、毛……。\n" \
                  "冷たい部屋。熱い炎。\n" \
                  "この中に私の何かが混ざっている気がする。",
      room_type: :puzzle
    },
    dinner: {
      title: "食卓",
      description: "誰もいない。音もない。無機質なダイニングに、整然と食事だけが並んでいる。\n" \
                  "銀の食器、赤い液体、焼かれた肉。まるで何もかもが、最初からそうあるべきだったように。\n" \
                  "——なぜだろう、手が勝手に動く。\n" \
                  "選ばなくてはならない。食べなくては、終わらない。",
      room_type: :puzzle
    },
    exit: {
      title: "玄関前",
      description: "長い廊下の先。私の手が、扉のノブに触れている。\n" \
                  "けれど、扉の先が"外"であるという確信はない。ただ、ここまで来たという事実だけがある。\n" \
                  "……あなたは、何のためにここまで来たの？",
      room_type: :ending
    }
  }.freeze

  PUZZLES = {
    diary: {
      title: "祝祭の真意",
      question: "この日記は何のために書かれている？",
      correct_option: "祝うこと自体が目的",
      choices: ["祝われるのは私", "私が祝う側だった", "祝うこと自体が目的"]
    },
    fireplace: {
      title: "燃やされているものは？",
      question: "暖炉の中で燃えているのは？",
      correct_option: "日記",
      choices: ["日記", "人形", "毛皮"]
    },
    dinner: {
      title: "素敵な晩餐を",
      question: "食卓に並ぶ料理から、何を選ぶ？",
      correct_option: "白く脈打つ塊",
      choices: ["赤黒い液体が満たされたグラス", "焼かれた内臓の山", "白く脈打つ塊"]
    }
  }.freeze

  CHOICES = {
    mirror: [
      { description: "すべての像が私", flag_type: "madness" },
      { description: "どれも私ではない", flag_type: "void" },
      { description: "私はもう映らない", flag_type: "submission" }
    ],
    doll: [
      { description: "目を戻す", flag_type: "madness" },
      { description: "腕を戻す", flag_type: "void" },
      { description: "脚を戻す", flag_type: "submission" }
    ],
    diary: [
      { description: "私が祝う側だった", flag_type: "madness" },
      { description: "祝われるのは私", flag_type: "void" },
      { description: "祝うこと自体が目的", flag_type: "submission" }
    ],
    tv: [
      { description: "さっきまでの私", flag_type: "madness" },
      { description: "黒い服の女", flag_type: "void" },
      { description: "子供の影", flag_type: "submission" }
    ],
    fireplace: [
      { description: "日記", flag_type: "madness" },
      { description: "人形", flag_type: "void" },
      { description: "毛皮", flag_type: "submission" }
    ],
    dinner: [
      { description: "赤黒い液体が満たされたグラス", flag_type: "madness" },
      { description: "焼かれた内臓の山", flag_type: "void" },
      { description: "白く脈打つ塊", flag_type: "submission" }
    ],
    exit: [
      { description: "出るため", flag_type: "celebration" },
      { description: "戻るため", flag_type: "escape" },
      { description: "終わるため", flag_type: "restart" }
    ]
  }.freeze

  ENDINGS = {
    celebration: {
      title: "祝祭エンド",
      description: "あなたは祝祭の真意を理解し、その先へと進んだ..."
    },
    forgotten: {
      title: "忘却エンド",
      description: "記憶も、存在も、すべてが薄れていく..."
    },
    buried: {
      title: "埋没エンド",
      description: "深く、深く、闇の中へと沈んでいく..."
    },
    watched: {
      title: "監視エンド",
      description: "永遠に続く観察の対象として..."
    },
    loop: {
      title: "ループエンド",
      description: "また会いましょう。何度でも..."
    },
  }.freeze
end
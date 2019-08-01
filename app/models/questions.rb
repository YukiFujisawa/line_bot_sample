class Questions

  QUESTION_LIST = [
    {
      title: '西川君、プロフィールクイズ♪',
      text: '西川君の身長は？',
      image_url: 'https://desafio.style/wp-content/uploads/2018/08/2-11.jpg',
      answers: [
        {
          type: 'message',
          label: '161cm',
          text: '答えは161cmだね'
        },
        {
          type: 'message',
          label: '171cm',
          text: '答えは171cmかも'
        },
        {
          type: 'message',
          label: '151cm',
          text: '答えは151cmかも'
        }
      ]
    },
    {
      title: '西川君、プロフィールクイズ♪',
      text: '西川君の誕生日は？',
      image_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrYfbAt-5wW1WXsv_V5OCgWxri9LEhsZsQ3NXSp-oraXFZMGol',
      answers: [
        {
          type: 'message',
          label: '1970年9月19日',
          text: '答えは1970年9月19日だね'
        },
        {
          type: 'message',
          label: '1971年9月19日',
          text: '答えは1971年9月19日かも'
        },
        {
          type: 'message',
          label: '1969年9月19日',
          text: '答えは1969年9月19日かも'
        }
      ]
    },
    {
      title: '西川君、出演番組クイズ♪',
      text: '西川君がEテレで出演しているキャラクターは？',
      image_url: 'https://i2.wp.com/graphgear.net/wp-content/uploads/2017/05/nishikawa.png?fit=316%2C398&ssl=1',
      answers: [
        {
          type: 'message',
          label: 'マーヴェラス西川',
          text: '答えはマーヴェラス西川だね'
        },
        {
          type: 'message',
          label: 'シグニチャリー西川',
          text: '答えはシグニチャリー西川かも'
        },
        {
          type: 'message',
          label: 'アンブロウクン西川',
          text: '答えはアンブロウクン西川かも'
        }
      ]
    }
  ].freeze

  def self.find(index)
    QUESTION_LIST[index]
  end

  def self.random
    random = Random.new
    max = QUESTION_LIST.length - 1
    QUESTION_LIST[random.rand(0..max)]
  end

end
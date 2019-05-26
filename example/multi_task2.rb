class EventProcessor
  def process(text)
    if text == "抽"
      return random_image
    end

    if text == "占卜"
      return fortune
    end

    if text == "大冒險"
      return fun_slots
    end

    if ["目錄", "?", "help", "你好", "hi", "hello", "."].include? text
      return menu
    end

    return fake_ai(text)
  end

  def random_image
    return [
      {
        "type": "image",
        "originalContentUrl": "https://images.unsplash.com/photo-1477764250597-dffe9f601ae8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
        "previewImageUrl": "https://images.unsplash.com/photo-1477764250597-dffe9f601ae8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
      },
      {
        "type": "image",
        "originalContentUrl": "https://images.unsplash.com/photo-1519900270450-3a6adec39956?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
        "previewImageUrl": "https://images.unsplash.com/photo-1519900270450-3a6adec39956?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
      },
      {
        "type": "image",
        "originalContentUrl": "https://images.unsplash.com/photo-1545460580-36c1957cfde1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1266&q=80",
        "previewImageUrl": "https://images.unsplash.com/photo-1545460580-36c1957cfde1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1266&q=80"
      },
      {
        "type": "image",
        "originalContentUrl": "https://images.unsplash.com/photo-1537787009205-dac68f7e2759?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
        "previewImageUrl": "https://images.unsplash.com/photo-1537787009205-dac68f7e2759?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
      },
      {
        "type": "image",
        "originalContentUrl": "https://images.unsplash.com/photo-1516728778615-2d590ea1855e?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
        "previewImageUrl": "https://images.unsplash.com/photo-1516728778615-2d590ea1855e?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80"
      },
    ].sample
  end

  def fortune
    return {
      "type": "text",
      "text": [
          "牡羊座:發動機車前會先插鑰匙",
          "金牛座:習慣用手打字",
          "雙子座:呼吸不到空氣時會渾身不舒服",
          "獅子座:按滑鼠左鍵時習慣用食指",
          "巨蟹座:聽音樂一定要開聲音",
          "處女座:量體重時喜歡把腳放在體重計上",
          "天秤座:吃飯時會先打開嘴巴",
          "天蠍座:認為沒有湯的麵，根本不算湯麵",
          "射手座:坐車時不習慣倒立或半蹲",
          "魔羯座:滑手機時幾乎不會用到小指跟無名指",
          "水瓶座:熟睡時不喜歡把眼睛睜開",
          "雙魚座:吃粽子時不會連粽葉一起吃"
        ].sample
    }
  end

  def fun_slots
    where = ["教室","廁所","公園","電影院","餐廳","陽台"].sample
    gender = ["同性", "異性", "男性", "女性"].sample
    who = ["路人", "朋友",  "同學",  "同事",  "老師"].sample
    action = ["說笑話", "深情對視", "告白", "壁咚", "十指相扣"].sample
    return {
      "type": "text",
      "text": "在#{where}對一名#{gender}#{who}#{action}"
    }
  end

  def menu
    return {
      "type": "text",
      "text": "請輸入「抽」,「占卜」或「大冒險」",
      "quickReply": {
        "items": [
          {
            "type": "action",
            "action": {
              "type": "message",
              "label": "抽",
              "text": "抽"
            }
          },
          {
            "type": "action",
            "action": {
              "type": "message",
              "label": "占卜",
              "text": "占卜"
            }
          },
          {
            "type": "action",
            "action": {
              "type": "message",
              "label": "大冒險",
              "text": "大冒險"
            }
          },
        ]
      }
    }
  end

  def fake_ai(text)
    return {
      "type": "text",
      "text": text.tr('嗎', '').tr('?？', '!！')
    }
  end
end

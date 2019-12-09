class EventProcessor
  def process(text)
    return random_image if text == "抽"
    return fortune if text == "占卜"
    return fun_slots if text == "大冒險"
    return indexMe if text == "作者"
    return menu if ["目錄", "?", "help", "你好", "hi", "hello", ".","menu"].include? text
    return sheet2(text) if text == "吃"
    return sheetRandom if text == "抽號碼"
    return sheet(text)
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

  def indexMe
      return {
           "action": {
                  "type": "uri",
             "uri": "https://thxu.herokuapp.com/"
            }
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
      "text": "請輸入「抽」,「占卜」,「大冒險」,「吃」, 「抽號碼」,股名或股號,DA106同學的座號或姓名",
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
          {
            "type": "action",
            "action": {
              "type": "message",
              "label": "吃",
              "text": "吃"
            },
          {
            "type": "action",
            "action": {
              "type": "message",
              "label": "抽號碼",
              "text": "抽號碼"
            }
          }   
        ]
      }
    }
  end

  def sheet(text)
    call_sheety_api["classmate"].each do |classmate|
      number = classmate["number"]
      stnumber = classmate["學號"]
      name = classmate["name"]
      nickname = classmate["nickname"]
      eMail = classmate["eMail"]
      phone = classmate["phone"]
      line = classmate["line"]
      facebook = classmate["facebook"]
      live = classmate["宿舍住處"]
      if ((classmate["number"].to_s == text) or (classmate["name"].to_s == text))
        if (classmate["number"]>=1101)
          return {  
          "type": "text",
          "text": "股名：#{name}
股號：#{number}
價格：#{stnumber}"
        }
        else
          return {  
          "type": "text",
          "text": "姓名：#{name}
座號：#{number}
學號：#{stnumber}
綽號：#{nickname}
eMail：#{eMail}
手機：#{phone}
LINE：#{line}
Facebook：#{facebook}
宿舍住處：#{live}"
        }
      end
    end
    return nil
  end

  def sheetRandom(text)
    id1To41 = [*1..41].sample(1)
    call_sheety_api["classmate"].each do |classmate|
      number = classmate["number"]
      name = classmate["name"]
      nickname = classmate["nickname"]
      if classmate["number"] == id1To41[0]
        return {  
          "type": "text",
          "text": "姓名：#{name}
座號：#{number}
綽號：#{nickname}"
        }
      end
    end
    return nil
  end

  def call_sheety_api
    uri = URI("https://v2-api.sheety.co/af46c17763293c918b7674dc2134a95d/da106/classmate")
    body = Net::HTTP.get(uri)
    JSON.parse(body)
  end

  def sheet2(text)
    id51To100 = [*51..92].sample(1)
    call_sheety_api2["food"].each do |food|
      classify = food["分類"]
      stores = food["stores"]
      price = food["price"]
      apprise = food["評價"]
      if (food["id51To100"] == id51To100[0])
        return {  
          "type": "text",
          "text": "分類：#{classify}
店名：#{stores}
價位：#{price}
評價：#{apprise}"
        }
      end
    end
    return nil
  end

  def call_sheety_api2
    uri = URI("https://v2-api.sheety.co/af46c17763293c918b7674dc2134a95d/da106/food")
    body = Net::HTTP.get(uri)
    JSON.parse(body)
  end
end

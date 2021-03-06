class EventProcessor
    def process(text)
      return mapGoogle if text["謝謝你9527"]
      return fortune if text["占卜"]
      return fun_slots if text["大冒險"]
      return indexMe if text == "作者"
      return menu if ["目錄", "?", "help", "你好", "hi", "hello", ".","menu","？"].include? text
      return eat if text["吃"]
      return randomNum if text["抽號碼"]
      return random_image if text["抽"]
      return weatherMain(text) if text["市"] or text["縣"]
      return answer(text) if text["嗎"] or text["?"] or text["？"]
      return classmate(text)
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
        "type": "flex",
        "altText": "目錄選單",
        "contents": {
          "type": "bubble",
          "body": {
            "type": "box",
            "layout": "vertical",
            "contents": [
              {
                "type": "box",
                "layout": "horizontal",
                "contents": [
                  {
                    "type": "button",
                    "action": {
                      "type": "uri",
                      "label": "目前網頁尚只能用桌機版本瀏覽",
                      "uri": "https://thxu.herokuapp.com/"
                    },
                    "style": "primary",
                    "margin": "md"
                  }
                ],
                "margin": "md"
              }
            ]
          }
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
        "text": "請輸入「抽」,「占卜」,「大冒險」,「吃」,「抽號碼」,「XX市/縣」,股票的股號或股名,DA106同學的座號或姓名",
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
              }
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
  
    # 通訊錄開始
    def classmate(text)
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
      end
    end
  # 通訊錄結束
  
  # 抽號碼開始
    def randomNum
      id1To41 = [*1..41].sample(1)
      call_sheety_api["classmate"].each do |classmate|
        number = classmate["number"]
        name = classmate["name"]
        nickname = classmate["nickname"]
        if  (classmate["number"] == id1To41[0])
          return {  
            "type": "text",
            "text": "姓名：#{name}
  座號：#{number}
  綽號：#{nickname}"
          }
        end
      end
    end
  
    def call_sheety_api
      uri = URI("https://v2-api.sheety.co/af46c17763293c918b7674dc2134a95d/da106/classmate")
      body = Net::HTTP.get(uri)
      JSON.parse(body)
    end
  # 抽號碼結束
  
  # 吃開始
    def eat
      id51To100 = [*51..91].sample(1)
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
    end
  
    def call_sheety_api2
      uri = URI("https://v2-api.sheety.co/af46c17763293c918b7674dc2134a95d/da106/food")
      body = Net::HTTP.get(uri)
      JSON.parse(body)
    end
  # 吃結束
  
  # 天氣開始
    def weatherMain(text)
      text="臺北市" if text=="台北市"
      text="臺中市" if text=="台中市"
      text="臺南市" if text=="台南市"
      text="桃園市" if text=="中壢市"
      if all_city.include? text
        weather = city_weather(text)
        weather_info = "#{text}的天氣：
  天氣現象：#{weather[:wx]}
  舒適度：#{weather[:ci]}
  溫度：攝氏 #{weather[:min_t]} ~ #{weather[:max_t]} 度
  降雨機率：#{weather[:pop]}%"
        return {
          "type": "text",
          "text": weather_info
        }
      end
    end
  
    def all_city
      ["臺北市", "新北市", "桃園市", "臺中市", "臺南市", "高雄市", "基隆市", "新竹縣", "新竹市", "苗栗縣", "彰化縣", "南投縣", "雲林縣", "嘉義縣", "嘉義市", "屏東縣", "宜蘭縣", "花蓮縣", "臺東縣", "澎湖縣", "金門縣", "連江縣"]
    end
  
    def call_weather_api
      uri = URI("https://opendata.cwb.gov.tw/fileapi/v1/opendataapi/F-C0032-001?Authorization=CWB-1D147D77-107C-4005-8F8E-94CE678C3779&downloadType=WEB&format=JSON")
      body = Net::HTTP.get(uri)
      JSON.parse(body)
    end
  
    def city_weather(city)
      call_weather_api["cwbopendata"]["dataset"]["location"].each do |location|
        if location["locationName"] == city
          wx = location["weatherElement"].find do |weather_element|
            weather_element["elementName"] == "Wx"
          end
          
          max_t = location["weatherElement"].find do |weather_element|
            weather_element["elementName"] == "MaxT"
          end
          
          min_t = location["weatherElement"].find do |weather_element|
            weather_element["elementName"] == "MinT"
          end
          
          ci = location["weatherElement"].find do |weather_element|
            weather_element["elementName"] == "CI"
          end
          
          pop = location["weatherElement"].find do |weather_element|
            weather_element["elementName"] == "PoP"
          end
  
          return {
            "wx": wx["time"][0]["parameter"]["parameterName"],
            "max_t": max_t["time"][0]["parameter"]["parameterName"],
            "min_t": min_t["time"][0]["parameter"]["parameterName"],
            "ci": ci["time"][0]["parameter"]["parameterName"],
            "pop": pop["time"][0]["parameter"]["parameterName"],
          }
        end
      end
    end
  # 天氣結束
  
  # 回話AI開始
    def answer(text)
      message = {
        "type": "text",
        "text": text.tr('我你妳', '你我我').tr('嗎', '').tr('?？', '!！')
      }
      return message
    end
  end
  # 回話AI結束
  
  # Google地圖開始
  def call_google_api
    uri = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=24.9670306,121.1921616&radius=1000&types=food&name=&language=zh-TW&key=AIzaSyAYmC8oUYc9DGAZn8hqZKakFeclhAbTRSI")
    body = Net::HTTP.get(uri)
    JSON.parse(body)
  end
  # https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=24.9670306,121.1921616&radius=1000&types=food&name=&language=zh-TW&key=AIzaSyAYmC8oUYc9DGAZn8hqZKakFeclhAbTRSI
  
  def mapGoogle
    # 方法一
    sName=['09e0ae0cc0721b2fb8d2b43e84e7e9ddd1aaab02','b']
    # call_google_api["results"].each do |results|
    #   sName.push(results["name"])
    # end
    # rStName = sName.sample(1)
    call_google_api["results"].each do |results|
      sid = results["id"]
      storeName = results["name"]
      op = results["opening_hours"]
      rating = results["rating"]
      vicinity = results["vicinity"]
      # 方法二
      # rStName = storeName.sample(1)
      if  (results["id"] == sName[0])
        return {  
          "type": "text",
          "text": "店名：#{storeName}
  營業：#{op}
  評價：#{rating}
  地址：#{vicinity}"
        }
      end
    end
  end
  # Goodle地圖結束
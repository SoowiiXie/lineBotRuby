class EventProcessor
  def process(text)
    return random_image if text == "抽"
    return fortune if text == "占卜"
    return fun_slots if text == "大冒險"
    return indexMe if text == "作者"
    return menu if ["目錄", "?", "help", "你好", "hi", "hello", "."].include? text
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
          {
            "type": "action",
            "action": {
              "type": "message",
              "label": "作者",
              "text": "作者"
            }
          }   
        ]
      }
    }
  end

  def sheet(text)
    if all_city.include? text
      weather = city_weather(text)
      weather_info = "#{text}的天氣：
        天氣現象：#{weather[:wx]}
        舒適度：#{weather[:ci]}
        溫度：攝氏 #{weather[:min_t]} ~ #{weather[:max_t]} 度
        降雨機率：#{weather[:pop]}%
      "
      return {
        "type": "text",
        "text": weather_info
      }
    end

    return city_menu
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

  def city_menu
    {
      "type": "flex",
      "altText": "請點選一個城市",
      "contents": {
        "type": "bubble",
        "body": {
          "type": "box",
          "layout": "vertical",
          "contents": [
            {
              "type": "text",
              "text": "請點選一個城市"
            },
            {
              "type": "separator",
              "margin": "md",
              "color": "#000000"
            },
            {
              "type": "box",
              "layout": "horizontal",
              "contents": [
                {
                  "type": "text",
                  "text": "臺北市",
                  "action": {
                    "type": "message",
                    "label": "臺北市",
                    "text": "臺北市"
                  },
                  "align": "center",
                  "size": "xs"
                },
                {
                  "type": "text",
                  "text": "新北市",
                  "action": {
                    "type": "message",
                    "label": "新北市",
                    "text": "新北市"
                  },
                  "align": "center",
                  "size": "xs"
                },
                {
                  "type": "text",
                  "text": "桃園市",
                  "action": {
                    "type": "message",
                    "label": "桃園市",
                    "text": "桃園市"
                  },
                  "align": "center",
                  "size": "xs"
                },
                {
                  "type": "text",
                  "text": "臺中市",
                  "action": {
                    "type": "message",
                    "label": "臺中市",
                    "text": "臺中市"
                  },
                  "align": "center",
                  "size": "xs"
                }
              ],
              "margin": "md"
            },
            {
              "type": "box",
              "layout": "horizontal",
              "contents": [
                {
                  "type": "text",
                  "text": "臺南市",
                  "action": {
                    "type": "message",
                    "label": "臺南市",
                    "text": "臺南市"
                  },
                  "align": "center",
                  "size": "xs"
                },
                {
                  "type": "text",
                  "text": "高雄市",
                  "action": {
                    "type": "message",
                    "label": "高雄市",
                    "text": "高雄市"
                  },
                  "align": "center",
                  "size": "xs"
                },
                {
                  "type": "text",
                  "text": "基隆市",
                  "action": {
                    "type": "message",
                    "label": "基隆市",
                    "text": "基隆市"
                  },
                  "align": "center",
                  "size": "xs"
                },
                {
                  "type": "text",
                  "text": "新竹縣",
                  "action": {
                    "type": "message",
                    "label": "新竹縣",
                    "text": "新竹縣"
                  },
                  "align": "center",
                  "size": "xs"
                }
              ],
              "margin": "md"
            },
            {
              "type": "box",
              "layout": "horizontal",
              "contents": [
                {
                  "type": "text",
                  "text": "新竹市",
                  "action": {
                    "type": "message",
                    "label": "新竹市",
                    "text": "新竹市"
                  },
                  "align": "center",
                  "size": "xs"
                },
                {
                  "type": "text",
                  "text": "苗栗縣",
                  "action": {
                    "type": "message",
                    "label": "苗栗縣",
                    "text": "苗栗縣"
                  },
                  "align": "center",
                  "size": "xs"
                },
                {
                  "type": "text",
                  "text": "彰化縣",
                  "action": {
                    "type": "message",
                    "label": "彰化縣",
                    "text": "彰化縣"
                  },
                  "align": "center",
                  "size": "xs"
                },
                {
                  "type": "text",
                  "text": "南投縣",
                  "action": {
                    "type": "message",
                    "label": "南投縣",
                    "text": "南投縣"
                  },
                  "align": "center",
                  "size": "xs"
                }
              ],
              "margin": "md"
            },
            {
              "type": "box",
              "layout": "horizontal",
              "contents": [
                {
                  "type": "text",
                  "text": "雲林縣",
                  "action": {
                    "type": "message",
                    "label": "雲林縣",
                    "text": "雲林縣"
                  },
                  "align": "center",
                  "size": "xs"
                },
                {
                  "type": "text",
                  "text": "嘉義縣",
                  "action": {
                    "type": "message",
                    "label": "嘉義縣",
                    "text": "嘉義縣"
                  },
                  "align": "center",
                  "size": "xs"
                },
                {
                  "type": "text",
                  "text": "嘉義市",
                  "action": {
                    "type": "message",
                    "label": "嘉義市",
                    "text": "嘉義市"
                  },
                  "align": "center",
                  "size": "xs"
                },
                {
                  "type": "text",
                  "text": "屏東縣",
                  "action": {
                    "type": "message",
                    "label": "屏東縣",
                    "text": "屏東縣"
                  },
                  "align": "center",
                  "size": "xs"
                }
              ],
              "margin": "md"
            },
            {
              "type": "box",
              "layout": "horizontal",
              "contents": [
                {
                  "type": "text",
                  "text": "宜蘭縣",
                  "action": {
                    "type": "message",
                    "label": "宜蘭縣",
                    "text": "宜蘭縣"
                  },
                  "align": "center",
                  "size": "xs"
                },
                {
                  "type": "text",
                  "text": "花蓮縣",
                  "action": {
                    "type": "message",
                    "label": "花蓮縣",
                    "text": "花蓮縣"
                  },
                  "align": "center",
                  "size": "xs"
                },
                {
                  "type": "text",
                  "text": "臺東縣",
                  "action": {
                    "type": "message",
                    "label": "臺東縣",
                    "text": "臺東縣"
                  },
                  "align": "center",
                  "size": "xs"
                },
                {
                  "type": "text",
                  "text": "澎湖縣",
                  "action": {
                    "type": "message",
                    "label": "澎湖縣",
                    "text": "澎湖縣"
                  },
                  "align": "center",
                  "size": "xs"
                }
              ],
              "margin": "md"
            },
            {
              "type": "box",
              "layout": "horizontal",
              "contents": [
                {
                  "type": "text",
                  "text": "金門縣",
                  "action": {
                    "type": "message",
                    "label": "金門縣",
                    "text": "金門縣"
                  },
                  "align": "center",
                  "size": "xs"
                },
                {
                  "type": "text",
                  "text": "連江縣",
                  "action": {
                    "type": "message",
                    "label": "連江縣",
                    "text": "連江縣"
                  },
                  "align": "center",
                  "size": "xs"
                },
                {
                  "type": "filler"
                },
                {
                  "type": "filler"
                }
              ],
              "margin": "md"
            }
          ]
        }
      }
    }
  end
end
#     call_sheety_api.each do |classmate|
#       if classmate["name"].to_s == text
#         return {  
#           "type": "text",
#           "text": classmate["eMail"].to_s
#         }
#       end
#     end
#     return nil
#   end

#   def call_sheety_api
#     uri = URI("https://v2-api.sheety.co/af46c17763293c918b7674dc2134a95d/da106/classmate")
#     body = Net::HTTP.get(uri)
#     JSON.parse(body)
#   end
# end

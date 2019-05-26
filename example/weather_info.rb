 class EventProcessor
  def process(text)
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

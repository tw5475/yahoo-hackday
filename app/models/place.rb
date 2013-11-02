# encoding: utf-8
class Place < ActiveRecord::Base
  has_many :user_places
  has_many :qa_sets
  attr_readonly :upid
  before_validation :gen_upid, on: :create
  validates :upid, presence: true, uniqueness: true

  serialize :flickr_pics
  PLACE_DATA = [
    {
      place_data: {
        code_name: 'taipei_101',
        p_name: '台北101',
        lat: 25.073175,
        lng: 121.551954,
        info_desc: '台北101（TAIPEI 101）是位於台灣台北市信義區的一棟摩天大樓，'\
        '樓高509.2 m(1,671ft)，總樓層共地上101層、地下5層，'\
        '由建築師李祖原及其團隊設計，KTRT團隊建造，於1999年動工，'\
        '2004年12月31日完工啟用。其最初名稱為台北國際金融中心'\
        '（Taipei World Financial Center），2003年改為現名，亦俗稱為101大樓。'\
        '曾於2004年12月31日至2010年1月4日間擁有「世界第一高樓」的紀錄。'\
        '以美國權威建築機構世界高樓協會（CTBUH）所訂定的高度標準計算；'\
        '台北101目前是世界第四高樓、全球最高綠建築、環地震帶最高建築，'\
        '同時也是台灣、東亞及環太平洋地區最高的建築物；'\
        '大樓內則擁有全球最大的阻尼器、與全球起降速度次快的電梯。',
        info_source: 'wiki',
        info_link: 'http://zh.wikipedia.org/wiki/%E5%8F%B0%E5%8C%97101',
        },
        qas: [
          {
            question: '請問台北101是由哪一位建築師與他的團隊設計的？',
            answer_correct: '李祖原',
            answer_wrong_1: '李大仁',
            answer_wrong_2: '李家同'
            },
            {
              question: '請問台北101的高度為何？',
              answer_correct: '509.2公尺',
              answer_wrong_1: '508.2公尺',
              answer_wrong_2: '507.2公尺'
              },
              {
                question: '請問台北101最初稱名稱為？',
                answer_correct: '台北國際金融中心',
                answer_wrong_1: '台北國際商業中心',
                answer_wrong_2: '台北國際購物中心'
                },
                {
                  question: '請問台北101於西元幾年動工？',
                  answer_correct: '1999',
                  answer_wrong_1: '1998',
                  answer_wrong_2: '1997'
                  },
                  {
                    question: '台北101是目前全世界最高的建築物？',
                    answer_correct: 'No',
                    answer_wrong_1: 'Yes',
                    answer_wrong_2: ''
                    },
                    {
                      question: '台北101是目前全世界最高的綠建築？',
                      answer_correct: 'Yes',
                      answer_wrong_1: 'No',
                      answer_wrong_2: ''
                      },
                      {
                        question: '台北101是目前臺灣最高的建築物？',
                        answer_correct: 'Yes',
                        answer_wrong_1: 'No',
                        answer_wrong_2: ''
                        },
                        {
                          question: '台北101擁有目前全世界最快的電梯？',
                          answer_correct: 'No',
                          answer_wrong_1: 'Yes',
                          answer_wrong_2: ''
                          },
                          {
                            question: '請問台北101是位於台北市的哪一個行政區？',
                            answer_correct: '信義區',
                            answer_wrong_1: '大安區',
                            answer_wrong_2: '中山區'
                            },
                            {
                              question: '請問台北101地上共有幾層樓？',
                              answer_correct: '101',
                              answer_wrong_1: '100',
                              answer_wrong_2: '105'
                              },
                              {
                                question: '台北101擁有全世界最大的尼阻器？',
                                answer_correct: 'Yes',
                                answer_wrong_1: 'No',
                                answer_wrong_2: ''
                              }
                            ]
                            },
                            {
                              place_data: {
                                code_name: 'splashtop',
                                p_name: 'Splashtop 台北分公司',
                                lat: 25.03949,
                                lng: 121.54349,
                                info_desc: 'Splashtop Inc. 卓越的跨螢幕和協同作業技術，為智慧型手機、平板裝置、電腦、電視和雲端搭起互動的橋樑。Splashtop 遠端桌面讓人們可以透過行動裝置存取並控制常用的應用程式、檔案和資料。目前已有超過一千四百萬名使用者從應用程式商店下載了 Splashtop 產品，並且有超過一億台從 HP、Lenovo、Dell、Acer、Sony、Asus、Toshiba、Intel 和其他合作廠商出貨的裝置預載了 Splashtop。\n\n由於 IT 消費化的趨勢和行動裝置的普及，Splashtop Enterprise 逐漸廣泛運用在企業機構。這個內部部署解決方案不僅具備快速可靠的存取功能，從任何裝置存取所有商業應用程式和資料，更提供 IT、系統整合與服務提供者原則導向控制的機制。這個效能頂尖的遠端桌面解決方案，以更快速、經濟實惠的方式解決了行動裝置 VPN 相容性以及透過 WAN 連接 RDP 的問題。\n\nSplashtop 屢獲殊榮，包括 PC World「最佳創新產品獎」、Popular Science 「最佳新品獎」以及 LAPTOP 雜誌「2012 年度最佳消費性電子產品」。Splashtop 也是唯一連續兩年（2012 年和 2013 年）榮獲 NVIDIA「Ones to Watch」新興企業獎的公司。企業總部設在美國加州矽谷，並在中國、日本和台北設有分公司。\n\nSplashtop Remote\n\n1. 遠端檢視並編輯檔案（無須轉換或同步）\n2. 使用您常用的 Windows 和 Mac 應用程式和內建程式\n3. 以高達每秒 30 格的畫面播放速率以及低延遲率來觀看高畫質電影、 電視節目和 Flash 影片\n4. 從其他電腦串流您的音樂收藏\n5. 做一個影音生動的簡報來吸引您的觀眾\n6. 在 iPad 或其他裝置上玩圖形密集型遊戲\n\nSPLASHTOP 效能保證：\n\n快速 – 速度更快的高效能遠端應用程式\n簡單 – 只需登入並連接即可使用\n可靠 – 加強網路連線穩定度\n鮮明 – 支援 Apple Retina 顯示\n\nSplashtop Whiteboard\n\n可以讓老師和學生們將 iPad 當成互動式白板來使用。一旦透過 Wifi 連接到電腦，即可從 iPad 上觀看影像和音訊完全同步的 Flash 影片、控制最愛的應用程式並且在教學內容上寫下附註。現在即可在學生的課桌旁或教室的任何角落和他們互動，讓使用者從教室的任何角落都可以操作教學工具，使現有的互動式白板 (IWBs) 發揮更大的效益。至於沒有使用 IWB 的使用者，現在也可以用極少的成本來獲得好處。讓學校裡的 PC 保持開啟，只需安坐家中遠端連接，再也不用為了準備明天的課程而留校到深夜！',
                                info_source: 'Splashtop Offical Website',
                                info_link: 'http://www2.splashtop.com/zh-TW/home',
                                },
                                qas: [
                                  {
                                    question: '請問Splashtop在哪一年獲得LAPTOP雜誌年度最佳消費性電子產品？',
                                    answer_correct: '2012',
                                    answer_wrong_1: '2011',
                                    answer_wrong_2: '2010'
                                    },
                                    {
                                      question: '請問Splashtop公司總部位在？',
                                      answer_correct: '美國加州矽谷',
                                      answer_wrong_1: '中國杭州',
                                      answer_wrong_2: '臺灣台北'
                                    }
                                  ]
                                }
                              ]
  # return example :["http://farm6.staticflickr.com/5522/9037859769_b1d09f070b_z.jpg", "http://farm8.staticflickr.com/7410/9033782401_5d60403cde_z.jpg", "http://farm6.staticflickr.com/5452/9035186778_d4a23d1f4e_z.jpg", "http://farm1.staticflickr.com/174/436113168_c78cefa081_z.jpg", "http://farm8.staticflickr.com/7036/6923529027_767c308851_z.jpg", "http://farm8.staticflickr.com/7037/6938364044_ece761729a_z.jpg"]
  def self.init!
   PLACE_DATA.each do |p|
    place = Place.create(p[:place_data])
    p[:qas].each do |qa|
      QaSet.create(qa.merge(place_id: place.id))
    end
  end
end

def get_images
  if self.flickr_pics == nil
    FlickRaw.api_key="62d070c25165e55616f703a03e066bb5"
    FlickRaw.shared_secret="211138e6e42dcaaa"
    photos = flickr.photos.search :text => self.p_name ,:safe_search=>'1' ,:sort=>'relevance' ,:content_type=>'1' ,:per_page=>100
    result = photos.map { |p| FlickRaw.url_z(p) }
    # { :image => FlickRaw.url_z(p),
    #    :owner => flickr.photos.getInfo(:photo_id =>p.id).owner.username
    # }
    update_attributes(flickr_pics: result[1..10])
  end
  return self.flickr_pics
end

def vs_status(user_id)
  up = UserPlace.find_by_user_id_and_place_id(user_id, self.id)
  (up == nil) ? 0 : up.vs_status
end

def pin_path
  "/image/place/#{self.code_name}_pin.png"
end

def icon_path
  "/image/place/#{self.code_name}_icon.png"
end

def bg_path
  "/image/place/#{self.code_name}_bg.jpg"
end

private
def gen_upid
  self.upid = RandomToken.gen(32)
end
end

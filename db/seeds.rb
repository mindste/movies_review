# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.find_by(email: "admin@test.com").nil?
   u = User.new
   u.email = "admin@test.com"           # 可以改成自己的 email
   u.password = "123456"                # 最少要六码
   u.password_confirmation = "123456"   # 最少要六码
   u.is_admin = true
   u.save
   puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
 else
   puts "Admin 已经建立过了，脚本跳过该步骤。"
 end

# Initialize Movie

Movie.create!(title: "二十二 (2015)",
  description: "　在日本侵华战争的八年间，至少20万中国妇女被迫沦为日军的性奴隶，也就是我们经常提及的“慰安妇”。在影片2014年开拍之时，中国内地仅剩22位“慰安妇”幸存者。当光阴慢慢划过，时间抚平伤口，这些经历了常人无法想象的磨难的老人们，如今又身在何处，过着怎样的生活，经历着怎样的悲喜忧乐？",
  movie_length: "99分钟(公映版) / 112分钟",
  director: "郭柯",
  rating: 8.9,
  image:  open("https://img1.doubanio.com/view/movie_poster_cover/lpst/public/p2457609817.jpg"),
  is_hidden:  false
  )

Movie.create!(title: "摔跤吧！爸爸 Dangal (2016)",
  description: "马哈维亚（阿米尔·汗 Aamir Khan 饰）曾经是一名前途无量的摔跤运动员，在放弃了职业生涯后，他最大的遗憾就是没有能够替国家赢得金牌。马哈维亚将这份希望寄托在了尚未出生的儿子身上，哪知道妻子接连给他生了两个女儿，取名吉塔（法缇玛·萨那·纱卡 Fatima Sana Shaikh 饰）和巴比塔（桑亚·玛荷塔 Sanya Malhotra 饰）。让马哈维亚没有想到的是，两个姑娘展现出了杰出的摔跤天赋，让他幡然醒悟，就算是女孩，也能够昂首挺胸的站在比赛场上，为了国家和她们自己赢得荣誉。
　　就这样，在马哈维亚的指导下，吉塔和巴比塔开始了艰苦的训练，两人进步神速，很快就因为在比赛中连连获胜而成为了当地的名人。为了获得更多的机会，吉塔进入了国家体育学院学习，在那里，她将面对更大的诱惑和更多的选择。",
  movie_length: "161分钟(印度) / 140分钟(中国大陆)",
  director: "涅提·蒂瓦里",
  rating:   9.1,
  image:  open("https://img3.doubanio.com/view/movie_poster_cover/lpst/public/p2457983084.jpg"),
  is_hidden:  false
  )

Movie.create!(title: "战狼2 (2017)",
  description: "　　故事发生在非洲附近的大海上，主人公冷锋（吴京 饰）遭遇人生滑铁卢，被“开除军籍”，本想漂泊一生的他，正当他打算这么做的时候，一场突如其来的意外打破了他的计划，突然被卷入了一场非洲国家叛乱，本可以安全撤离，却因无法忘记曾经为军人的使命，孤身犯险冲回沦陷区，带领身陷屠杀中的同胞和难民，展开生死逃亡。随着斗争的持续，体内的狼性逐渐复苏，最终孤身闯入战乱区域，为同胞而战斗。",
  movie_length: "123分钟",
  director: "吴京",
  rating: 7.5,
  image:  open("https://img3.doubanio.com/view/movie_poster_cover/lpst/public/p2485983612.jpg"),
  is_hidden:  false
  )

Movie.create!(title: "神偷奶爸3 Despicable Me 3 (2017)",
  description: "《神偷奶爸3》将延续前两部的温馨、搞笑风格，聚焦格鲁和露西的婚后生活，继续讲述格鲁和三个女儿的爆笑故事。“恶棍”奶爸格鲁将会如何对付大反派巴萨扎·布莱德，调皮可爱的小黄人们又会如何耍贱卖萌，无疑让全球观众万分期待。该片配音也最大程度沿用前作阵容，史蒂夫·卡瑞尔继续为男主角格鲁配音，皮埃尔·柯芬也将继续为经典角色小黄人配音，而新角色巴萨扎·布莱德则由《南方公园》主创元老崔·帕克为其配音。
",
  movie_length: "90分钟",
  director: "凯尔·巴尔达 / 皮埃尔·科凡 / 埃里克·吉伦",
  rating: 7.0,
  image:  open("https://img3.doubanio.com/view/movie_poster_cover/lpst/public/p2469070974.jpg"),
  is_hidden:  false
  )

Movie.create!(title: "破·局 (2017)",
  description: "这是高见翔警官生命中最艰难的一天：母亲去世，工作遇阻，还在奔丧时意外撞死了一个人。他本以为可以瞒天过海，没想到一个惊天阴谋在前方等待，令他身陷迷局......",
  movie_length: "112分钟",
  director: " 连奕琦",
  rating: 6.8,
  image:  open("https://img3.doubanio.com/view/movie_poster_cover/lpst/public/p2496288510.jpg"),
  is_hidden:  false
  )

Movie.create!(title: "赛车总动员3：极速挑战 Cars 3 (2017)",
  description: "　讲述世界冠军闪电麦坤已成为当代车坛的传奇人物，曾五次夺得活塞杯冠军。但车坛风云突变，新车辈出，这让闪电麦坤的优势受到巨大威胁，更可怕的是，麦坤的自信也日渐瓦解。为了重返巅峰，闪电麦坤背水一战，但他对竞速的热爱，能为其回归之战注满能量吗？而除了麦坤外，影片中还有两位关键角色——酷姐拉米雷兹与黑风暴杰克逊。前者是一个阳光但严厉的赛车技师，将帮助麦坤重回巅峰；后者造型酷炫、速度奇快无比，是新一代赛车中的领跑者，也是麦坤最大的竞争对手。",
  movie_length: "102分钟",
  director: "布莱恩·菲",
  rating: 7.0,
  image:  open("https://img3.doubanio.com/view/movie_poster_cover/lpst/public/p2492869476.jpg"),
  is_hidden:  false
  )

Movie.create!(title: "三生三世十里桃花 (2017)",
  description: "天族战神墨渊（杨洋 饰）镇压鬼君擎苍（严宽 饰）于无妄海，魂飞魄散，仙体冰封于青丘炎华洞内。青丘帝姬白浅（刘亦菲 饰）同天族太子夜华（杨洋 饰）早有婚约，二人却一直未曾相见。直至东海盛宴，夜华发现白浅竟然同亡妻素素（刘亦菲 饰）相貌一样，就势住进白浅的青丘，放下太子身段，为求解开白浅与素素之谜。夜华侧妃素锦（李纯 饰）生妒，暗中协助鬼族王后玄女（顾璇 饰）抢走墨渊仙体。白浅一怒之下血战鬼族大紫明宫，身负重伤，终被夜华救下。白浅跟随夜华来到九重天，通过天族圣器结魄灯恢复记忆，回想起身为素素一世之时所受伤害，不能原谅夜华。陷害白浅的素锦受到责罚，发配至无妄海，由妒生恨，终至疯狂，利用夜华之子小天孙阿离（彭子苏 饰）之血释放出被墨渊封印的鬼君擎苍。夜华为维护四海八荒，以元神生祭东皇钟，将擎苍封印。世事轮回，万般纠葛不过一个爱字。命运轮回，夜华与白浅究竟何去何从……",
  movie_length: "109分钟",
  director:  "赵小丁 / 安东尼·拉默里纳拉",
  rating: 4.2,
  image:  open("https://img1.doubanio.com/view/movie_poster_cover/lpst/public/p2494279388.jpg"),
  is_hidden:  false
  )

Movie.create!(title: "皮绳上的魂 (2016)",
  description: "《皮绳上的魂》改编自中国魔幻现实主义代表作家扎西达娃的两部短篇小说：《西藏，系在皮绳结上的魂》和《去拉萨的路上》，影片讲述一个背负原罪与世仇，死而复生的猎人经活佛点拨，一路降服心魔，最终将圣物天珠护送进入莲花生大师掌纹地的故事。",
  movie_length: "144分钟 / 129分钟",
  director:  "张杨",
  rating: 7.4,
  image:  open("https://img3.doubanio.com/view/movie_poster_cover/lpst/public/p2494811175.jpg"),
  is_hidden:  false
  )

Ticket.create!(name: "VIP",
  description:  "享受三大特权",
  price:  50,
)

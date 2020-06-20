Games

View(Games)

# LeBronJames가 2012년도에 몇게임을 뛰었는가??
rownames(Games)
colnames(Games)


Games[ 'LeBronJames' , '2012' ]
Games[ 3, 8]

# 1게임당 몇분 뛰었는지를 확인하려한다.
# 모든 선수, 모든 시즌에 대해서...

Min.per.Game <- MinutesPlayed / Games

Min.per.Game <- round(Min.per.Game, 1)

Min.per.Game

# ChrisBosh, LeBronJames, KobeBryant 이 세선수의 데이터만
# 한게임당 몇분 뛰었는지 확인하려 한다.

Min.per.Game[  c('ChrisBosh','LeBronJames','KobeBryant'),  ]

Min.per.Game[c('ChrisBosh','LeBronJames','KobeBryant'),c('2013','2014')]




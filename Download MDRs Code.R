
#unable to list more than 100 MDRs at a time, so must download each set by 100
url <- NULL
for (i in seq(from = 0, to = 28300, by = 100)) {
  url[i] <- paste0("https://api.fda.gov/device/event.json?search=essure&limit=100&skip=", i)
}
url <- url[!is.na(url)]

#Get information on each MDR from openFDA
mdrs <- NULL
for (i in seq_along(url)) {
  mdrs[[i]] <- GET(url[i])
}


#getting the first 100 MDRs
mdrx <- GET("https://api.fda.gov/device/event.json?search=essure&limit=100")
textx <- NULL
for (i in seq_along(httr::content(mdrx)$results)) {
  textx[[i]] <- httr::content(mdrx)$results[[i]]$mdr_text[[1]]
}
datex <- NULL
for (i in seq_along(httr::content(mdrx)$results)) {
  datex[i] <- httr::content(mdrx)$results[[i]]$device[[1]]$date_received
}
textx <- list.stack(textx)
textx <- as_tibble(textx)

datex <- as_tibble(datex)
textx$date <- ymd(datex$value)
textx


#see content: These nodes contain the relevant content for the analysis
httr::content(mdrs[[1]])$results[[1]]$mdr_text[[1]]
httr::content(mdrs[[2]])$results[[4]]$device[[1]]$date_received

httr::content(mdrs[[2]])$results[[4]]$mdr_text[[1]]
httr::content(mdrs[[2]])$results[[4]]$device[[1]]$date_received

httr::content(mdrs[[3]])$results[[4]]$mdr_text[[1]]
httr::content(mdrs[[3]])$results[[4]]$device[[1]]$date_received

#Extract the text
#The text is quite embedded, so extracting it is a tedious process. I can create
#a function to make this easier. Each "MDRnum" contains 100 MDRs.
#For each MDR text, it's corresponding date must be chosen as well. 
tidyMDR <- function(MDRnum) {
  testtext <- NULL
  
  for (i in 1:100) {
    testtext[[i]] <- httr::content(mdrs[[MDRnum]])$results[[i]]$mdr_text[[1]]
  }
  
  date_received <- NULL
  
  for (i in 1:100) {
    date_received[i] <- httr::content(mdrs[[MDRnum]])$results[[i]]$device[[1]]$date_received
  }
  
  testtext <- list.stack(testtext)
  testtext <- as_tibble(testtext)
  
  date_received <- as_tibble(date_received)
  testtext$date <- ymd(date_received$value)
  testtext
  
}

#I've tried compacting this into a for loop, but each time, R crashes. It seems,
# in this case, it is better to simply copy and paste the function for each set of
# 100 MDRs and bind them to the results
MDRresults <- textx
MDRresults <- MDRresults %>% bind_rows(tidyMDR(1))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(2))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(3))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(4)) #subscript out of bounds
MDRresults <- MDRresults %>% bind_rows(tidyMDR(5))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(6))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(7)) #subscript out of bounds
MDRresults <- MDRresults %>% bind_rows(tidyMDR(8))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(9))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(10))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(11))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(12))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(13))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(14))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(15))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(16))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(17))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(18))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(19))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(20))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(21))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(22))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(23))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(24)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(25))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(26))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(27)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(28))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(29))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(30))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(31))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(32))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(33))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(34))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(35))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(36))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(37))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(38))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(39))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(40))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(41))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(42)) #subscript out of bounds
MDRresults <- MDRresults %>% bind_rows(tidyMDR(43))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(44)) #subscript out of bounds
MDRresults <- MDRresults %>% bind_rows(tidyMDR(45))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(46))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(47)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(48)) #subscript out of bounds
MDRresults <- MDRresults %>% bind_rows(tidyMDR(49))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(50))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(51))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(52))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(53))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(54))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(55))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(56))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(57))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(58))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(59))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(60))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(61))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(62))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(63))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(64)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(65))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(66))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(67)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(68))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(69))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(70))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(71))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(72))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(73))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(74))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(75)) #subscript out of bounds
MDRresults <- MDRresults %>% bind_rows(tidyMDR(76)) #subscript out of bounds
MDRresults <- MDRresults %>% bind_rows(tidyMDR(77))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(78))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(79))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(80))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(81))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(82))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(83))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(84)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(85))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(86))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(87)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(88)) #subscript out of bounds
MDRresults <- MDRresults %>% bind_rows(tidyMDR(89))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(90))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(91))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(92))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(93))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(94))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(95))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(96))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(97))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(98))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(99))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(100))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(101))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(102))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(103))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(104)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(105)) #subscript out of bounds
MDRresults <- MDRresults %>% bind_rows(tidyMDR(106)) #subscript out of bounds
MDRresults <- MDRresults %>% bind_rows(tidyMDR(107)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(108))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(109))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(110))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(111))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(112))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(113))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(114)) #subscript out of bounds
MDRresults <- MDRresults %>% bind_rows(tidyMDR(115))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(116))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(117))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(118))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(119))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(120))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(121))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(122))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(123))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(124)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(125))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(126))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(127)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(128))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(129))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(130))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(131)) #subscript out of bounds
MDRresults <- MDRresults %>% bind_rows(tidyMDR(132))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(133))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(134))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(135))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(136))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(137))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(138))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(139))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(140))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(141))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(142))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(143))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(144)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(145))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(146))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(147)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(148))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(149))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(150))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(151))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(152))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(153))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(154))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(155))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(156))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(157))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(158))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(159))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(160))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(161))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(162))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(163))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(164)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(165))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(166))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(167)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(168))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(169))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(170))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(171))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(172))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(173))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(174))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(175))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(176))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(177))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(178)) #subscript out of bounds
MDRresults <- MDRresults %>% bind_rows(tidyMDR(179))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(180))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(181))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(182))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(183))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(184)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(185))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(186))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(187)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(188))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(189))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(190))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(191))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(192))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(193))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(194))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(195))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(196))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(197))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(198))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(199))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(200))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(201))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(202))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(203))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(204))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(205))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(206))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(207))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(208))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(209))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(210))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(211))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(212))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(213))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(214))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(215))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(216))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(217))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(218))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(219))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(220))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(221))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(222))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(223))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(224)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(225))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(226))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(227)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(228))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(229))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(230))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(231))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(232))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(233))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(234))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(235))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(236))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(237))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(238))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(239))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(240))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(241))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(242))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(243))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(244)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(245))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(246))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(247)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(248)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(249))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(250))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(251))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(252))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(253))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(254))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(255))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(256))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(257))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(258))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(259))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(260))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(261))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(262))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(263))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(264)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(265))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(266))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(267)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(268))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(269))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(270))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(271))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(272))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(273))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(274))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(275)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(276)) 
MDRresults <- MDRresults %>% bind_rows(tidyMDR(277))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(278))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(279))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(280))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(281))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(282))
MDRresults <- MDRresults %>% bind_rows(tidyMDR(283))

#for (i in 2:10) {
#MDRresults <- MDRresults %>% bind_rows(tidyMDR(i))
#}
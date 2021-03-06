﻿if GetLocale() ~= "zhTW" then return end

local L

--------------
--  Magmaw  --
--------------
L = DBM:GetModLocalization("Magmaw")

L:SetGeneralLocalization({
	name 				= "熔喉"
})

L:SetWarningLocalization({
})

L:SetTimerLocalization({
})

L:SetMiscLocalization({
	Slump				= "%s slumps forward, exposing his pincers!",
	HeadExposed			= "%s becomes impaled on the spike, exposing his head!"
})

L:SetOptionLocalization({
})

-------------------------------
--  Dark Iron Golem Council  --
-------------------------------
L = DBM:GetModLocalization("DarkIronGolemCouncil")

L:SetGeneralLocalization({
	name 				= "全能魔像防禦系統"
})

L:SetWarningLocalization({
})

L:SetTimerLocalization({
	timerArcaneBlowbackCast		= "秘法逆爆",
	timerShadowConductorCast	= "眾影體"
})

L:SetOptionLocalization({
	timerShadowConductorCast	= "為$spell:92053的施放顯示計時器",
	timerArcaneBlowbackCast		= "為$spell:91879的施放顯示計時器",
	AcquiringTargetIcon		= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(79501),
	ConductorIcon			= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(79888),
	BombTargetIcon			= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(80094),
	ShadowConductorIcon		= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(92053)
})

L:SetMiscLocalization({
	Magmatron			= "熔岩號",
	Electron			= "雷電號",
	Toxitron			= "烈毒號",
	Arcanotron			= "秘法號"

})

----------------
--  Maloriak  --
----------------
L = DBM:GetModLocalization("Maloriak")

L:SetGeneralLocalization({
	name 				= "瑪洛里亞克"
})

L:SetWarningLocalization({
	WarnPhase			= "%s階段",
	WarnRemainingAdds		= "剩餘%d畸變"
})

L:SetTimerLocalization({
	TimerPhase			= "下一階段"
})

L:SetMiscLocalization({

	YellRed				= "紅色|r瓶子到鍋子裡!",
	YellBlue			= "藍色|r瓶子到鍋子裡!",
	YellGreen			= "綠色|r瓶子到鍋子裡!",
	YellDark			= "黑色|r魔法到鍋子裡!",
	Red				= "紅色",
	Blue				= "藍色",
	Green				= "綠色",
	Dark				= "黑色"
})

L:SetOptionLocalization({
	WarnPhase			= "為那個階段即將到來顯示警告",
	WarnRemainingAdds		= "顯示剩餘多少畸變的警告",
	TimerPhase			= "為下一階段顯示計時器",
	RangeFrame			= "藍色階段時顯示距離框 (6碼)",
	FlashFreezeIcon			= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(92979),
	BitingChillIcon			= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(77760),
	ConsumingFlamesIcon		= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(77786)
})

-----------------
--  Chimaeron  --
-----------------
L = DBM:GetModLocalization("Chimaeron")

L:SetGeneralLocalization({
	name 				= "奇瑪隆"
})

L:SetWarningLocalization({
	WarnPhase2Soon			= "第2階段 即將到來",
	WarnBreak			= "%s: >%s< (%d)"
})

L:SetTimerLocalization({
})

L:SetMiscLocalization({
})

L:SetOptionLocalization({
	WarnPhase2Soon			= "為第2階段顯示預先警告",
	WarnBreak			= DBM_CORE_AUTO_ANNOUNCE_OPTIONS.spell:format(82881, GetSpellInfo(82881) or "unknown"),
	RangeFrame			= "顯示距離框 (6碼)",
	WarnBreak			= DBM_CORE_AUTO_ANNOUNCE_OPTIONS.spell:format(82881, GetSpellInfo(82881) or "unknown"),
	SetIconOnSlime			= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(82935)
})

-----------------
--  Atramedes  --
-----------------
L = DBM:GetModLocalization("Atramedes")

L:SetGeneralLocalization({
	name 				= "亞特拉米德"
})

L:SetWarningLocalization({
	WarnAirphase			= "空中階段",
	WarnGroundphase			= "地上階段",
	WarnShieldsLeft			= "使用了古代矮人盾牌 - 剩餘%d次"
})

L:SetTimerLocalization({
	TimerAirphase			= "空中階段",
	TimerGroundphase		= "地上階段"
})

L:SetMiscLocalization({
	AncientDwarvenShield		= "古代矮人盾牌",
	Soundlevel			= "音波值",
	Airphase			= "沒錯，逃吧!每一步都會讓你的心跳加速。跳得轟隆作響...震耳欲聾。你逃不掉的!"
})

L:SetOptionLocalization({
	WarnAirphase			= "當亞特拉米德升空時顯示警告",
	WarnGroundphase			= "當亞特拉米德降落時顯示警告",
	WarnShieldsLeft			= "當古代矮人盾牌使用後顯示警告",
	TimerAirphase			= "為下一次 空中階段顯示計時器",
	TimerGroundphase		= "為下一次 地上階段顯示計時器",
	InfoFrame			= "為音波值顯示資訊框架",
	TrackingIcon			= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(78092)
})

----------------
--  Nefarian  --
----------------
L = DBM:GetModLocalization("Nefarian-BD")	-- No conflict with BWL version :)

L:SetGeneralLocalization({
	name 				= "奈法利安"
})

L:SetWarningLocalization({
	OnyTailSwipe			= "尾部鞭擊 (奧妮克希亞)",
	NefTailSwipe			= "尾部鞭擊 (奈法利安)",
	OnyBreath			= "暗影焰息 (奧妮克希亞)",
	NefBreath			= "暗影焰息 (奈法利安)"
})

L:SetTimerLocalization({
	OnySwipeTimer			= "尾部鞭擊冷卻 (奧妮)",
	NefSwipeTimer			= "尾部鞭擊冷卻 (奈法)",
	OnyBreathTimer			= "暗影焰息冷卻 (奧妮)",
	NefBreathTimer			= "暗影焰息冷卻 (奈法)"
})

L:SetOptionLocalization({
	OnyTailSwipe			= "為奧妮克希亞的$spell:77827顯示警告",
	NefTailSwipe			= "為奈法利安的$spell:77827顯示警告",
	OnyBreath			= "為奧妮克希亞的$spell:94124顯示警告",
	NefBreath			= "為奈法利安的$spell:94124顯示警告",
	OnySwipeTimer			= "為奧妮克希亞的$spell:77827的冷卻時間顯示計時器",
	NefSwipeTimer			= "為奈法利安的$spell:77827的冷卻時間顯示計時器",
	OnyBreathTimer			= "為奧妮克希亞的$spell:94124的冷卻時間顯示計時器",
	NefBreathTimer			= "為奈法利安的$spell:94124的冷卻時間顯示計時器"
})

L:SetMiscLocalization({
	YellPhase2 			= "詛咒你們，凡人!如此冷酷地漠視他人的所有物必須受到嚴厲的懲罰!",
	ShadowblazeCast 		= "化為灰燼吧!",
	ChromaticPrototype 		= "炫彩原型體"
})
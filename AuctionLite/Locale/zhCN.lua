﻿local L = LibStub("AceLocale-3.0"):NewLocale("AuctionLite", "zhCN");
if not L then return end

L["%dh"] = "%d小时"
-- L["(none set)"] = ""
L["Accept"] = "接受"
L["Add a new item to a favorites list by entering the name here."] = "在这输入要添加的新的物品名字来添加到收藏列表."
L["Add an Item"] = "增加一件物品"
L["Advanced"] = "高级"
L["Always"] = "总是"
L["Amount to multiply by vendor price to get default sell price."] = "默认售价等于商人出售乘以你设置的倍数。"
L["Approve"] = "核准"
L["Auction"] = "拍卖"
L["Auction creation is already in progress."] = "正在发布拍卖中。"
L["Auction house data cleared."] = "拍卖行资料已清除。"
-- L["Auction scan skipped (control key is down)"] = ""
L["AuctionLite"] = "AuctionLite"
L["AuctionLite - Buy"] = "AuctionLite - 购买"
L["AuctionLite - Sell"] = "AuctionLite - 出售"
L["AuctionLite Buy"] = "AuctionLite 购买"
L["AuctionLite Sell"] = "AuctionLite 出售"
L["AuctionLite v%s loaded!"] = "AuctionLite v%s 已经载入！"
L["Batch %d: %d at %s"] = "批量 %d: %d 在 %s"
L["Bid Per Item"] = "竞标价/件"
L["Bid Price"] = "出价"
L["Bid Total"] = "竞标价"
L["Bid Undercut"] = "竞标削价"
L["Bid cost for %d:"] = "竞标价花费 %d:"
L["Bid on %dx %s (%d |4listing:listings; at %s)."] = "竞标价在 %dx %s (%d |4项:项; 在 %s)."
L["Bought %dx %s (%d |4listing:listings; at %s)."] = "购买 %dx %s (%d |4项:项; 在 %s)."
L["Buy Tab"] = "购买标签"
L["Buyout Per Item"] = "一口价/件"
L["Buyout Price"] = "一口价"
L["Buyout Total"] = "一口价"
L["Buyout Undercut"] = "一口价削价"
L["Buyout cannot be less than starting bid."] = "一口价不能低于竞标价。"
L["Buyout cost for %d:"] = "全部买下花费 %d:"
L["CANCEL_CONFIRM_TEXT"] = "你的一些拍卖已经有了出价. 你是否想要取消所有拍卖, 取消没有出价的拍卖, 或不做任何操作?"
-- L["CANCEL_NOTE"] = ""
L["CANCEL_TOOLTIP"] = [=[|cffffffff点击:|r 取消所有拍卖
|cffffffffCtrl-点击:|r 取消削价的拍卖]=]
L["CLEAR_DATA_WARNING"] = "你真的想要用AuctionLite删除所有拍卖行收集到的价钱资料？"
L["Cancel"] = "取消"
L["Cancel All"] = "取消全部"
L["Cancel All Auctions"] = "取消所有拍卖"
L["Cancel Unbid"] = "取消没有出价的"
L["Cancel Undercut Auctions"] = "取消削价的拍卖"
L["Cancelled %d listings of %s"] = "取消 %d 在 %s 项"
L["Cancelled %d |4listing:listings; of %s."] = "已取消%d|4项:项; 的%s。"
L["Choose a favorites list to edit."] = "选择一个收藏列表来编辑"
L["Choose which tab is selected when opening the auction house."] = "选择打开拍卖行时显示的标签。"
L["Clear All"] = "清除所有"
L["Clear All Data"] = "清除所有资料"
L["Clear all auction house price data."] = "清除所有拍卖行价钱资料。"
L["Competing Auctions"] = "相抵触的拍卖"
L["Configure"] = "设置"
L["Configure AuctionLite"] = "设置AuctionLite"
L["Consider Resale Value When Buying"] = "购买时考虑转售价值"
L["Consider resale value of excess items when filling an order on the \"Buy\" tab."] = "考虑转售价值过剩的物品在在\"购买\"标签上填写订单时。"
L["Create a new favorites list."] = "建立一个新的收藏列表."
L["Created %d |4auction:auctions; of %s x%d (%s total)."] = "新增 %d |4拍卖:拍卖; : %s x%d (%s total)." -- Needs review
L["Created %d |4auction:auctions; of %s x%d."] = "新增 %d |4拍卖:拍卖; : %s x%d."
L["Current: %s (%.2fx historical)"] = "目前:%s(%.2fx 历史)"
L["Current: %s (%.2fx historical, %.2fx vendor)"] = "目前:%s(%.2fx 历史,%.2fx 商店)"
L["Current: %s (%.2fx vendor)"] = "目前: %s (%.2fx 商店)"
L["Deals must be below the historical price by this much gold."] = "必须比历史价格低这么多金" -- Needs review
L["Deals must be below the historical price by this percentage."] = "必须比历史价格低这么多百分率" -- Needs review
L["Default"] = "默认"
L["Default Number of Stacks"] = "预设堆叠数目"
L["Default Stack Size"] = "预设堆叠大小"
L["Delete"] = "删除"
L["Delete the selected favorites list."] = "删除已选择的收藏列表"
L["Disable"] = "禁用"
L["Disenchant"] = "分解"
L["Do Nothing"] = "无操作"
L["Do it!"] = "完成它!"
L["Enable"] = "启用"
L["Enter item name and click \"Search\""] = "输入物品名称并点击“搜索”"
L["Enter the name of the new favorites list:"] = "输入新的收藏列表的名字:"
L["Error locating item in bags.  Please try again!"] = "在背包中定位物品错误，请重试！"
L["Error when creating auctions."] = "发布拍卖时出现错误。"
L["FAST_SCAN_AD"] = [=[快速扫描功能将在几秒钟之内扫描拍卖行。
但是，快速扫描可能会引起掉线问题。如果发生了掉线，请关闭快速扫描。
启用快速扫描？]=]
L["Fast Auction Scan"] = "快速扫描"
L["Fast auction scan disabled."] = "快速扫描已停用。"
L["Fast auction scan enabled."] = "快速扫描已启用。"
L["Favorites"] = "收藏"
L["Full Scan"] = "完整扫描"
L["Full Stack"] = "完整堆叠"
L["Historical Price"] = "历史价格"
L["Historical price for %d:"] = "%d的历史价格："
L["Historical: %s (%d |4listing:listings;/scan, %d |4item:items;/scan)"] = "历史: %s (%d |4项:项;/扫描, %d |4物品:物品;/扫描)"
L["If Applicable"] = "如果可用"
L["Invalid starting bid."] = "无效的竞标价。"
L["Item"] = "物品"
L["Item Summary"] = "物品摘要"
L["Items"] = "物品"
L["Last Used Tab"] = "最后使用的标签"
L["Listings"] = "列表"
L["Market Price"] = "市场价"
L["Max Stacks"] = "最大堆叠"
L["Max Stacks + Excess"] = "最大堆叠 + 剩余"
-- L["Member Of"] = ""
L["Minimum Profit (Gold)"] = "最小利润（金）"
L["Minimum Profit (Pct)"] = "最小利润（百分率）"
L["Name"] = "名称"
L["Net cost for %d:"] = "%d的成本:"
L["Never"] = "从不"
L["New..."] = "新的..."
L["No current auctions"] = "目前没有拍卖"
L["No deals found"] = "没有发现交易"
L["No items found"] = "未找到物品"
L["Not enough cash for deposit."] = "没有足够的金币。"
L["Not enough items available."] = "没有足够的物品。"
L["Note: %d |4listing:listings; of %d |4item was:items were; not purchased."] = "注意: %d |4项:项; 的 %d |4物品:物品; 没有购买."
L["Number of Items"] = "物品数量"
L["Number of Items |cff808080(max %d)|r"] = "物品数量 |cff808080(最大 %d)|r"
L["Number of stacks suggested when an item is first placed in the \"Sell\" tab."] = "建议堆叠数目当物品首先放置在\"出售\"标签。"
L["On the summary view, show how many listings/items are yours."] = "在总结检视中，显示多少项/物品是你的"
L["One Item"] = "一件物品"
L["One Stack"] = "一堆叠"
L["Open All Bags at AH"] = "打开所有背包"
L["Open all your bags when you visit the auction house."] = "当你打开拍卖行时自动打开所有背包。"
L["Open configuration dialog"] = "打开设置界面"
L["Percent to undercut market value for bid prices (0-100)."] = "将市场价削价后作为竞标价的百分比（0-100）。"
L["Percent to undercut market value for buyout prices (0-100)."] = "将市场价削价后作为一口价的百分比（0-100）。"
L["Potential Profit"] = "盈利潜力"
L["Pricing Method"] = "价格模式"
L["Print Detailed Price Data"] = "显示详细的价格数据"
L["Print detailed price data when selling an item."] = "当出售某物品时，显示详细的价格数据。"
L["Profiles"] = "配置"
L["Qty"] = "数量"
L["Remove Items"] = "移除物品"
L["Remove the selected items from the current favorites list."] = "从当前的收藏列表中移除已选择的物品"
L["Resell %d:"] = "再卖 %d:"
L["Round Prices"] = "价格范围"
L["Round all prices to this granularity, or zero to disable (0-1)."] = "将所有物价限制在这个范围内，0为关闭该功能（0-1）。"
L["Save All"] = "保存所有"
L["Saved Item Settings"] = "已保存物品设置"
L["Scan complete.  Try again later to find deals!"] = "扫描完成. 稍后再尝试寻找交易!"
L["Scanning..."] = "扫描中……"
L["Scanning:"] = "扫描中："
L["Search"] = "搜索"
L["Searching:"] = "搜索中："
L["Select a Favorites List"] = "选择一个物品列表"
L["Selected Stack Size"] = "已选择堆叠大小"
L["Sell Tab"] = "出售标签"
L["Show Auction Value"] = "显示拍卖行价格"
L["Show Deals"] = "显示交易" -- Needs review
L["Show Disenchant Value"] = "显示附魔等级"
L["Show Favorites"] = "显示收藏夹"
L["Show Full Stack Price"] = "堆叠价格"
L["Show How Many Listings are Mine"] = "显示有多少项是我的"
L["Show My Auctions"] = "显示我的拍卖"
L["Show Vendor Price"] = "显示商人价格"
L["Show auction house value in tooltips."] = "在鼠标提示中显示拍卖行价格。"
L["Show expected disenchant value in tooltips."] = "显示分解该物品所需的附魔技能等级。"
L["Show full stack prices in tooltips (shift toggles on the fly)."] = "显示堆叠价格。"
L["Show vendor sell price in tooltips."] = "在鼠标提示中显示商人的价格。"
L["Stack Count"] = "堆叠计数"
L["Stack Size"] = "堆叠大小"
L["Stack size suggested when an item is first placed in the \"Sell\" tab."] = "建议堆叠大小当物品首先放置在\"出售\"标签。"
L["Stack size too large."] = "堆叠数量太大."
L["Start Tab"] = "初始标签"
L["Store Price Data"] = "储存价钱资料"
L["Store price data for all items seen (disable to save memory)."] = "储存所有已见过的物品价钱资料(禁用以节省内存)."
L["Time Elapsed:"] = "花费时间："
L["Time Remaining:"] = "剩余时间："
L["Tooltips"] = "鼠标提示"
L["Use Coin Icons in Tooltips"] = "显示钱币图标"
L["Use fast method for full scans (may cause disconnects)."] = "使用快速模式扫描拍卖行（可能会引起掉线）。"
L["Uses the standard gold/silver/copper icons in tooltips."] = "在鼠标提示中使用图标代替 金、银、铜字样。"
L["VENDOR_WARNING"] = "你的一口价价格低于商人价格. 你是否仍然要建立这个拍卖?"
L["Vendor"] = "商人"
L["Vendor Multiplier"] = "商人倍数" -- Needs review
L["Vendor: %s"] = "商人：%s"
L["per item"] = "每件" -- Needs review
L["per stack"] = "每堆"
L["stacks of"] = "堆叠"
L["|cff00ff00Scanned %d listings.|r"] = "|cff00ff00搜索到 %d 项.|r"
L["|cff00ff00Using previous price.|r"] = "|cff00ff00使用之前的价格。|r"
L["|cff808080(per item)|r"] = "|cff808080(每件)|r"
L["|cff808080(per stack)|r"] = "|cff808080(每组)|r"
L["|cff8080ffData for %s x%d|r"] = "|cff8080ff数据: %s x%d|r"
L["|cffff0000Buyout less than bid.|r"] = "|cffff0000一口价低于竞标价。|r"
L["|cffff0000Buyout less than vendor price.|r"] = "|cffff0000一口价低于商人售价。|r"
L["|cffff0000Invalid stack size/count.|r"] = "|cffff0000无效的堆叠数。|r"
L["|cffff0000No bid price set.|r"] = "|cffff0000没有设置竞标价。|r"
L["|cffff0000Not enough cash for deposit.|r"] = "|cffff0000没有足够的现金。|r"
L["|cffff0000Not enough items available.|r"] = "|cffff0000没有足够的物品。|r"
L["|cffff0000Stack size too large.|r"] = "|cffff0000堆叠数量太大.|r"
L["|cffff0000Using %.3gx vendor price.|r"] = "|cffff0000使用 %.3gx 商店价格.|r"
L["|cffff0000[Error]|r Insufficient funds."] = "|cffff0000[错误]|r 资金不足。"
L["|cffff0000[Warning]|r Skipping your own auctions.  You might want to cancel them instead."] = "|cffff0000[警告]|r 跳过你自己的拍卖。  也许你打算取消掉他们。"
L["|cffff7030Buyout less than vendor price.|r"] = "|cffff7030一口价低于商人价格.|r"
L["|cffff7030Stack %d will have %d |4item:items;.|r"] = "|cffff7030堆叠 %d 将有 %d |4物品:物品;.|r"
L["|cffffd000Using historical data.|r"] = "|cffffd000使用历史数据。|r" -- Needs review
L["|cffffff00Scanning: %d%%|r"] = "|cffffff00搜索中：%d%%|r"


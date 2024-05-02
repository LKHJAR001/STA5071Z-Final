breed [binancians binancian]
breed[binance_arbitrageurs binance_arbitrageur]
breed[binancelivetraders binancelivetrader]
breed[smatraders smatrader]
breed[macdtraders macdtrader]
breed[solodistraders solodistrader]

breed[ftxians ftxian]
breed[ftx_arbitrageurs ftx_arbitrageur]
breed[ftxlivetraders ftxlivetrader]

binancians-own[buy sell price cash crypto profit]
binance_arbitrageurs-own[cash crypto]
binancelivetraders-own[cash crypto]
smatraders-own[cash crypto]
macdtraders-own[cash crypto]
solodistraders-own[buy sell cash crypto profit]

ftxians-own[buy sell price cash crypto profit]
FTX_arbitrageurs-own[cash crypto]
ftxlivetraders-own[cash crypto]

globals [Binance_BTC/USD logBuyBinance logSellBinance binance_tick_closing_price binance_logticks binance_tick_list
binance_live_buy_list binance_live_sell_list binance_live_perc_long_avg binance_live_perc_short_avg binance_live_long_pnl binance_live_short_pnl
sma1 sma2 sma_long sma_short sma_long_pnl sma_short_pnl sma_perc_long_avg sma_perc_short_avg sma_activelong sma_activeshort sma_totalprofit
binance_bb_sma binance_bb_band_upper binance_bb_band_lower
macd_list macd_long macd_short macd_long_pnl macd_short_pnl macd_perc_long_avg macd_perc_short_avg macd_activelong macd_activeshort macd_totalprofit
nbinancelivetraders nsmatraders nmacdtraders nsolodistraders


FTX_BTC/USD logBuyFTX logSellFTX FTX_tick_closing_price FTX_logticks FTX_tick_list
FTX_live_buy_list FTX_live_sell_list FTX_live_perc_long_avg FTX_live_perc_short_avg FTX_live_long_pnl FTX_live_short_pnl
FTX_bb_sma FTX_bb_band_upper FTX_bb_band_lower
nftxlivetraders


]

to setup
  clear-all
;  set Binance-Volatility vol
;  set FTX-Volatility vol
;
;  set binance_profit profitset
;  set FTX_profit profitset
;  set binance_loss loss
;  set FTX_loss loss

  set Binance_BTC/USD 60000
  set FTX_BTC/USD 60000
  reset-ticks
  set nbinancelivetraders 1
  set nsmatraders 1
  set nmacdtraders 1
  set nsolodistraders 1
  set nftxlivetraders 1

  create-binancians nbinancians
  create-binance_arbitrageurs nbinance_arbitrageurs
  create-macdtraders nmacdtraders
  create-smatraders nsmatraders
  create-solodistraders nsolodistraders
  create-binancelivetraders nbinancelivetraders

  create-ftxians nftxians
  create-ftx_arbitrageurs nftx_arbitrageurs
  create-ftxlivetraders nftxlivetraders


  let side sqrt (nbinancians + nbinance_arbitrageurs + nmacdtraders + nsmatraders + nsolodistraders + nbinancelivetraders )

  let xstep (max-pxcor / 2 - 1) / side
  let ystep max-pycor / side

  let side2 sqrt (nftxians + nftx_arbitrageurs + nftxlivetraders)

  let xstep2 (max-pxcor / 2 - 1) / side2
  let ystep2 max-pycor / side2





ask binancians
  [
    set shape "person"
    set size 0.9
    set crypto 1e6
    set cash 1e6
    set color white
  ]

ask binance_arbitrageurs[
    set shape "person"
    set size 0.9
    set crypto 1e6
    set cash 1e6
    set color random 140
  ]

ask macdtraders[
    set shape "person"
    set size 0.9
    set crypto 1e6
    set cash 1e6
    set color white
  ]

ask smatraders[
    set shape "person"
    set size 0.9
    set crypto 1e6
    set cash 1e6
    set color white
  ]

ask solodistraders[
    set shape "person"
    set size 0.9
    set crypto 1e6
    set cash 1e6
    set color white
]


ask binancelivetraders[
    set shape "person"
    set size 0.9
    set crypto 1e6
    set cash 1e6
    set color white
  ]


let an 0
let x 0.2
let y 1
while [an < (nbinancians + nbinance_arbitrageurs + nmacdtraders + nsmatraders + nsolodistraders + nbinancelivetraders)]
  [
    if y > max-pycor - 0.5
                [set x x + xstep
                 set y 1      ]
    if an < nbinancians[
      ask binancian an
      [setxy x y]
      set y y + ystep
    ]
    if an >= nbinancians and an < (nbinancians + nbinance_arbitrageurs)[
      ask binance_arbitrageur an
      [setxy x y]
      set y y + ystep
    ]
    if an >= (nbinancians + nbinance_arbitrageurs) and an < (nbinancians + nbinance_arbitrageurs + nmacdtraders)[
      ask macdtrader an
      [setxy x y]
      set y y + ystep
      ]
      if an >=  (nbinancians + nbinance_arbitrageurs + nmacdtraders) and an < (nbinancians + nbinance_arbitrageurs + nmacdtraders + nsmatraders)[
        ask smatrader an
        [setxy x y]
        set y y + ystep
      ]
      if an >=  (nbinancians + nbinance_arbitrageurs + nmacdtraders + nsmatraders) and an < (nbinancians + nbinance_arbitrageurs + nmacdtraders + nsmatraders + nsolodistraders)[
        ask solodistrader an
        [setxy x y]
        set y y + ystep
      ]
      if an >=  (nbinancians + nbinance_arbitrageurs + nmacdtraders + nsmatraders + nsolodistraders) and an < (nbinancians + nbinance_arbitrageurs + nmacdtraders + nsmatraders + nsolodistraders + nbinancelivetraders)[
        ask binancelivetrader an
        [setxy x y]
        set y y + ystep
      ]
    set an an + 1
  ]

ask ftxians
  [
    set shape "person"
    set size 0.9
    set crypto 1e6
    set cash 1e6
    set color white
  ]
ask ftx_arbitrageurs[
    set shape "person"
    set size 0.9
    set crypto 1e6
    set cash 1e6
    set color random 140
  ]
ask ftxlivetraders[
    set shape "person"
    set size 0.9
    set crypto 1e6
    set cash 1e6
    set color white
  ]



set x max-pxcor - 0.2
set y 1
while [an < (nbinancians + nbinance_arbitrageurs + nmacdtraders + nsmatraders + nsolodistraders + nbinancelivetraders + nftxians + nftx_arbitrageurs + nftxlivetraders)]
  [
    if y > max-pycor - 0.5
                [set x x - xstep2
                 set y 1      ]
    if an < (nbinancians + nbinance_arbitrageurs + nmacdtraders + nsmatraders + nsolodistraders + nbinancelivetraders + nftxians)[
      ask ftxian an
      [setxy x y]
      set y y + ystep2
    ]
    if an >= (nbinancians + nbinance_arbitrageurs + nmacdtraders + nsmatraders + nsolodistraders + nbinancelivetraders + nftxians)
    and an < (nbinancians + nbinance_arbitrageurs + nmacdtraders + nsmatraders + nsolodistraders + nbinancelivetraders + nftxians + nftx_arbitrageurs)[
      ask ftx_arbitrageur an
      [setxy x y]
      set y y + ystep2
    ]
    if an >= (nbinancians + nbinance_arbitrageurs + nmacdtraders + nsmatraders + nsolodistraders + nbinancelivetraders + nftxians + nftx_arbitrageurs)
    and an < (nbinancians + nbinance_arbitrageurs + nmacdtraders + nsmatraders + nsolodistraders + nbinancelivetraders + nftxians + nftx_arbitrageurs + nftxlivetraders)[
      ask ftxlivetrader an
      [setxy x y]
      set y y + ystep2
    ]
    set an an + 1
  ]






set binance_logticks []
set binance_tick_list []

set binance_live_buy_list[]
set binance_live_sell_list []

set sma_long []
set sma_short []
set sma_activelong False
set sma_activeshort False
set sma_totalprofit [0]

set macd_list []
set macd_long []
set macd_short []
set macd_activelong False
set macd_activeshort False
set macd_totalprofit [0]


set FTX_logticks []
set FTX_tick_list []

set FTX_live_buy_list[]
set FTX_live_sell_list []


end


;ema function
to-report ema_func [macd_period somelist]
  ifelse length somelist >= macd_period[
    let macd_alpha 2 / (macd_period + 1)
    let tmp1 reverse (sublist (reverse somelist) 0 macd_period)
    let ema item 0 tmp1 ;initialize ema
    let i 0
    repeat length tmp1[
      set ema (((item i tmp1) * macd_alpha) + (ema * (1 - macd_alpha)))
      set i (i + 1)
    ]
    report ema
  ][set macd_period length somelist
    let macd_alpha 2 / (macd_period + 1)
    let tmp1 reverse (sublist (reverse somelist) 0 macd_period)
    let ema item 0 tmp1 ;initialize ema
    let i 0
    repeat length tmp1[
      set ema (((item i tmp1) * macd_alpha) + (ema * (1 - macd_alpha)))
      set i (i + 1)
    ]
    report ema
  ]

end



to move [mover movee]
          let original_xcor [xcor] of mover
          let original_ycor [ycor] of mover

          let step_size .1
          let d_x ([xcor] of movee - original_xcor) * step_size
          let d_y ([ycor] of movee - original_ycor) * step_size
          let sum_radii item 0 [size] of turtles

          while [sqrt(  ([xcor] of mover - [xcor] of movee) ^ 2  + ([ycor] of mover - [ycor] of movee) ^ 2 ) > sum_radii  ] [
            ask mover [
              setxy xcor + d_x ycor + d_y
            ]
            ;; Optional delay to observe movement
            wait 0.1
          ]

          let distance_to_original sqrt (([xcor] of mover - original_xcor) ^ 2 + ([ycor] of mover - original_ycor) ^ 2)

          ;; Move the buyer back to its original position
          while [distance_to_original > 0.01] [
            ask mover [
              setxy xcor - d_x ycor - d_y
            ]
            ;; Recalculate the distance to the original position
            set distance_to_original sqrt (([xcor] of mover - original_xcor) ^ 2 + ([ycor] of mover - original_ycor) ^ 2)

            ;; Optional delay to observe movement
            wait 0.1
          ]
end


to check [crypto_funds]
  if crypto_funds > 1e6 [set shape "cow skull" set color green]
  if crypto_funds < 1e6 [set shape "wolf 6" set color red]
  if crypto_funds = 1e6 [set shape "person" set color white]
end

to-report binance_pnl [binancian_guy]
  if [crypto] of binancian_guy > 1e6 [report [cash] of binancian_guy + ([crypto] of binancian_guy - 1e6) * Binance_BTC/USD - 1e6]
  if [crypto] of binancian_guy < 1e6 [report [cash] of binancian_guy - (1e6 - [crypto] of binancian_guy) * Binance_BTC/USD - 1e6]
  if [crypto] of binancian_guy = 1e6 [report [cash] of binancian_guy - 1e6]
end

to-report FTX_pnl [ftxian_guy]
  if [crypto] of ftxian_guy > 1e6 [report [cash] of ftxian_guy + ([crypto] of ftxian_guy - 1e6) * FTX_BTC/USD - 1e6]
  if [crypto] of ftxian_guy < 1e6 [report [cash] of ftxian_guy - (1e6 - [crypto] of ftxian_guy) * FTX_BTC/USD - 1e6]
  if [crypto] of ftxian_guy = 1e6 [report [cash] of ftxian_guy - 1e6]
end



to go

;------------------------------------------------------------------------------Binance Live Trading Checks-------------------------------------------------------------------------
;Live Trading profits
ifelse not empty? binance_live_buy_list[
    set binance_live_perc_long_avg 100 * (binance_tick_closing_price - mean(binance_live_buy_list)) / mean(binance_live_buy_list)
    set binance_live_long_pnl sum(map [x -> binance_tick_closing_price - x] binance_live_buy_list)
  ][set binance_live_perc_long_avg 0 set binance_live_long_pnl 0]
ifelse not empty? binance_live_sell_list[
    set binance_live_perc_short_avg 100 * (mean(binance_live_sell_list) - binance_tick_closing_price) / binance_tick_closing_price
    set binance_live_short_pnl sum(map [x -> x - binance_tick_closing_price] binance_live_sell_list)
  ][set binance_live_perc_short_avg 0 set binance_live_short_pnl 0]
;



;------------------------------------------------------------------------------------BOOK BINANCE--------------------------------------------------------------------------
;make sure ticks are ok
if (length binance_logticks mod binance_tick_count) = 0 [set binance_logticks []]


set logBuyBinance []
set logSellBinance []

while [(length binance_logticks < binance_tick_count) or (length binance_logticks mod binance_tick_count != 0)][
    ask binancians[
      set profit binance_pnl binancian who
      if (length binance_logticks < binance_tick_count) or ((length binance_logticks mod binance_tick_count) != 0)[
        ;If net long, and certain profit/loss achieved, then sell 1 contract
        if crypto > 1e6 and (cash + (crypto - 1e6) * Binance_BTC/USD - 1e6 > binance_profit or cash +  (crypto - 1e6) * Binance_BTC/USD - 1e6 < (-1) * binance_loss )[
          if not empty? logBuyBinance[
            set color red
            set Binance_BTC/USD item 0 (item 0 logBuyBinance)
            set binance_logticks lput Binance_BTC/USD binance_logticks
            let agB item 1 (item 0 logBuyBinance)
            if move_true [move binancian who binancian agB]
            set crypto crypto - 1 set cash cash + Binance_BTC/USD check crypto
            ask binancian agB [set crypto crypto + 1
              set cash cash - Binance_BTC/USD check crypto ]
            set logBuyBinance but-first logBuyBinance
          ]
         ]
        ;If net short, and certain profit/loss achieved, then buy 1 contract
        if crypto < 1e6 and (cash - (1e6 - crypto) * Binance_BTC/USD - 1e6 > binance_profit or cash - (1e6 - crypto) * Binance_BTC/USD - 1e6 < (-1) * binance_loss)[
          if not empty? logSellBinance[
            set color green
            set Binance_BTC/USD item 0 (item 0 logSellBinance)
            set binance_logticks lput Binance_BTC/USD binance_logticks
            let agS item 1 (item 0 logSellBinance)
            if move_true [move binancian who binancian agS]
            set crypto crypto + 1 set cash cash - Binance_BTC/USD check crypto
            ask binancian agS [set crypto crypto - 1
               set cash cash + Binance_BTC/USD check crypto ]
            set logSellBinance but-first logSellBinance
          ]
        ]
        ;random entries
        ifelse random-float 1 < 0.5 [set buy  True set sell False][set sell True set buy  False]
        if buy           [set color green]
        if sell          [set color red]
        if buy [set price Binance_BTC/USD + random-normal 0 Binance-Volatility ]
        if sell[set price Binance_BTC/USD  + random-normal 0 Binance-Volatility]

        let tmp[]
        set tmp lput price tmp
        set tmp lput who tmp
        if buy [set logBuyBinance lput tmp logBuyBinance]
        set logBuyBinance reverse sort-by [ [?1 ?2] -> item 0 ?1 < item 0 ?2 ] logBuyBinance

        if (not empty? logBuyBinance and not empty? logSellBinance) and item 0 (item 0 logBuyBinance) >= item 0 (item 0 logSellBinance)
        [set Binance_BTC/USD item 0 (item 0 logSellBinance)
          set binance_logticks lput Binance_BTC/USD binance_logticks
          let agB item 1 (item 0 logBuyBinance)
          let agS item 1 (item 0 logSellBinance)

          if move_true [move (binancian agB) (binancian agS)]
          ask binancian agB [set crypto crypto + 1
            set cash cash - Binance_BTC/USD
            check crypto ]
          ask binancian agS [set crypto crypto - 1
            set cash cash + Binance_BTC/USD
            check crypto]





          set logBuyBinance but-first logBuyBinance
          set logSellBinance but-first logSellBinance
        ]

        if sell [set logSellBinance lput tmp logSellBinance]
        set logSellBinance sort-by [ [?1 ?2] -> item 0 ?1 < item 0 ?2 ] logSellBinance

        if (not empty? logBuyBinance and not empty? logSellBinance) and item 0 (item 0 logBuyBinance) >= item 0 (item 0 logSellBinance)
        [set Binance_BTC/USD item 0 (item 0 logBuyBinance)
          set binance_logticks lput Binance_BTC/USD binance_logticks
          let agB item 1 (item 0 logBuyBinance)
          let agS item 1 (item 0 logSellBinance)


          if move_true [move binancian agS binancian agB]
          ask binancian agB [set crypto crypto + 1
            set cash cash - Binance_BTC/USD
            check crypto]
          ask binancian agS [set crypto crypto - 1
            set cash cash + Binance_BTC/USD
            check crypto]
          set logBuyBinance but-first logBuyBinance
          set logSellBinance but-first logSellBinance
        ]
      ]
      set buy False set sell False
    ]
;    ;if market stops because everyone is either long or short and no one wants to liquidate ie. no trasaction after iterating through all traders: most profitable longer and shorter transacts at last price
;    if binance_someone_liquidated =  False and standard-deviation [crypto] of binancians != 0 and
;    any? binancians with [crypto > 1e6] and any? binancians with [crypto < 1e6] ;there has to exist both a bull and bear
;    [
;          let seller max-one-of binancians with [crypto > 1e6] [cash]
;          let buyer max-one-of binancians with [crypto < 1e6] [cash]
;          ask buyer[
;            set color green ;a green bear now
;            set binance_logticks lput Binance_BTC/USD binance_logticks
;            ask seller [set color red]; a red bull
;            if move_true [move buyer seller]
;            set crypto crypto + 1 set cash cash - Binance_BTC/USD
;            ask seller [set crypto crypto - 1 set cash cash + Binance_BTC/USD set shape "person" set color white]
;            set shape "person" set color white
;        ]
;    ]
]
graph8

set binance_tick_closing_price last binance_logticks
graph1
set binance_tick_list lput binance_tick_closing_price binance_tick_list




;---------------------------------------------------------------------------------Binance Bollinger Bands--------------------------------------------------------------------------------------
ifelse length binance_tick_list >= binance_bb_sma_period [
  set binance_bb_sma mean (sublist (reverse binance_tick_list) 0 binance_bb_sma_period)
  let binance_bb_band_sd standard-deviation (sublist (reverse binance_tick_list) 0 binance_bb_sma_period)
  set binance_bb_band_upper (binance_bb_sma +  (binance_bb_band_sd * binance_bb_band_sd_set))
  set binance_bb_band_lower (binance_bb_sma -  (binance_bb_band_sd * binance_bb_band_sd_set))
] [
  ; handle case where the tick_list is shorter than the SMA period
  set binance_bb_sma mean binance_tick_list
  ifelse length binance_tick_list = 1 [set binance_bb_band_upper (binance_bb_sma + 3 * Binance-Volatility) set binance_bb_band_lower (binance_bb_sma - 3 * Binance-Volatility)]
  [let binance_bb_band_sd standard-deviation binance_tick_list
  set binance_bb_band_upper binance_bb_sma +  binance_bb_band_sd * binance_bb_band_sd_set
  set binance_bb_band_lower binance_bb_sma -  binance_bb_band_sd * binance_bb_band_sd_set
    ]
]
graph4

;;---------------------------------------------------------------------------------Solo Disciplined Trader--------------------------------------------------------------------------------------
;ask solodistraders[
;    set profit binance_pnl solodistrader who
;    ;If net long, and certain profit/loss achieved, then sell 1 contract
;    if crypto > 1e6 and (cash + (crypto - 1e6) * Binance_BTC/USD - 1e6 > solo_profit or cash +  (crypto - 1e6) * Binance_BTC/USD - 1e6 < (-1) * solo_loss )[
;    if not empty? logBuyBinance[
;      set color red
;      set Binance_BTC/USD item 0 (item 0 logBuyBinance)
;      set binance_logticks lput Binance_BTC/USD binance_logticks
;      let agB item 1 (item 0 logBuyBinance)
;      if move_true [move solodistrader who binancian agB]
;      set crypto crypto - 1 set cash cash + Binance_BTC/USD check crypto
;      ask binancian agB [set crypto crypto + 1
;        set cash cash - Binance_BTC/USD check crypto ]
;      set logBuyBinance but-first logBuyBinance
;      set binance_logticks lput Binance_BTC/USD binance_logticks
;      if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
;      ]
;   ]
;   ;If net short, and certain profit/loss achieved, then buy 1 contract
;   if crypto < 1e6 and (cash - (1e6 - crypto) * Binance_BTC/USD - 1e6 > solo_profit or cash - (1e6 - crypto) * Binance_BTC/USD - 1e6 < (-1) * solo_loss)[
;     if not empty? logSellBinance[
;       set color green
;       set Binance_BTC/USD item 0 (item 0 logSellBinance)
;       set binance_logticks lput Binance_BTC/USD binance_logticks
;       let agS item 1 (item 0 logSellBinance)
;       if move_true [move solodistrader who binancian agS]
;       set crypto crypto + 1 set cash cash - Binance_BTC/USD check crypto
;       ask binancian agS [set crypto crypto - 1
;          set cash cash + Binance_BTC/USD check crypto ]
;       set logSellBinance but-first logSellBinance
;       set binance_logticks lput Binance_BTC/USD binance_logticks
;       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
;      ]
;    ]
;    ;if flat; randomize
;    if crypto = 1e6[ifelse random-float 1 < 0.5 [set buy  True set sell False][set sell True set buy  False]
;    if buy and not empty? logSellBinance[
;      set color green
;      set Binance_BTC/USD item 0 (item 0 logSellBinance)
;      set binance_logticks lput Binance_BTC/USD binance_logticks
;      let agS item 1 (item 0 logSellBinance)
;      if move_true [move solodistrader who binancian agS]
;      set crypto crypto + 1 set cash cash - Binance_BTC/USD check crypto
;      ask binancian agS [set crypto crypto - 1
;         set cash cash + Binance_BTC/USD check crypto ]
;      set logSellBinance but-first logSellBinance
;      set binance_logticks lput Binance_BTC/USD binance_logticks
;      if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
;     ]
;    if sell and not empty? logBuyBinance[
;      set color red
;      set Binance_BTC/USD item 0 (item 0 logBuyBinance)
;      set binance_logticks lput Binance_BTC/USD binance_logticks
;      let agB item 1 (item 0 logBuyBinance)
;      if move_true [move solodistrader who binancian agB]
;      set crypto crypto - 1 set cash cash + Binance_BTC/USD check crypto
;      ask binancian agB [set crypto crypto + 1
;        set cash cash - Binance_BTC/USD check crypto ]
;      set logBuyBinance but-first logBuyBinance
;      set binance_logticks lput Binance_BTC/USD binance_logticks
;      if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
;      ]
;    ]
;  ]
;graph9
;

;---------------------------------------------------------------------------------MACD Trading--------------------------------------------------------------------------------------
set macd_list lput ( (ema_func macd_first_period binance_tick_list) - (ema_func macd_second_period binance_tick_list) ) macd_list
graph5

;unrealized pnl
ifelse not empty? macd_long[
    set macd_perc_long_avg 100 * (binance_tick_closing_price - mean(macd_long)) / mean(macd_long)
    set macd_long_pnl sum(map [x -> binance_tick_closing_price - x] macd_long)
  ][set macd_perc_long_avg 0 set macd_long_pnl 0]
ifelse not empty? macd_short[
    set macd_perc_short_avg 100 * (mean(macd_short) - binance_tick_closing_price) / binance_tick_closing_price
    set macd_short_pnl sum(map [x -> x - binance_tick_closing_price] macd_short)
  ][set macd_perc_short_avg 0 set macd_short_pnl 0]

;keep track of each trades' realized pnl
if empty? macd_long and empty? macd_short [
    if ((sum [cash] of macdtraders - 1e6) - last macd_totalprofit) != 0[
      set macd_totalprofit lput (sum [cash] of macdtraders - 1e6) macd_totalprofit]
  ]

;entries (stopped out if re-cross)
ask macdtraders[
    ;Buy signal
    if last macd_list > (ema_func signal_period macd_list)  and macd_activelong = False[
      ;stop out short if re-cross
      if not empty? macd_short and (length logSellBinance >= length macd_short) [
        ;Binance macdtrader buys the lowest ask
        set color green
        repeat length macd_short[
          set Binance_BTC/USD item 0 (item 0 logSellBinance)
          let agS item 1 (item 0 logSellBinance)
          if move_true [move macdtrader who binancian agS]
          set crypto crypto + 1 set cash cash - Binance_BTC/USD
          ask binancian agS [set crypto crypto - 1
          set cash cash + Binance_BTC/USD check crypto]

          set logSellBinance but-first logSellBinance
          set macd_short but-first macd_short ;cover the first fill
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
      if empty? macd_short [set macd_activeshort False]
      ;keep track of each trades' realized pnl
      if empty? macd_long and empty? macd_short [
          if ((sum [cash] of macdtraders - 1e6) - last macd_totalprofit) != 0[
            set macd_totalprofit lput (sum [cash] of macdtraders - 1e6) macd_totalprofit]
        ]

      ;long entry
      if length logSellBinance >= macd_num_contracts[
        ;Binance macdtrader buys the lowest ask
        set color green
        repeat macd_num_contracts[
            set Binance_BTC/USD item 0 (item 0 logSellBinance)
            let agS item 1 (item 0 logSellBinance)
            if move_true [move macdtrader who binancian agS]
            set crypto crypto + 1 set cash cash - Binance_BTC/USD
            ask binancian agS [set crypto crypto - 1
              set cash cash + Binance_BTC/USD check crypto]

            set logSellBinance but-first logSellBinance
            set macd_long lput Binance_BTC/USD macd_long
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
       set macd_activelong True
      ]

    ]
    ;Short signal
    if last macd_list < (ema_func signal_period macd_list) and macd_activeshort = False [
      ;if holding longs, cover them or stop them out
      if not empty? macd_long and length logBuyBinance >= length macd_long[
        ;Binance macdtrader sells to the highest bidder
        set color red
        repeat length macd_long[
              set Binance_BTC/USD item 0 (item 0 logBuyBinance)
              let agB item 1 (item 0 logBuyBinance)
              if move_true [move macdtrader who binancian agB]
              set crypto crypto - 1 set cash cash + Binance_BTC/USD
              ask binancian agB [set crypto crypto + 1
                set cash cash - Binance_BTC/USD check crypto]

              set logBuyBinance but-first logBuyBinance
              set macd_long but-first macd_long
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
      if empty? macd_long [set macd_activelong False]
      ;keep track of each trades' realized pnl
      if empty? macd_long and empty? macd_short [
          if ((sum [cash] of macdtraders - 1e6) - last macd_totalprofit) != 0[
            set macd_totalprofit lput (sum [cash] of macdtraders - 1e6) macd_totalprofit]
        ]

      ;short entry
      if length logBuyBinance >= macd_num_contracts[
        ;Binance macdtrader sells to the highest bidder
        set color red
        repeat macd_num_contracts[
              set Binance_BTC/USD item 0 (item 0 logBuyBinance)
              let agB item 1 (item 0 logBuyBinance)
              if move_true [move macdtrader who binancian agB]
              set crypto crypto - 1 set cash cash + Binance_BTC/USD
              ask binancian agB [set crypto crypto + 1
                  set cash cash - Binance_BTC/USD check crypto]

              set logBuyBinance but-first logBuyBinance
              set macd_short lput Binance_BTC/USD macd_short
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
       set macd_activeshort True
      ]
    ]
]

;profit-takes & stops
ask macdtraders[
    ;long
    ;1st pt
    if macd_activelong = True[
    if macd_perc_long_avg >= macd_firstpt_sd * Binance-Volatility / 100 and length macd_long = macd_num_contracts[
      if length logBuyBinance >= floor (macd_firstpt_amt * macd_num_contracts) [
        ;Binance macdtrader sells to the highest bidder
        set color red
        repeat floor (macd_firstpt_amt * macd_num_contracts)[
              set Binance_BTC/USD item 0 (item 0 logBuyBinance)
              let agB item 1 (item 0 logBuyBinance)
              if move_true [move macdtrader who binancian agB]
              set crypto crypto - 1 set cash cash + Binance_BTC/USD
              ask binancian agB [set crypto crypto + 1
                  set cash cash - Binance_BTC/USD check crypto]

              set logBuyBinance but-first logBuyBinance
              set macd_long but-first macd_long
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    ]
    ;2ndt pt
    if macd_perc_long_avg >= macd_secondpt_sd * Binance-Volatility / 100 and length macd_long = (macd_num_contracts - (floor (macd_firstpt_amt * macd_num_contracts)))[
      if length logBuyBinance >= floor (macd_secondpt_amt * macd_num_contracts) [
        ;Binance macdtrader sells to the highest bidder
        set color red
        repeat floor (macd_secondpt_amt * macd_num_contracts)[
              set Binance_BTC/USD item 0 (item 0 logBuyBinance)
              let agB item 1 (item 0 logBuyBinance)
              if move_true [move macdtrader who binancian agB]
              set crypto crypto - 1 set cash cash + Binance_BTC/USD
              ask binancian agB [set crypto crypto + 1
                  set cash cash - Binance_BTC/USD check crypto]

              set logBuyBinance but-first logBuyBinance
              set macd_long but-first macd_long
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    ]
    ;3rd pt sells left-overs
    if macd_perc_long_avg >= macd_thirdpt_sd * Binance-Volatility / 100 and length macd_long = (macd_num_contracts - (floor (macd_firstpt_amt * macd_num_contracts)) - (floor (macd_secondpt_amt * macd_num_contracts)))[
      if length logBuyBinance >= length macd_long [
        ;Binance macdtrader sells to the highest bidder
        set color red
        repeat length macd_long[
              set Binance_BTC/USD item 0 (item 0 logBuyBinance)
              let agB item 1 (item 0 logBuyBinance)
              if move_true [move macdtrader who binancian agB]
              set crypto crypto - 1 set cash cash + Binance_BTC/USD
              ask binancian agB [set crypto crypto + 1
                  set cash cash - Binance_BTC/USD check crypto]

              set logBuyBinance but-first logBuyBinance
              set macd_long but-first macd_long
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    ]
   ;stop at break-even if any pt hit before
   if macd_perc_long_avg <= 0.01 and ((length macd_long) > 0) and ((length macd_long) < macd_num_contracts)[
      if length logBuyBinance >= length macd_long [
        ;Binance macdtrader sells to the highest bidder
        set color red
        repeat length macd_long[
              set Binance_BTC/USD item 0 (item 0 logBuyBinance)
              let agB item 1 (item 0 logBuyBinance)
              if move_true [move macdtrader who binancian agB]
              set crypto crypto - 1 set cash cash + Binance_BTC/USD
              ask binancian agB [set crypto crypto + 1
                  set cash cash - Binance_BTC/USD check crypto]

              set logBuyBinance but-first logBuyBinance
              set macd_long but-first macd_long
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    ]
   ;stop
   if macd_perc_long_avg <= (-1) * macd_stop_sd * Binance-Volatility / 100[
      if length logBuyBinance >= length macd_long [
        ;Binance macdtrader sells to the highest bidder
        set color red
        repeat length macd_long[
              set Binance_BTC/USD item 0 (item 0 logBuyBinance)
              let agB item 1 (item 0 logBuyBinance)
              if move_true [move macdtrader who binancian agB]
              set crypto crypto - 1 set cash cash + Binance_BTC/USD
              ask binancian agB [set crypto crypto + 1
                  set cash cash - Binance_BTC/USD check crypto]

              set logBuyBinance but-first logBuyBinance
              set macd_long but-first macd_long
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    ]
  ]
    ;shorts
    ;1st pt
    if macd_activeshort = True[
    if macd_perc_short_avg >= macd_firstpt_sd * Binance-Volatility / 100 and length macd_short = macd_num_contracts[
      if length logSellBinance >= floor (macd_firstpt_amt * macd_num_contracts) [
        ;Binance macdtrader buys to the lowest seller
        set color green
        repeat floor (macd_firstpt_amt * macd_num_contracts)[
              set Binance_BTC/USD item 0 (item 0 logSellBinance)
              let agS item 1 (item 0 logSellBinance)
              if move_true [move macdtrader who binancian agS]
              set crypto crypto + 1 set cash cash - Binance_BTC/USD
              ask binancian agS [set crypto crypto - 1
                  set cash cash + Binance_BTC/USD check crypto ]

              set logSellBinance but-first logSellBinance
              set macd_short but-first macd_short
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    ]
    ;2ndt pt
    if macd_perc_short_avg >= macd_secondpt_sd * Binance-Volatility / 100 and length macd_short = (macd_num_contracts - (floor (macd_firstpt_amt * macd_num_contracts)))[
      if length logSellBinance >= floor (macd_secondpt_amt * macd_num_contracts) [
        ;Binance macdtrader buys to the lowest seller
        set color green
        repeat floor (macd_secondpt_amt * macd_num_contracts)[
              set Binance_BTC/USD item 0 (item 0 logSellBinance)
              let agS item 1 (item 0 logSellBinance)
              if move_true [move macdtrader who binancian agS]
              set crypto crypto + 1 set cash cash - Binance_BTC/USD
              ask binancian agS [set crypto crypto - 1
                  set cash cash + Binance_BTC/USD check crypto]

              set logSellBinance but-first logSellBinance
              set macd_short but-first macd_short
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    ]
    ;3rd pt buys left-overs
    if macd_perc_short_avg >= macd_thirdpt_sd * Binance-Volatility / 100 and length macd_short = (macd_num_contracts - (floor (macd_firstpt_amt * macd_num_contracts)) - (floor (macd_secondpt_amt * macd_num_contracts)))[
      if length logSellBinance >= length macd_short[
        ;Binance macdtrader buys to the lowest seller
        set color green
        repeat length macd_short[
              set Binance_BTC/USD item 0 (item 0 logSellBinance)
              let agS item 1 (item 0 logSellBinance)
              if move_true [move macdtrader who binancian agS]
              set crypto crypto + 1 set cash cash - Binance_BTC/USD
              ask binancian agS [set crypto crypto - 1
                  set cash cash + Binance_BTC/USD check crypto]


              set logSellBinance but-first logSellBinance
              set macd_short but-first macd_short
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    ]
   ;stop at break-even if any pt hit before
   if macd_perc_short_avg <= 0 and ((length macd_short) > 0) and ((length macd_short) < macd_num_contracts)[
      if length logSellBinance >= length macd_short [
        ;Binance macdtrader buys to the lowest seller
        set color green
        repeat length macd_short[
              set Binance_BTC/USD item 0 (item 0 logSellBinance)
              let agS item 1 (item 0 logSellBinance)
              if move_true [move macdtrader who binancian agS]
              set crypto crypto + 1 set cash cash - Binance_BTC/USD
              ask binancian agS [set crypto crypto - 1
                  set cash cash + Binance_BTC/USD check crypto]


              set logSellBinance but-first logSellBinance
              set macd_short but-first macd_short
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    ]
   ;stop
   if macd_perc_short_avg <= (-1) * macd_stop_sd * Binance-Volatility / 100[
      if length logSellBinance >= length macd_short [
        ;Binance macdtrader buys to the lowest seller
        set color green
        repeat length macd_short[
              set Binance_BTC/USD item 0 (item 0 logSellBinance)
              let agS item 1 (item 0 logSellBinance)
              if move_true [move macdtrader who binancian agS]
              set crypto crypto + 1 set cash cash - Binance_BTC/USD
              ask binancian agS [set crypto crypto - 1
                  set cash cash + Binance_BTC/USD check crypto]

              set logSellBinance but-first logSellBinance
              set macd_short but-first macd_short
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    ]
  ]
]






;---------------------------------------------------------------------------------SMA Trading--------------------------------------------------------------------------------------
ifelse length binance_tick_list >= sma_first_period [
  set sma1 mean (sublist (reverse binance_tick_list) 0 sma_first_period)
] [
  ; handle case where the tick_list is shorter than the SMA period
  set sma1 mean binance_tick_list
]

ifelse length binance_tick_list >= sma_second_period [
  set sma2 mean (sublist (reverse binance_tick_list) 0 sma_second_period)
] [
  ; handle case where the tick_list is shorter than the SMA period
  set sma2 mean binance_tick_list
]
graph3


;unrealized pnl
  ifelse not empty? sma_long[
    set sma_perc_long_avg 100 * (binance_tick_closing_price - mean(sma_long)) / mean(sma_long)
    set sma_long_pnl sum(map [x -> binance_tick_closing_price - x] sma_long)
  ][set sma_perc_long_avg 0 set sma_long_pnl 0]
ifelse not empty? sma_short[
    set sma_perc_short_avg 100 * (mean(sma_short) - binance_tick_closing_price) / binance_tick_closing_price
    set sma_short_pnl sum(map [x -> x - binance_tick_closing_price] sma_short)
  ][set sma_perc_short_avg 0 set sma_short_pnl 0]

;keep track of each trades' realized pnl
if empty? sma_long and empty? sma_short [
    if ((sum [cash] of smatraders - 1e6) - last sma_totalprofit) != 0[
      set sma_totalprofit lput (sum [cash] of smatraders - 1e6) sma_totalprofit]
  ]

;No slippage PnL tracking

;let tmp1 []
;ifelse not empty? sma_long[
;    set sma_perc_long_avg 100 * (Binance_BTC/USD - mean(sma_long)) / mean(sma_long)
;    let i 0
;    foreach sma_long [
;      set tmp1 lput ( (item 0 (item i logBuyBinance ) - item i sma_long)) tmp1
;      set i i + 1
;      ]
;    set sma_long_pnl sum(tmp1)
;  ][set sma_perc_long_avg 0 set sma_long_pnl 0]
;set tmp1 []
;ifelse not empty? sma_short[
;    set sma_perc_short_avg 100 * (mean(sma_short) - Binance_BTC/USD) / Binance_BTC/USD
;    let i 0
;    foreach sma_short [
;      set tmp1 lput ( item i sma_short - (item 0 (item i logSellBinance ))) tmp1
;      set i i + 1
;      ]
;    set sma_short_pnl sum(tmp1)
;  ][set sma_perc_short_avg 0 set sma_short_pnl 0]




;entries (stopped out if re-cross)
ask smatraders[
    ;Buy signal
    if sma1 > sma2 and sma_activelong = False[
      ;stop out short if re-cross
      if not empty? sma_short and (length logSellBinance >= length sma_short) [
        ;Binance smatrader buys the lowest ask
        set color green
        repeat length sma_short [
              set Binance_BTC/USD item 0 (item 0 logSellBinance)
              let agS item 1 (item 0 logSellBinance)
              if move_true [move smatrader who binancian agS]
              set crypto crypto + 1 set cash cash - Binance_BTC/USD
              ask binancian agS [set crypto crypto - 1
                  set cash cash + Binance_BTC/USD check crypto]

              set logSellBinance but-first logSellBinance
              set sma_short but-first sma_short
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
      if empty? sma_short [set sma_activeshort False]
      ;keep track of each trades' realized pnl
      if empty? sma_long and empty? sma_short [
          if ((sum [cash] of smatraders - 1e6) - last sma_totalprofit) != 0[
            set sma_totalprofit lput (sum [cash] of smatraders - 1e6) sma_totalprofit]
        ]

      ;long entry
      if length logSellBinance >= sma_num_contracts[
        ;Binance smatrader buys the lowest ask
        set color green
        repeat sma_num_contracts[
              set Binance_BTC/USD item 0 (item 0 logSellBinance)
              let agS item 1 (item 0 logSellBinance)
              if move_true [move smatrader who binancian agS]
              set crypto crypto + 1 set cash cash - Binance_BTC/USD
              ask binancian agS [set crypto crypto - 1
                  set cash cash + Binance_BTC/USD check crypto]

              set logSellBinance but-first logSellBinance
              set sma_long lput Binance_BTC/USD sma_long
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
       set sma_activelong True
      ]

    ]
    ;Short signal
    if sma1 < sma2 and sma_activeshort = False [
      ;if holding longs, cover them or stop them out
      if not empty? sma_long and length logBuyBinance >= length sma_long[
        ;Binance smatrader sells to the highest bidder
        set color red
        repeat length sma_long[
              set Binance_BTC/USD item 0 (item 0 logBuyBinance)
              let agB item 1 (item 0 logBuyBinance)
              if move_true [move smatrader who binancian agB]
              set crypto crypto - 1 set cash cash + Binance_BTC/USD
              ask binancian agB [set crypto crypto + 1
                  set cash cash - Binance_BTC/USD check crypto]

              set logBuyBinance but-first logBuyBinance
              set sma_long but-first sma_long
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
      if empty? sma_long [set sma_activelong False]
      ;keep track of each trades' realized pnl
      if empty? sma_long and empty? sma_short [
          if ((sum [cash] of smatraders - 1e6) - last sma_totalprofit) != 0[
            set sma_totalprofit lput (sum [cash] of smatraders - 1e6) sma_totalprofit]
        ]

      ;short entry
      if length logBuyBinance >= sma_num_contracts[
        ;Binance smatrader sells to the highest bidder
        set color red
        repeat sma_num_contracts[
              set Binance_BTC/USD item 0 (item 0 logBuyBinance)
              let agB item 1 (item 0 logBuyBinance)
              if move_true [move smatrader who binancian agB]
              set crypto crypto - 1 set cash cash + Binance_BTC/USD
              ask binancian agB [set crypto crypto + 1
                  set cash cash - Binance_BTC/USD check crypto]

              set logBuyBinance but-first logBuyBinance
              set sma_short lput Binance_BTC/USD sma_short
      ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
       set sma_activeshort True
      ]
    ]
]


;profit-takes & stops
ask smatraders[
    ;long
    ;1st pt
    if sma_activelong = True[
    if sma_perc_long_avg >= sma_firstpt_sd * Binance-Volatility / 100 and length sma_long = sma_num_contracts[
      if length logBuyBinance >= floor (sma_firstpt_amt * sma_num_contracts) [
        ;Binance smatrader sells to the highest bidder
        set color red
        repeat floor (sma_firstpt_amt * sma_num_contracts)[
              set Binance_BTC/USD item 0 (item 0 logBuyBinance)
              let agB item 1 (item 0 logBuyBinance)
              if move_true [move smatrader who binancian agB]
              set crypto crypto - 1 set cash cash + Binance_BTC/USD
              ask binancian agB [set crypto crypto + 1
                  set cash cash - Binance_BTC/USD check crypto]

              set logBuyBinance but-first logBuyBinance
              set sma_long but-first sma_long
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    ]
    ;2ndt pt
    if sma_perc_long_avg >= sma_secondpt_sd * Binance-Volatility / 100 and length sma_long = (sma_num_contracts - (floor (sma_firstpt_amt * sma_num_contracts)))[
      if length logBuyBinance >= floor (sma_secondpt_amt * sma_num_contracts) [
        ;Binance smatrader sells to the highest bidder
        set color red
        repeat floor (sma_secondpt_amt * sma_num_contracts)[
              set Binance_BTC/USD item 0 (item 0 logBuyBinance)
              let agB item 1 (item 0 logBuyBinance)
              if move_true [move smatrader who binancian agB]
              set crypto crypto - 1 set cash cash + Binance_BTC/USD
              ask binancian agB [set crypto crypto + 1
                  set cash cash - Binance_BTC/USD check crypto]

              set logBuyBinance but-first logBuyBinance
              set sma_long but-first sma_long
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    ]
    ;3rd pt sells left-overs
    if sma_perc_long_avg >= sma_thirdpt_sd * Binance-Volatility / 100 and length sma_long = (sma_num_contracts - (floor (sma_firstpt_amt * sma_num_contracts)) - (floor (sma_secondpt_amt * sma_num_contracts)))[
      if length logBuyBinance >= length sma_long [
        ;Binance smatrader sells to the highest bidder
        set color red
        repeat length sma_long[
              set Binance_BTC/USD item 0 (item 0 logBuyBinance)
              let agB item 1 (item 0 logBuyBinance)
              if move_true [move smatrader who binancian agB]
              set crypto crypto - 1 set cash cash + Binance_BTC/USD
              ask binancian agB [set crypto crypto + 1
                  set cash cash - Binance_BTC/USD check crypto]

              set logBuyBinance but-first logBuyBinance
              set sma_long but-first sma_long
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    ]
   ;stop at break-even if any pt hit before
   if sma_perc_long_avg <= 0.01 and ((length sma_long) > 0) and ((length sma_long) < sma_num_contracts)[
      if length logBuyBinance >= length sma_long [
        ;Binance smatrader sells to the highest bidder
        set color red
        repeat length sma_long[
              set Binance_BTC/USD item 0 (item 0 logBuyBinance)
              let agB item 1 (item 0 logBuyBinance)
              if move_true [move smatrader who binancian agB]
              set crypto crypto - 1 set cash cash + Binance_BTC/USD
              ask binancian agB [set crypto crypto + 1
                  set cash cash - Binance_BTC/USD check crypto]

              set logBuyBinance but-first logBuyBinance
              set sma_long but-first sma_long
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    ]
   ;stop
   if sma_perc_long_avg <= (-1) * sma_stop_sd * Binance-Volatility / 100[
      if length logBuyBinance >= length sma_long [
        ;Binance smatrader sells to the highest bidder
        set color red
        repeat length sma_long[
              set Binance_BTC/USD item 0 (item 0 logBuyBinance)
              let agB item 1 (item 0 logBuyBinance)
              if move_true [move smatrader who binancian agB]
              set crypto crypto - 1 set cash cash + Binance_BTC/USD
              ask binancian agB [set crypto crypto + 1
                  set cash cash - Binance_BTC/USD check crypto]

              set logBuyBinance but-first logBuyBinance
              set sma_long but-first sma_long
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    ]
  ]
    ;shorts
    ;1st pt
    if sma_activeshort = True[
    if sma_perc_short_avg >= sma_firstpt_sd * Binance-Volatility / 100 and length sma_short = sma_num_contracts[
      if length logSellBinance >= floor (sma_firstpt_amt * sma_num_contracts) [
        ;Binance smatrader buys to the lowest seller
        set color green
        repeat floor (sma_firstpt_amt * sma_num_contracts)[
              set Binance_BTC/USD item 0 (item 0 logSellBinance)
              let agS item 1 (item 0 logSellBinance)
              if move_true [move smatrader who binancian agS]
              set crypto crypto + 1 set cash cash - Binance_BTC/USD
              ask binancian agS [set crypto crypto - 1
                  set cash cash + Binance_BTC/USD check crypto]

              set logSellBinance but-first logSellBinance
              set sma_short but-first sma_short
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    ]
    ;2ndt pt
    if sma_perc_short_avg >= sma_secondpt_sd * Binance-Volatility / 100 and length sma_short = (sma_num_contracts - (floor (sma_firstpt_amt * sma_num_contracts)))[
      if length logSellBinance >= floor (sma_secondpt_amt * sma_num_contracts) [
        ;Binance smatrader buys to the lowest seller
        set color green
        repeat floor (sma_secondpt_amt * sma_num_contracts)[
              set Binance_BTC/USD item 0 (item 0 logSellBinance)
              let agS item 1 (item 0 logSellBinance)
              if move_true [move smatrader who binancian agS]
              set crypto crypto + 1 set cash cash - Binance_BTC/USD
              ask binancian agS [set crypto crypto - 1
                  set cash cash + Binance_BTC/USD check crypto]

              set logSellBinance but-first logSellBinance
              set sma_short but-first sma_short
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    ]
    ;3rd pt buys left-overs
    if sma_perc_short_avg >= sma_thirdpt_sd * Binance-Volatility / 100 and length sma_short = (sma_num_contracts - (floor (sma_firstpt_amt * sma_num_contracts)) - (floor (sma_secondpt_amt * sma_num_contracts)))[
      if length logSellBinance >= length sma_short[
        ;Binance smatrader buys to the lowest seller
        set color green
        repeat length sma_short[
              set Binance_BTC/USD item 0 (item 0 logSellBinance)
              let agS item 1 (item 0 logSellBinance)
              if move_true [move smatrader who binancian agS]
              set crypto crypto + 1 set cash cash - Binance_BTC/USD
              ask binancian agS [set crypto crypto - 1
                  set cash cash + Binance_BTC/USD check crypto]

              set logSellBinance but-first logSellBinance
              set sma_short but-first sma_short
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    ]
   ;stop at break-even if any pt hit before
   if sma_perc_short_avg <= 0 and ((length sma_short) > 0) and ((length sma_short) < sma_num_contracts)[
      if length logSellBinance >= length sma_short [
        ;Binance smatrader buys to the lowest seller
        set color green
        repeat length sma_short[
              set Binance_BTC/USD item 0 (item 0 logSellBinance)
              let agS item 1 (item 0 logSellBinance)
              if move_true [move smatrader who binancian agS]
              set crypto crypto + 1 set cash cash - Binance_BTC/USD
              ask binancian agS [set crypto crypto - 1
                  set cash cash + Binance_BTC/USD check crypto]

              set logSellBinance but-first logSellBinance
              set sma_short but-first sma_short
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    ]
   ;stop
   if sma_perc_short_avg <= (-1) * sma_stop_sd * Binance-Volatility / 100[
      if length logSellBinance >= length sma_short [
        ;Binance smatrader buys to the lowest seller
        set color green
        repeat length sma_short[
              set Binance_BTC/USD item 0 (item 0 logSellBinance)
              let agS item 1 (item 0 logSellBinance)
              if move_true [move smatrader who binancian agS]
              set crypto crypto + 1 set cash cash - Binance_BTC/USD
              ask binancian agS [set crypto crypto - 1
                  set cash cash + Binance_BTC/USD check crypto]

              set logSellBinance but-first logSellBinance
              set sma_short but-first sma_short
        ]
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    ]
  ]
]


;------------------------------------------------------------------------------FTX Live Trading Checks-------------------------------------------------------------------------
;Live Trading profits
ifelse not empty? FTX_live_buy_list[
    set FTX_live_perc_long_avg 100 * (FTX_tick_closing_price - mean(FTX_live_buy_list)) / mean(FTX_live_buy_list)
    set FTX_live_long_pnl sum(map [x -> FTX_tick_closing_price - x] FTX_live_buy_list)
  ][set FTX_live_perc_long_avg 0 set FTX_live_long_pnl 0]
ifelse not empty? FTX_live_sell_list[
    set FTX_live_perc_short_avg 100 * (mean(FTX_live_sell_list) - FTX_tick_closing_price) / FTX_tick_closing_price
    set FTX_live_short_pnl sum(map [x -> x - FTX_tick_closing_price] FTX_live_sell_list)
  ][set FTX_live_perc_short_avg 0 set FTX_live_short_pnl 0]
;


;----------------------------------------------------------------------------------BOOK FTX-------------------------------------------------------------------------------------------

;make sure ticks are ok
if (length ftx_logticks mod ftx_tick_count) = 0 [set ftx_logticks []]

set logBuyFTX []
set logSellFTX []

while [(length ftx_logticks < ftx_tick_count) or (length ftx_logticks mod ftx_tick_count != 0)][
    ask ftxians[
      if (length ftx_logticks < ftx_tick_count) or ((length ftx_logticks mod ftx_tick_count) != 0)[
        ;If net long, and certain profit/loss achieved, then sell 1 contract
        if crypto > 1e6 and (cash + (crypto - 1e6) * FTX_BTC/USD - 1e6 > FTX_profit or cash +  (crypto - 1e6) * FTX_BTC/USD - 1e6 < (-1) * FTX_loss )[
          if not empty? logBuyFTX[
            set color red
            set FTX_BTC/USD item 0 (item 0 logBuyFTX)
            set FTX_logticks lput FTX_BTC/USD FTX_logticks
            let agB item 1 (item 0 logBuyFTX)
            if move_true [move ftxian who ftxian agB]
            set crypto crypto - 1 set cash cash + FTX_BTC/USD check crypto
            ask ftxian agB [set crypto crypto + 1
              set cash cash - FTX_BTC/USD check crypto ]
            set logBuyFTX but-first logBuyFTX
          ]
         ]
        ;If net short, and certain profit/loss achieved, then buy 1 contract
        if crypto < 1e6 and (cash - (1e6 - crypto) * FTX_BTC/USD - 1e6 > FTX_profit or cash - (1e6 - crypto) * FTX_BTC/USD - 1e6 < (-1) * FTX_loss)[
          if not empty? logSellFTX[
            set color green
            set FTX_BTC/USD item 0 (item 0 logSellFTX)
            set FTX_logticks lput FTX_BTC/USD FTX_logticks
            let agS item 1 (item 0 logSellFTX)
            if move_true [move ftxian who ftxian agS]
            set crypto crypto + 1 set cash cash - FTX_BTC/USD check crypto
            ask ftxian agS [set crypto crypto - 1
               set cash cash + FTX_BTC/USD check crypto ]
            set logSellFTX but-first logSellFTX
          ]
        ]
        ;random entries
        ifelse random-float 1 < 0.5 [set buy  True set sell False][set sell True set buy  False]
        if buy           [set color green]
        if sell          [set color red]
        if buy [set price FTX_BTC/USD + random-normal 0 FTX-Volatility ]
        if sell[set price FTX_BTC/USD  + random-normal 0 FTX-Volatility]

        let tmp[]
        set tmp lput price tmp
        set tmp lput who tmp
        if buy [set logBuyFTX lput tmp logBuyFTX]
        set logBuyFTX reverse sort-by [ [?1 ?2] -> item 0 ?1 < item 0 ?2 ] logBuyFTX

        if (not empty? logBuyFTX and not empty? logSellFTX) and item 0 (item 0 logBuyFTX) >= item 0 (item 0 logSellFTX)
        [set FTX_BTC/USD item 0 (item 0 logSellFTX)
          set FTX_logticks lput FTX_BTC/USD FTX_logticks
          let agB item 1 (item 0 logBuyFTX)
          let agS item 1 (item 0 logSellFTX)

          if move_true [move (ftxian agB) (ftxian agS)]
          ask ftxian agB [set crypto crypto + 1
            set cash cash - FTX_BTC/USD
            if crypto > 1e6 [set shape "cow skull" set color green]
            if crypto < 1e6 [set shape "wolf 6" set color red]
            if crypto = 1e6 [set shape "person" set color white]]
          ask ftxian agS [set crypto crypto - 1
            set cash cash + FTX_BTC/USD
            if crypto > 1e6 [set shape "cow skull" set color green]
            if crypto < 1e6 [set shape "wolf 6" set color red]
            if crypto = 1e6 [set shape "person" set color white]]

          set logBuyFTX but-first logBuyFTX
          set logSellFTX but-first logSellFTX
        ]

        if sell [set logSellFTX lput tmp logSellFTX]
        set logSellFTX sort-by [ [?1 ?2] -> item 0 ?1 < item 0 ?2 ] logSellFTX

        if (not empty? logBuyFTX and not empty? logSellFTX) and item 0 (item 0 logBuyFTX) >= item 0 (item 0 logSellFTX)
        [set FTX_BTC/USD item 0 (item 0 logBuyFTX)
          set FTX_logticks lput FTX_BTC/USD FTX_logticks
          let agB item 1 (item 0 logBuyFTX)
          let agS item 1 (item 0 logSellFTX)

          if move_true [move (ftxian agB) (ftxian agS)]
          ask ftxian agB [set crypto crypto + 1
            set cash cash - FTX_BTC/USD
            if crypto > 1e6 [set shape "cow skull" set color green]
            if crypto < 1e6 [set shape "wolf 6" set color red]
            if crypto = 1e6 [set shape "person" set color white]]
          ask ftxian agS [set crypto crypto - 1
            set cash cash + FTX_BTC/USD
            if crypto > 1e6 [set shape "cow skull" set color green]
            if crypto < 1e6 [set shape "wolf 6" set color red]
            if crypto = 1e6 [set shape "person" set color white]]

          set logBuyFTX but-first logBuyFTX
          set logSellFTX but-first logSellFTX
        ]
      ]
      set buy False set sell False
    ]
]



set FTX_tick_closing_price last FTX_logticks
graph2
set FTX_tick_list lput FTX_tick_closing_price FTX_tick_list

;---------------------------------------------------------------------------------FTX Bollinger Bands--------------------------------------------------------------------------------------
ifelse length FTX_tick_list >= FTX_bb_sma_period [
  set FTX_bb_sma mean (sublist (reverse FTX_tick_list) 0 FTX_bb_sma_period)
  let FTX_bb_band_sd standard-deviation (sublist (reverse FTX_tick_list) 0 FTX_bb_sma_period)
  set FTX_bb_band_upper (FTX_bb_sma +  (FTX_bb_band_sd * FTX_bb_band_sd_set))
  set FTX_bb_band_lower (FTX_bb_sma -  (FTX_bb_band_sd * FTX_bb_band_sd_set))
] [
  ; handle case where the tick_list is shorter than the SMA period
  set FTX_bb_sma mean FTX_tick_list
  ifelse length FTX_tick_list = 1 [set FTX_bb_band_upper (FTX_bb_sma + 3 * FTX-Volatility) set FTX_bb_band_lower (FTX_bb_sma - 3 * FTX-Volatility)]
  [let FTX_bb_band_sd standard-deviation FTX_tick_list
  set FTX_bb_band_upper FTX_bb_sma +  FTX_bb_band_sd * FTX_bb_band_sd_set
  set FTX_bb_band_lower FTX_bb_sma -  FTX_bb_band_sd * FTX_bb_band_sd_set
    ]
]
graph6
;---------------------------------------------------------------------------------Arbitrage----------------------------------------------------------------------------------------

ask binance_arbitrageurs[
    ;Binance equilibrium lower than FTX's
    if (not empty? logBuyBinance and not empty? logSellBinance and not empty? logBuyFTX and not empty? logSellFTX)[
      if (item 0 (item 0 logBuyBinance) < item 0 (item 0 logBuyFTX)) and (item 0 (item 0 logSellBinance) < item 0 (item 0 logSellFTX)) [
        ;Binance arbitrageur buys the lowest ask
        set color green
        set Binance_BTC/USD item 0 (item 0 logSellBinance)
        let agS item 1 (item 0 logSellBinance)
        if move_true [move binance_arbitrageur who binancian agS]
        set crypto crypto + 1 set cash cash - Binance_BTC/USD
        ask binancian agS [set crypto crypto - 1
          set cash cash + Binance_BTC/USD check crypto]

        set logSellBinance but-first logSellBinance
        ;add to ticks
        set binance_logticks lput Binance_BTC/USD binance_logticks
        if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]

        ;Binance arbitrageur now becomes the seller to the highest ftxian bidder
        set color red
        set FTX_BTC/USD item 0 (item 0 logBuyFTX)
        let agB item 1 (item 0 logBuyFTX)
        if move_true [move binance_arbitrageur who ftxian agB]
        set crypto crypto - 1 set cash cash + FTX_BTC/USD set color random 140
        ask ftxian agB [set crypto crypto + 1
          set cash cash - FTX_BTC/USD check crypto]

        set logBuyFTX but-first logBuyFTX
        ;add to ftx ticks
        set FTX_logticks lput FTX_BTC/USD FTX_logticks
        if (length FTX_logticks mod FTX_tick_count) = 0[set FTX_tick_closing_price last FTX_logticks set FTX_tick_list lput FTX_tick_closing_price FTX_tick_list]
      ]
    ]
]

ask FTX_arbitrageurs[
    ;Binance equilibrium higher than FTX's
    if (not empty? logBuyBinance and not empty? logSellBinance and not empty? logBuyFTX and not empty? logSellFTX)[
      if (item 0 (item 0 logBuyFTX) < item 0 (item 0 logBuyBinance)) and (item 0 (item 0 logSellFTX) < item 0 (item 0 logSellBinance)) [
        ;FTX arbitrageur buys the lowest ask
        set color green
        set FTX_BTC/USD item 0 (item 0 logSellFTX)
        let agS item 1 (item 0 logSellFTX)
        if move_true [move FTX_arbitrageur who ftxian agS]
        set crypto crypto + 1 set cash cash - FTX_BTC/USD
        ask ftxian agS [set crypto crypto - 1
          set cash cash + FTX_BTC/USD check crypto]

        set logSellFTX but-first logSellFTX
        ;add to ftx ticks
        set FTX_logticks lput FTX_BTC/USD FTX_logticks
        if (length FTX_logticks mod FTX_tick_count) = 0[set FTX_tick_closing_price last FTX_logticks set FTX_tick_list lput FTX_tick_closing_price FTX_tick_list]

        ;FTX arbitrageur now becomes the seller to the highest binancian bidder
        set color red
        set binance_BTC/USD item 0 (item 0 logBuyBinance)
        let agB item 1 (item 0 logBuyBinance)
        if move_true [move FTX_arbitrageur who binancian agB]
        set crypto crypto - 1 set cash cash + binance_BTC/USD set color random 140
        ask binancian agB [set crypto crypto + 1
          set cash cash - binance_BTC/USD check crypto]

        set logBuyBinance but-first logBuyBinance
        ;add to binance ticks
        set binance_logticks lput Binance_BTC/USD binance_logticks
        if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    ]
]


graph7


tick
;end the 'to go'
end



;---------------------------------------------------------------------------------Binance Live Trading--------------------------------------------------------------------------------------
to binance_live_buy
  ask binancelivetraders[
    ;Buy
    if length logSellBinance >= 1 [
      set color green
      set Binance_BTC/USD item 0 (item 0 logSellBinance)
      let agS item 1 (item 0 logSellBinance)
      if move_true [move binancelivetrader who binancian agS]
      set crypto crypto + 1 set cash cash - Binance_BTC/USD
      ask binancian agS [set crypto crypto - 1
          set cash cash + Binance_BTC/USD set color white]


      set logSellBinance but-first logSellBinance
      if empty? binance_live_sell_list[set binance_live_buy_list lput Binance_BTC/USD binance_live_buy_list]
      if not empty? binance_live_sell_list[set binance_live_sell_list but-first binance_live_sell_list]
      ;add to ticks
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
    ]
    if not empty? binance_live_buy_list [set color green set shape "cow skull"]
    if not empty? binance_live_sell_list [set color red set shape "wolf 6"]
    if empty? binance_live_buy_list and empty? binance_live_sell_list [set color white set shape "person"]
  ]
end

to binance_live_sell
  ask binancelivetraders[
    ;Sell
    if length logBuyBinance >= 1[
      set color red
      set Binance_BTC/USD item 0 (item 0 logBuyBinance)
      let agB item 1 (item 0 logBuyBinance)
      if move_true [move binancelivetrader who binancian agB]
      set crypto crypto - 1 set cash cash + Binance_BTC/USD
      ask binancian agB [set crypto crypto + 1
                  set cash cash - Binance_BTC/USD set color white]

      set logBuyBinance but-first logBuyBinance
      if empty? binance_live_buy_list[set binance_live_sell_list lput Binance_BTC/USD binance_live_sell_list]
      if not empty? binance_live_buy_list[set binance_live_buy_list but-first binance_live_buy_list]
       ;add to tick
       set binance_logticks lput Binance_BTC/USD binance_logticks
       if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
      ]
    if not empty? binance_live_buy_list [set color green set shape "cow skull"]
    if not empty? binance_live_sell_list [set color red set shape "wolf 6"]
    if empty? binance_live_buy_list and empty? binance_live_sell_list [set color white set shape "person"]
  ]

end
to binance_live_close
  ask binancelivetraders[
          ;close long
          if not empty? binance_live_buy_list and length logBuyBinance >= length binance_live_buy_list [
            repeat length binance_live_buy_list[
                  set color red
                  set Binance_BTC/USD item 0 (item 0 logBuyBinance)
                  let agB item 1 (item 0 logBuyBinance)
                  if move_true [move binancelivetrader who binancian agB]
                  set crypto crypto - 1 set cash cash + Binance_BTC/USD
                  ask binancian agB [set crypto crypto + 1
                     set cash cash - Binance_BTC/USD set color white]

                  set logBuyBinance but-first logBuyBinance
                  set binance_live_buy_list but-first binance_live_buy_list
            ]
           ;add to tick
           set binance_logticks lput Binance_BTC/USD binance_logticks
           if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
          ]
          ;close short
          if not empty? binance_live_sell_list and length logSellBinance >= length binance_live_sell_list [
            repeat length binance_live_sell_list[
                  set color green
                  set Binance_BTC/USD item 0 (item 0 logSellBinance)
                  let agS item 1 (item 0 logSellBinance)
                  if move_true [move binancelivetrader who binancian agS]
                  set crypto crypto + 1 set cash cash - Binance_BTC/USD
                  ask binancian agS [set crypto crypto - 1
                     set cash cash + Binance_BTC/USD set color white]

                  set logSellBinance but-first logSellBinance
                  set binance_live_sell_list but-first binance_live_sell_list
              ]
            ;add to tick
            set binance_logticks lput Binance_BTC/USD binance_logticks
            if (length binance_logticks mod binance_tick_count) = 0[set binance_tick_closing_price last binance_logticks set binance_tick_list lput binance_tick_closing_price binance_tick_list]
            ]
    if not empty? binance_live_buy_list [set color green set shape "cow skull"]
    if not empty? binance_live_sell_list [set color red set shape "wolf 6"]
    if empty? binance_live_buy_list and empty? binance_live_sell_list [set color white set shape "person"]
    ]

end




;    ;Reverse
;    if binance_live_reverse[
;      ;reverse long
;      if not empty? binance_live_buy_list[
;            ;close long
;            set templong length binance_live_buy_list
;            repeat templong[
;                    set color red
;                    set Binance_BTC/USD item 0 (item 0 logBuyBinance)
;                    set crypto crypto - 1 set cash cash + Binance_BTC/USD
;                    let agB item 1 (item 0 logBuyBinance)
;                    ask binancian agB [set crypto crypto + 1
;                        set cash cash - Binance_BTC/USD]
;
;                    let buyer binancian agB
;                    ;move the smartader etc
;
;                    set logBuyBinance but-first logBuyBinance
;                    set binance_live_buy_list but-first binance_live_buy_list
;             ;open short
;             repeat templong[
;                    set color red
;                    set Binance_BTC/USD item 0 (item 0 logBuyBinance)
;                    set crypto crypto - 1 set cash cash + Binance_BTC/USD
;                    let agB item 1 (item 0 logBuyBinance)
;                    ask binancian agB [set crypto crypto + 1
;                        set cash cash - Binance_BTC/USD]
;
;                    let buyer binancian agB
;                    ;move the smartader etc
;
;                    set logBuyBinance but-first logBuyBinance
;                    set binance_live_sell_list lput Binance_BTC/USD binance_live_sell_list


;---------------------------------------------------------------------------------FTX Live Trading--------------------------------------------------------------------------------------
to ftx_live_buy
  ask ftxlivetraders[
    ;Buy
    if length logSellFTX >= 1 [
      set color green
      set FTX_BTC/USD item 0 (item 0 logSellFTX)
      let agS item 1 (item 0 logSellFTX)
      if move_true [move ftxlivetrader who ftxian agS]
      set crypto crypto + 1 set cash cash - FTX_BTC/USD
      ask ftxian agS [set crypto crypto - 1
          set cash cash + FTX_BTC/USD set color white]

      set logSellFTX but-first logSellFTX
      if empty? FTX_live_sell_list[set FTX_live_buy_list lput FTX_BTC/USD FTX_live_buy_list]
      if not empty? FTX_live_sell_list[set FTX_live_sell_list but-first FTX_live_sell_list]
      ;add to ticks
       set FTX_logticks lput FTX_BTC/USD FTX_logticks
       if (length FTX_logticks mod FTX_tick_count) = 0[set FTX_tick_closing_price last FTX_logticks set FTX_tick_list lput FTX_tick_closing_price FTX_tick_list]
    ]
    if not empty? FTX_live_buy_list [set color green set shape "cow skull"]
    if not empty? FTX_live_sell_list [set color red set shape "wolf 6"]
    if empty? FTX_live_buy_list and empty? FTX_live_sell_list [set color white set shape "person"]
  ]
end

to ftx_live_sell
  ask ftxlivetraders[
    ;Sell
    if length logBuyFTX >= 1[
      set color red
      set FTX_BTC/USD item 0 (item 0 logBuyFTX)
      let agB item 1 (item 0 logBuyFTX)
      if move_true [move ftxlivetrader who ftxian agB]
      set crypto crypto - 1 set cash cash + FTX_BTC/USD
      ask ftxian agB [set crypto crypto + 1
                  set cash cash - FTX_BTC/USD set color white]

      set logBuyFTX but-first logBuyFTX
      if empty? FTX_live_buy_list[set FTX_live_sell_list lput FTX_BTC/USD FTX_live_sell_list]
      if not empty? FTX_live_buy_list[set FTX_live_buy_list but-first FTX_live_buy_list]
       ;add to tick
       set FTX_logticks lput FTX_BTC/USD FTX_logticks
       if (length FTX_logticks mod FTX_tick_count) = 0[set FTX_tick_closing_price last FTX_logticks set FTX_tick_list lput FTX_tick_closing_price FTX_tick_list]
      ]
    if not empty? FTX_live_buy_list [set color green set shape "cow skull"]
    if not empty? FTX_live_sell_list [set color red set shape "wolf 6"]
    if empty? FTX_live_buy_list and empty? FTX_live_sell_list [set color white set shape "person"]
  ]

end
to ftx_live_close
  ask ftxlivetraders[
          ;close long
          if not empty? FTX_live_buy_list and length logBuyFTX >= length FTX_live_buy_list [
            repeat length FTX_live_buy_list[
                  set color red
                  set FTX_BTC/USD item 0 (item 0 logBuyFTX)
                  set crypto crypto - 1 set cash cash + FTX_BTC/USD
                  let agB item 1 (item 0 logBuyFTX)
                  if move_true [move ftxlivetrader who ftxian agB]
                  ask ftxian agB [set crypto crypto + 1
                     set cash cash - FTX_BTC/USD set color white]

                  set logBuyFTX but-first logBuyFTX
                  set FTX_live_buy_list but-first FTX_live_buy_list
            ]
           ;add to tick
           set FTX_logticks lput FTX_BTC/USD FTX_logticks
           if (length FTX_logticks mod FTX_tick_count) = 0[set FTX_tick_closing_price last FTX_logticks set FTX_tick_list lput FTX_tick_closing_price FTX_tick_list]
          ]
          ;close short
          if not empty? FTX_live_sell_list and length logSellFTX >= length FTX_live_sell_list [
            repeat length FTX_live_sell_list[
                  set color green
                  set FTX_BTC/USD item 0 (item 0 logSellFTX)
                  set crypto crypto + 1 set cash cash - FTX_BTC/USD
                  let agS item 1 (item 0 logSellFTX)
                  if move_true [move ftxlivetrader who ftxian agS]
                  ask ftxian agS [set crypto crypto - 1
                     set cash cash + FTX_BTC/USD set color white]

                  set logSellFTX but-first logSellFTX
                  set FTX_live_sell_list but-first FTX_live_sell_list
              ]
            ;add to tick
            set FTX_logticks lput FTX_BTC/USD FTX_logticks
            if (length FTX_logticks mod FTX_tick_count) = 0[set FTX_tick_closing_price last FTX_logticks set FTX_tick_list lput FTX_tick_closing_price FTX_tick_list]
            ]
    if not empty? FTX_live_buy_list [set color green set shape "cow skull"]
    if not empty? FTX_live_sell_list [set color red set shape "wolf 6"]
    if empty? FTX_live_buy_list and empty? FTX_live_sell_list [set color white set shape "person"]
    ]

end

to graph1
  set-current-plot "binance_tick_closing_price"
  plot binance_tick_closing_price
end

to graph2
  set-current-plot "FTX_tick_closing_price"
  plot FTX_tick_closing_price
end

to graph3
  set-current-plot "Moving Averages"
  set-current-plot-pen "sma1"
  plot sma1
  set-current-plot-pen "sma2"
  plot sma2
end

to graph4
  set-current-plot "Bollinger Bands"
  set-current-plot-pen "binance_tick_closing_price"
  plot binance_tick_closing_price
  set-current-plot-pen "binance_bb_sma"
  plot binance_bb_sma
  set-current-plot-pen "binance_bb_band_upper"
  plot binance_bb_band_upper
  set-current-plot-pen "binance_bb_band_lower"
  plot binance_bb_band_lower
end


to graph5
  set-current-plot "MACD"
  set-current-plot-pen "MACD"
  plot last macd_list
  set-current-plot-pen "signal"
  plot ema_func signal_period macd_list
  set-current-plot-pen "Equilibrium"
  plot 0
end

to graph6
  set-current-plot "Bollinger Bands FTX"
  set-current-plot-pen "FTX_tick_closing_price"
  plot FTX_tick_closing_price
  set-current-plot-pen "FTX_bb_sma"
  plot FTX_bb_sma
  set-current-plot-pen "FTX_bb_band_upper"
  plot FTX_bb_band_upper
  set-current-plot-pen "FTX_bb_band_lower"
  plot FTX_bb_band_lower
end

to graph7
  set-current-plot "Arbitrage Spread"
  set-current-plot-pen "Difference"
  plot (Binance_BTC/USD - FTX_BTC/USD)
  set-current-plot-pen "Equilibrium"
  plot 0
end


to graph8
  set-current-plot "Binancians' Profit"
  set-current-plot-pen "Profit binancian 0"
  plot [profit] of binancian 0
  set-current-plot-pen "Profit binancian 1"
  plot [profit] of binancian 1
  set-current-plot-pen "Profit binancian 2"
  plot [profit] of binancian 2
  set-current-plot-pen "Profit binancian 3"
  plot [profit] of binancian 3
  set-current-plot-pen "Profit binancian 4"
  plot [profit] of binancian 4
  set-current-plot-pen "Break Even"
  plot 0
end

;to graph9
;  set-current-plot "Disciplined Trader's Profit"
;  set-current-plot-pen "Profit Disciplined Trader"
;  plot [profit] of one-of solodistraders
;  set-current-plot-pen "Break Even"
;  plot 0
;end




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@#$#@#$#@
GRAPHICS-WINDOW
915
225
1332
643
-1
-1
12.4
1
10
1
1
1
0
1
1
1
0
32
0
32
0
0
1
ticks
30.0

BUTTON
922
110
1026
173
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
102
118
292
151
nbinancians
nbinancians
20
1000
1000.0
1
1
NIL
HORIZONTAL

BUTTON
1222
112
1326
175
NIL
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

PLOT
241
278
573
520
binance_tick_closing_price
NIL
NIL
0.0
10.0
59950.0
60050.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" ""

SLIDER
1551
134
1723
167
nftxians
nftxians
20
1000
1000.0
1
1
NIL
HORIZONTAL

PLOT
1646
290
1998
539
FTX_tick_closing_price
NIL
NIL
0.0
10.0
59900.0
60100.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" ""

MONITOR
38
379
116
424
BTC/USD
Binance_BTC/USD
2
1
11

MONITOR
1465
386
1535
431
BTC/USD
FTX_BTC/USD
2
1
11

MONITOR
39
433
113
478
Highest Bid
item 0 ( item 0 logBuyBinance )
2
1
11

MONITOR
39
328
113
373
Lowest Ask
item 0 (item 0 logSellBinance)
2
1
11

MONITOR
1465
439
1533
484
Highest Bid
item 0 (item 0 logBuyFTX)
2
1
11

MONITOR
1465
333
1535
378
Lowest Ask
item 0 (item 0 logSellFTX)
2
1
11

SLIDER
355
118
527
151
Binance-Volatility
Binance-Volatility
1
50
10.0
0.01
1
NIL
HORIZONTAL

SLIDER
1774
134
1946
167
FTX-Volatility
FTX-Volatility
1
50
10.0
0.01
1
NIL
HORIZONTAL

SLIDER
279
239
452
272
binance_tick_count
binance_tick_count
20
10000
133.0
1
1
NIL
HORIZONTAL

MONITOR
136
382
202
427
Last Close
binance_tick_closing_price
2
1
11

MONITOR
459
231
517
276
Trades
(length binance_logticks) mod binance_tick_count
17
1
11

SLIDER
1655
1209
1827
1242
sma_first_period
sma_first_period
1
1000
50.0
1
1
NIL
HORIZONTAL

SLIDER
1659
1252
1831
1285
sma_second_period
sma_second_period
1
1000
200.0
1
1
NIL
HORIZONTAL

PLOT
1379
1204
1642
1401
Moving Averages
NIL
NIL
0.0
10.0
59500.0
60100.0
true
false
"" ""
PENS
"sma1" 1.0 0 -8330359 true "" ""
"sma2" 1.0 0 -10146808 true "" ""

SLIDER
777
714
951
747
nbinance_arbitrageurs
nbinance_arbitrageurs
0
1000
100.0
1
1
NIL
HORIZONTAL

MONITOR
1007
951
1240
996
NIL
Binance_BTC/USD - FTX_BTC/USD
2
1
11

MONITOR
1119
1327
1177
1372
%
sma_short_pnl
3
1
11

MONITOR
790
1324
885
1369
Unrealized PnL
sma_long_pnl
2
1
11

MONITOR
1374
1415
1548
1460
Balance (with unrealized PnL)
sum [cash] of smatraders +\nifelse-value not empty? sma_long[\nlength sma_long * binance_tick_closing_price][\n(-1) * length sma_short * binance_tick_closing_price]
17
1
11

MONITOR
949
1405
1013
1450
Total PnL
sum [cash] of smatraders - 1e6 +\nifelse-value not empty? sma_long[\nlength sma_long * binance_tick_closing_price][\n(-1) * length sma_short * binance_tick_closing_price]
17
1
11

SLIDER
1660
1363
1832
1396
sma_num_contracts
sma_num_contracts
1
5
5.0
1
1
NIL
HORIZONTAL

MONITOR
1009
1325
1106
1370
Unrealized PnL
sma_perc_short_avg
2
1
11

MONITOR
897
1325
947
1370
%
sma_perc_long_avg
3
1
11

SLIDER
99
1239
271
1272
sma_firstpt_sd
sma_firstpt_sd
0.1
100
2.0
0.1
1
NIL
HORIZONTAL

SLIDER
99
1285
271
1318
sma_secondpt_sd
sma_secondpt_sd
0.1
100
3.0
0.1
1
NIL
HORIZONTAL

SLIDER
99
1335
271
1368
sma_thirdpt_sd
sma_thirdpt_sd
0.1
100
5.0
0.1
1
NIL
HORIZONTAL

SLIDER
375
1235
547
1268
sma_firstpt_amt
sma_firstpt_amt
0
1
0.44
0.01
1
NIL
HORIZONTAL

SLIDER
375
1285
547
1318
sma_secondpt_amt
sma_secondpt_amt
0
1
0.41
0.01
1
NIL
HORIZONTAL

SLIDER
99
1410
271
1443
sma_stop_sd
sma_stop_sd
0
100
1.2
1
1
NIL
HORIZONTAL

MONITOR
804
1265
944
1310
Contracts Outstanding
length sma_long
17
1
11

MONITOR
570
1230
638
1275
Contracts
floor (sma_firstpt_amt * sma_num_contracts)
17
1
11

MONITOR
572
1286
640
1331
Contracts
floor (sma_secondpt_amt * sma_num_contracts)
17
1
11

MONITOR
572
1345
640
1390
Contracts
sma_num_contracts - (floor (sma_firstpt_amt * sma_num_contracts)) - (floor (sma_secondpt_amt * sma_num_contracts))
17
1
11

MONITOR
1005
1265
1145
1310
Contracts Outstanding
length sma_short
17
1
11

BUTTON
302
536
358
573
Buy
binance_live_buy
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
445
536
503
575
Sell
binance_live_sell
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
225
530
292
575
Contracts
length binance_live_buy_list
17
1
11

MONITOR
522
532
588
577
Contracts
length binance_live_sell_list
17
1
11

MONITOR
519
590
611
635
Unrealized PnL
binance_live_short_pnl
2
1
11

BUTTON
369
593
439
628
Flatten
binance_live_close
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
369
536
433
581
Total PnL
sum [cash] of binancelivetraders - 1e6 + \nifelse-value not empty? binance_live_buy_list[\nlength binance_live_buy_list * binance_tick_closing_price]\n[(-1) *  length binance_live_sell_list * binance_tick_closing_price]
2
1
11

MONITOR
283
1232
343
1277
% Move
sma_firstpt_sd * Binance-Volatility / 100
4
1
11

MONITOR
1565
1414
1644
1459
Total Trades
length sma_totalprofit - 1
17
1
11

SLIDER
589
432
779
465
binance_bb_sma_period
binance_bb_sma_period
2
100
20.0
1
1
NIL
HORIZONTAL

SLIDER
589
473
781
506
binance_bb_band_sd_set
binance_bb_band_sd_set
0
5
2.0
0.1
1
NIL
HORIZONTAL

PLOT
583
279
782
427
Bollinger Bands
NIL
NIL
0.0
10.0
59900.0
60100.0
true
false
"" ""
PENS
"binance_bb_band_upper" 1.0 0 -2674135 true "" ""
"binance_bb_band_lower" 1.0 0 -10899396 true "" ""
"binance_bb_sma" 1.0 0 -13345367 true "" ""
"binance_tick_closing_price" 1.0 0 -16777216 true "" ""

SLIDER
1852
1724
2024
1757
macd_first_period
macd_first_period
1
10000
1200.0
1
1
NIL
HORIZONTAL

SLIDER
1852
1764
2024
1797
macd_second_period
macd_second_period
1
10000
2600.0
1
1
NIL
HORIZONTAL

SLIDER
1670
1724
1842
1757
signal_period
signal_period
1
10000
900.0
1
1
NIL
HORIZONTAL

SLIDER
1672
1898
1844
1931
macd_num_contracts
macd_num_contracts
1
5
5.0
1
1
NIL
HORIZONTAL

PLOT
1390
1727
1662
1933
MACD
NIL
NIL
0.0
10.0
-1.0
1.0
true
false
"" ""
PENS
"MACD" 1.0 0 -1184463 true "" ""
"signal" 1.0 0 -13791810 true "" ""
"Equilibrium" 1.0 0 -16777216 true "" ""

MONITOR
974
1935
1056
1980
Total PnL
sum [cash] of macdtraders - 1e6 +\nifelse-value not empty? macd_long[\nlength macd_long * binance_tick_closing_price][\n(-1) * length macd_short * binance_tick_closing_price]
17
1
11

MONITOR
1397
1950
1565
1995
Balance (with Unrealized PnL)
sum [cash] of macdtraders +\nifelse-value not empty? macd_long[\nlength macd_long * binance_tick_closing_price][\n(-1) * length macd_short * binance_tick_closing_price]
17
1
11

MONITOR
894
1832
962
1877
%
macd_perc_long_avg
4
1
11

MONITOR
1169
1832
1227
1877
%
macd_perc_short_avg
4
1
11

MONITOR
1055
1832
1150
1877
Unrealized PnL
macd_short_pnl
2
1
11

SLIDER
100
1757
272
1790
macd_firstpt_sd
macd_firstpt_sd
0.1
100
2.0
0.1
1
NIL
HORIZONTAL

SLIDER
102
1809
274
1842
macd_secondpt_sd
macd_secondpt_sd
0.1
100
3.0
0.1
1
NIL
HORIZONTAL

SLIDER
103
1858
275
1891
macd_thirdpt_sd
macd_thirdpt_sd
0.1
100
5.0
0.1
1
NIL
HORIZONTAL

SLIDER
104
1930
276
1963
macd_stop_sd
macd_stop_sd
0.1
100
1.2
1
1
NIL
HORIZONTAL

MONITOR
294
1752
356
1797
% Move
macd_firstpt_sd * Binance-Volatility / 100
4
1
11

SLIDER
400
1754
562
1787
macd_firstpt_amt
macd_firstpt_amt
0
1
0.41
.01
1
NIL
HORIZONTAL

SLIDER
402
1806
562
1839
macd_secondpt_amt
macd_secondpt_amt
0
1
0.4
0.01
1
NIL
HORIZONTAL

MONITOR
590
1752
658
1797
Contracts
floor (macd_firstpt_amt * macd_num_contracts)
17
1
11

MONITOR
589
1807
657
1852
Contracts
floor (macd_secondpt_amt * macd_num_contracts)
17
1
11

MONITOR
590
1862
658
1907
Contracts
macd_num_contracts - (floor (macd_firstpt_amt * macd_num_contracts)) - (floor (macd_secondpt_amt * macd_num_contracts))
17
1
11

MONITOR
1590
1950
1673
1995
Total Trades
length macd_totalprofit - 1
17
1
11

MONITOR
815
1777
955
1822
Contracts Outstanding
length macd_long
17
1
11

MONITOR
1060
1775
1200
1820
Contracts Outstanding
length macd_short
17
1
11

MONITOR
199
588
294
633
Unrealized PnL
binance_live_long_pnl
2
1
11

SLIDER
1281
714
1454
747
nftx_arbitrageurs
nftx_arbitrageurs
0
1000
100.0
1
1
NIL
HORIZONTAL

SLIDER
1682
251
1855
284
FTX_tick_count
FTX_tick_count
20
10000
133.0
1
1
NIL
HORIZONTAL

SLIDER
2032
453
2205
486
FTX_bb_sma_period
FTX_bb_sma_period
2
100
20.0
1
1
NIL
HORIZONTAL

SLIDER
2033
498
2206
531
FTX_bb_band_sd_set
FTX_bb_band_sd_set
0
10
2.0
0.1
1
NIL
HORIZONTAL

BUTTON
1718
566
1778
603
Buy
FTX_live_buy
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1883
566
1939
600
Sell
FTX_live_sell
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1802
626
1869
660
Flatten
FTX_live_close
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
1956
620
2054
665
Unrealized PnL
FTX_live_short_pnl
2
1
11

MONITOR
1638
563
1706
608
Contracts
length FTX_live_buy_list
17
1
11

MONITOR
1801
563
1866
608
Total PnL
sum [cash] of ftxlivetraders - 1e6 + \nifelse-value not empty? ftx_live_buy_list[\nlength ftx_live_buy_list * ftx_tick_closing_price]\n[(-1) *  length ftx_live_sell_list * ftx_tick_closing_price]
2
1
11

MONITOR
1955
563
2023
608
Contracts
length FTX_live_sell_list
17
1
11

MONITOR
1859
248
1917
293
Trades
(length FTX_logticks) mod FTX_tick_count
17
1
11

PLOT
974
711
1262
946
Arbitrage Spread
NIL
NIL
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"Difference" 1.0 0 -10899396 true "" ""
"Equilibrium" 1.0 0 -16777216 true "" ""

MONITOR
1548
388
1620
433
Last Close
FTX_tick_closing_price
2
1
11

TEXTBOX
295
15
583
123
BINANCE
50
0.0
1

TEXTBOX
1787
34
1985
133
FTX
50
0.0
1

SWITCH
1070
133
1186
166
move_true
move_true
1
1
-1000

PLOT
2018
296
2218
446
Bollinger Bands FTX
NIL
NIL
0.0
10.0
59900.0
60100.0
true
false
"" ""
PENS
"FTX_tick_closing_price" 1.0 0 -16777216 true "" ""
"FTX_bb_band_upper" 1.0 0 -5298144 true "" ""
"FTX_bb_band_lower" 1.0 0 -12087248 true "" ""
"FTX_bb_sma" 1.0 0 -14070903 true "" ""

TEXTBOX
1081
667
1190
696
Arbitrage
20
0.0
1

TEXTBOX
304
1195
388
1218
3 Profit Targets
11
0.0
1

MONITOR
283
1285
343
1330
% Move
sma_secondpt_sd * Binance-Volatility / 100
4
1
11

MONITOR
283
1342
343
1387
% Move
sma_thirdpt_sd * Binance-Volatility / 100
4
1
11

TEXTBOX
49
1244
68
1273
1st
11
0.0
1

TEXTBOX
45
1294
72
1317
2nd
11
0.0
1

TEXTBOX
45
1344
74
1367
3rd
11
0.0
1

TEXTBOX
45
1415
82
1438
Stop
11
0.0
1

MONITOR
283
1409
343
1454
% Move
sma_stop_sd * Binance-Volatility / 100
4
1
11

TEXTBOX
964
1199
1001
1218
PnL
11
0.0
1

TEXTBOX
855
1244
899
1263
Long
11
0.0
1

TEXTBOX
1064
1245
1111
1264
Short
11
0.0
1

TEXTBOX
44
1767
72
1793
1st
11
0.0
1

TEXTBOX
304
1702
399
1728
3 Profit Targets
11
0.0
1

TEXTBOX
44
1814
73
1840
2nd
11
0.0
1

TEXTBOX
44
1860
72
1886
3rd
11
0.0
1

TEXTBOX
45
1935
76
1961
Stop
11
0.0
1

MONITOR
295
1805
356
1850
% Move
macd_secondpt_sd * Binance-Volatility / 100
4
1
11

MONITOR
297
1860
358
1905
% Move
macd_thirdpt_sd * Binance-Volatility / 100
4
1
11

MONITOR
297
1929
358
1974
% Move
macd_stop_sd * Binance-Volatility / 100
4
1
11

TEXTBOX
984
1710
1016
1736
PnL
11
0.0
1

TEXTBOX
855
1747
890
1773
Long
11
0.0
1

TEXTBOX
1094
1745
1139
1771
Short
11
0.0
1

MONITOR
789
1834
884
1879
Unrealized PnL
macd_long_pnl
2
1
11

TEXTBOX
769
1130
1456
1154
---------------------------Moving Average Trading---------------------------------
20
0.0
1

TEXTBOX
794
1635
1436
1663
---------------------------MACD Trading---------------------------------
20
0.0
1

SLIDER
590
119
762
152
binance_profit
binance_profit
0
1000
30.0
1
1
NIL
HORIZONTAL

SLIDER
592
168
764
201
binance_loss
binance_loss
0
100
16.0
1
1
NIL
HORIZONTAL

PLOT
2345
1184
2951
1547
Binancians' Profit
NIL
NIL
0.0
10.0
0.0
10.0
true
true
"" ""
PENS
"Profit binancian 0" 1.0 0 -14070903 true "" ""
"Profit binancian 1" 1.0 0 -1184463 true "" ""
"Break Even" 1.0 0 -16777216 true "" ""
"Profit binancian 2" 1.0 0 -3844592 true "" ""
"Profit binancian 3" 1.0 0 -5298144 true "" ""
"Profit binancian 4" 1.0 0 -10022847 true "" ""

SLIDER
2001
137
2174
170
FTX_profit
FTX_profit
0
1000
30.0
1
1
NIL
HORIZONTAL

SLIDER
2001
184
2174
217
FTX_loss
FTX_loss
0
1000
16.0
1
1
NIL
HORIZONTAL

MONITOR
1618
620
1708
665
Unrealized PnL
FTX_live_long_pnl
2
1
11

TEXTBOX
2490
1150
3010
1169
---------------PnL Tracking of 5 Binance Traders--------------
11
0.0
1

@#$#@#$#@
## WHAT IS IT?

The program simulates the Bitcoin market on two exchanges: Binance and FTX, enabling pure arbitrage opportunities to be exploited between them. The program additionally simulates traders utilizing two popular momentum strategies: Smooth-Moving-Average (SMA) and Moving-Average-Convergence-Divergence (MACD). With the program, users can analyze the distribution of the arbitrage spread between the two exchanges, along with the Profit and Loss (PnL) distributions of various trader types.

The design of each exchange interface draws inspiration from a basic trading terminal, allowing users to engage in live BTC trading. Additionally, Bollinger Bands, a simple technical analysis tool, has been included.


## HOW IT WORKS

Agents are representative of the traders in the market and they place orders to buy or sell BTC. Orders are placed in the order book - where a trade occurs if the highest bid exceeds (or meets) the lowest ask. This mechanic occurs in both exchanges, where pure arbitrage occurs if the lowest bid and highest ask of one of the exchanges is lower than the lowest bid and highest ask of the other. 

Orders are placed on the order books at a price = last traded price + N(0, Volatility) from the traders, where the volatility is user inputted. Here volatility may be interpreted as the spread of prices buyers/sellers believe the asset should be priced at (relative to the last traded price). Users may allow for traders in the market to be risk-managed/disciplined may setting profit and loss limits - where a single contract is liquidated if said limits are triggered.

Additionally, the price charts are tick charts - where a candle is printed based off of the count of trades (ticks) that have occured (not to be confused with a 'tick' in Netlogo terminology), rather than time charts where a candle is printed after a completion of a certain time period (probably the most popular chart type). The user may input what tick charts to use (popular default tick charts in real trading terminals include 133, 512 and 1600 ticks).

If any trader is net long their character turns to a green bull, if net short, a red bear. If flat, the trader's character turns to a person: green if they have a buy order on the order book, red if a sell order, white if neither (characters temporarily turn green if in the act of buying or red if selling). Arbitrageurs are multicolored to signify that they are never net long or short, but rather instantaneously buy and sell to generate a profit. The move_true switch allows for the user to visualize which traders interact.

We detail the trading mechanics of the two momentum-based strategies:
SMA
A buy entry is triggered when the short-term moving average (user inputted) crosses above the long-term moving average (user inputted) - known as a 'golden cross'. A sell entry is triggered for the opposing cross of the moving averages - call a 'death cross'.

MACD
A similar mechanic to the above is used, yet involving a MACD line (calculated as the difference between the two user inputted exponential moving averages) and an exponential moving average of the MACD line called the signal line (user inputted). A buy signal is only triggered when the cross occurs below the 0 line (the opposite for a sell trigger).

Additionally, with regard to the momentum traders, the number of contracts to trade is user inputted, including the 3 profit-targets and stop-losses (and number of contracts to liquidate at each profit-target). Furthermore, the stop-loss is moved to the entry price after the 1st profit target is triggered (so to guarantee the trader at least breaks-even for a 'winning' trade).


## HOW TO MEASURE

To measure the arbitrage spread, we report Binance_BTC/USD - FTX_BTC/USD at every tick. Additionally, for the PnL distributions of the momentum traders: report 'last sma_totalprofit' for the SMA trader and report 'last macd_totalprofit' for the MACD trader. The PnL distirbutions of the risk-managed trader may be studied by reporting: '[profit] of binancian 0' (although any binancian could be used). Multiple repetitions should be used to mimic different 'times' in the market.
 

## HOW TO USE IT

Exchanges
There are sliders available to adjust the number of traders on each exchange, including sliders to modify the degree to which traders are risk-managed using the profit and loss sliders. The type of tick chart to be used can also be changed (for example, selecting the 133 tick chart would require 133 trades to occur before a candle is printed). Bollinger Bands settings can also be adjusted, both for the moving average and the standard deviation (the band) to be used. Live trading of BTC is possible with the 'Buy' and 'Sell' buttons (note: the 'Flatten' button may not always close your trade effectively due to lack of liquidity in the market; therefore, users are encouraged to liquidate their contracts individually). BTC/USD is initially set at $60000, where each trader is given ample 'cash' and 'crypto' such that they never run out.

Arbitrage
Sliders allow for varying the number of arbitrageurs on both exchanges. The absence of arbitrageurs in the market would result in the two exchanges acting as independent markets.

Momentum-Based Trading
Sliders are provided for adjusting the profit-taking and stop-loss percentages, as well as the quantity of contracts liquidated at each profit-take (ensure these add up to the total number of contracts traded). The number of contracts to trade can also be adjusted (it's advisable to trade with a lower number of contracts, as there may be instances where orders go unfilled due to insufficient liquidity in the market). Additionally, sliders are available to adjust which moving-averages to utilize.


## THINGS TO NOTICE

From the Netlogo interface, we can visualize the arbitrage spread (the plot in-between the two exchanges) where the price convergence may be seen if there are enough arbitrageurs in both exchanges (fluctuation around equilibrium). We can also visualize this price convergence by noting the similarities between the two price charts on both exchanges. A thing to notice, if there are no arbitrageurs in one of the exchanges but there are in the other, is the arbitrage spread 'bounce' off of the equilibrium line.  

If one were to closely monitor the 'moving average' and 'MACD' plots (at bottom), one would be able to see when a buy or sell is triggered from the corresponding crosses of the moving averages (allow some time for enough data to be generated to allow for the calculation of the moving averages in the plots).

We also include PnL tracking of 5 traders (randomly picked) on Binance - just as an indication that some traders would turn a profit and others would not (bottom right plot).


## THINGS TO TRY

When exploring momentum-based trading, endeavor to develop a profitable strategy by adjusting the profit-taking and stop-loss percentages, as well as the quantity of contracts liquidated at each profit-take. Additionally, consider altering the selection of moving-averages used. Ensure to report the relevant variables as outlined in the 'How-to-Measure' section to analyze your strategy's PnL distribution accurately.
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cow skull
false
0
Polygon -7500403 true true 150 90 75 105 60 150 75 210 105 285 195 285 225 210 240 150 225 105
Polygon -16777216 true false 150 150 90 195 90 150
Polygon -16777216 true false 150 150 210 195 210 150
Polygon -16777216 true false 105 285 135 270 150 285 165 270 195 285
Polygon -7500403 true true 240 150 263 143 278 126 287 102 287 79 280 53 273 38 261 25 246 15 227 8 241 26 253 46 258 68 257 96 246 116 229 126
Polygon -7500403 true true 60 150 37 143 22 126 13 102 13 79 20 53 27 38 39 25 54 15 73 8 59 26 47 46 42 68 43 96 54 116 71 126

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

wolf 6
false
0
Polygon -7500403 true true 105 75 105 45 45 0 30 45 45 60 60 90
Polygon -7500403 true true 45 165 30 135 45 120 15 105 60 75 105 60 180 60 240 75 285 105 255 120 270 135 255 165 270 180 255 195 255 210 240 195 195 225 210 255 180 300 120 300 90 255 105 225 60 195 45 210 45 195 30 180
Polygon -16777216 true false 120 300 135 285 120 270 120 255 180 255 180 270 165 285 180 300
Polygon -7500403 true true 195 75 195 45 255 0 270 45 255 60 240 90
Polygon -16777216 true false 225 75 210 60 210 45 255 15 255 45 225 60
Polygon -16777216 true false 75 75 90 60 90 45 45 15 45 45 75 60
Circle -16777216 true false 88 118 32
Circle -16777216 true false 178 118 32

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.4.0
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="experiment 512 50200" repetitions="10" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <exitCondition>(length sma_totalprofit) - 1 = 100</exitCondition>
    <metric>last sma_totalprofit</metric>
  </experiment>
  <experiment name="experiment  momentum" repetitions="200" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <exitCondition>ticks = 10000</exitCondition>
    <metric>last sma_totalprofit</metric>
    <metric>last macd_totalprofit</metric>
    <steppedValueSet variable="vol" first="10" step="10" last="50"/>
    <enumeratedValueSet variable="profitset">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="loss">
      <value value="10"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="experiment 50, 200 100" repetitions="10" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <exitCondition>length sma_totalprofit - 1 = 100</exitCondition>
    <metric>last sma_totalprofit</metric>
  </experiment>
  <experiment name="133" repetitions="10" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <exitCondition>length sma_totalprofit - 1 = 100</exitCondition>
    <metric>last sma_totalprofit</metric>
  </experiment>
  <experiment name="arbitrage 1, 1_10" repetitions="1" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <exitCondition>ticks = 10000</exitCondition>
    <metric>Binance_BTC/USD - FTX_BTC/USD</metric>
    <enumeratedValueSet variable="FTX-Volatility">
      <value value="1"/>
      <value value="5"/>
      <value value="10"/>
      <value value="20"/>
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Binance-Volatility">
      <value value="1"/>
      <value value="5"/>
      <value value="10"/>
      <value value="20"/>
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="nbinancians">
      <value value="1000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="nbinance_arbitrageurs">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="nftxians">
      <value value="1000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="nftx_arbitrageurs">
      <value value="1"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="arbitrage 5" repetitions="1" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <exitCondition>ticks = 10000</exitCondition>
    <metric>Binance_BTC/USD - FTX_BTC/USD</metric>
    <enumeratedValueSet variable="FTX-Volatility">
      <value value="1"/>
      <value value="5"/>
      <value value="10"/>
      <value value="20"/>
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Binance-Volatility">
      <value value="1"/>
      <value value="5"/>
      <value value="10"/>
      <value value="20"/>
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="nbinancians">
      <value value="1000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="nbinance_arbitrageurs">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="nftxians">
      <value value="1000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="nftx_arbitrageurs">
      <value value="5"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="arbitrage 1600t" repetitions="1" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <exitCondition>ticks = 10000</exitCondition>
    <metric>Binance_BTC/USD - FTX_BTC/USD</metric>
    <steppedValueSet variable="vol" first="1" step="1" last="100"/>
    <enumeratedValueSet variable="nbinancians">
      <value value="1000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="nbinance_arbitrageurs">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="nftxians">
      <value value="1000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="nftx_arbitrageurs">
      <value value="100"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="arbitrage 2" repetitions="1" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <exitCondition>ticks = 10000</exitCondition>
    <metric>Binance_BTC/USD - FTX_BTC/USD</metric>
    <enumeratedValueSet variable="FTX-Volatility">
      <value value="1"/>
      <value value="5"/>
      <value value="10"/>
      <value value="20"/>
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Binance-Volatility">
      <value value="1"/>
      <value value="5"/>
      <value value="10"/>
      <value value="20"/>
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="nbinancians">
      <value value="1000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="nbinance_arbitrageurs">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="nftxians">
      <value value="1000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="nftx_arbitrageurs">
      <value value="2"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="arbitrage 1000 ticks 20" repetitions="1" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <exitCondition>ticks = 10000</exitCondition>
    <metric>Binance_BTC/USD - FTX_BTC/USD</metric>
    <enumeratedValueSet variable="FTX-Volatility">
      <value value="1"/>
      <value value="5"/>
      <value value="10"/>
      <value value="20"/>
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Binance-Volatility">
      <value value="1"/>
      <value value="5"/>
      <value value="10"/>
      <value value="20"/>
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="nbinancians">
      <value value="10000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="nbinance_arbitrageurs">
      <value value="1000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="nftxians">
      <value value="10000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="nftx_arbitrageurs">
      <value value="1000"/>
    </enumeratedValueSet>
  </experiment>
</experiments>
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@

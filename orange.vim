"Originally based on Jellybeans theme.
" Modified to resemble the orclord colorscheme.

" Color palette
let s:gui00 = "#151515"
let s:gui01 = "#262626"
let s:gui02 = "#4f5b66"
let s:gui03 = "#65737e"
let s:gui04 = "#a7adba"
let s:gui05 = "#c0c5ce"
let s:gui06 = "#cdd3de"
let s:gui07 = "#d8dee9"
let s:gui08 = "#870000"
let s:gui09 = "#f99157"
let s:gui0A = "#fac863"
let s:gui0B = "#437019"
let s:gui0C = "#5fb3b3"
let s:gui0D = "#0d61ac"
let s:gui0E = "#c594c5"
let s:gui0F = "#ab7967"

let s:cterm00 = "234"
let s:cterm01 = "235"
let s:cterm02 = "239"
let s:cterm03 = "59"
let s:cterm04 = "145"
let s:cterm05 = "152"
let s:cterm06 = "188"
let s:cterm07 = "15"
let s:cterm08 = "88"
let s:cterm09 = "209"
let s:cterm0A = "221"
let s:cterm0B = "28"
let s:cterm0C = "73"
let s:cterm0D = "04"
let s:cterm0E = "176"
let s:cterm0F = "137"

let s:guiWhite = "#ffffff"
let s:guiGray = "#666666"
let s:ctermBlack = "00"
let s:ctermRed = "01"
let s:ctermGreen = "02"
let s:ctermPurple = "05"
let s:ctermGrey = "08"
let s:ctermIron = "242"
let s:ctermBrightRed = "09"
let s:ctermWhite = "15"
let s:ctermBlood = "88"
let s:ctermCongealing = "52"
let s:ctermOrange = "166"
let s:ctermBrown = "94"
let s:ctermAsh = "234"
let s:ctermPoison = "58"
let s:ctermBruise = "53"
let s:ctermWinter = "30"
let s:ctermBrightYellow = "223"
let s:ctermDarkRed = "088"

let g:airline#themes#orange#palette = {}
let s:modified = { 'airline_c': [ '#ffb964', '', 05, 233, '' ] }

" Normal mode
let s:N1 = [ s:guiWhite , s:gui0B , s:ctermOrange , s:ctermAsh  ]
let s:N2 = [ s:gui02 , s:gui01 , s:ctermBrightYellow , s:ctermOrange  ]
let s:N3 = [ s:guiWhite , s:gui01 , s:ctermOrange , s:ctermBlack  ]
let g:airline#themes#orange#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#orange#palette.normal_modified = s:modified

" Insert mode
let s:I1 = [ s:guiWhite , s:gui0E , s:ctermWhite , s:ctermBlood  ]
let s:I2 = [ s:gui02 , s:gui01 , s:ctermDarkRed, s:ctermOrange  ]
let s:I3 = [ s:guiWhite , s:gui00 , s:ctermWhite , s:cterm00  ]
let g:airline#themes#orange#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#orange#palette.insert_modified = s:modified

" Visual mode
let s:V1 = [ s:guiWhite , s:gui08 , s:ctermAsh , s:ctermOrange ]
let s:V2 = [ s:gui02 , s:gui01 , s:cterm0D , s:ctermAsh  ]
let s:V3 = [ s:guiWhite , s:gui01 , s:cterm0D , s:ctermBlack  ]
let g:airline#themes#orange#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#orange#palette.visual_modified = s:modified

" Replace mode
let s:R1 = [ s:gui08 , s:gui01 , s:ctermBlood, s:ctermBlack ]
let s:R2 = [ s:gui02 , s:gui01 , s:ctermRed , s:ctermBlack  ]
let s:R3 = [ s:guiWhite , s:gui01 , s:ctermIron , s:ctermBlack  ]
let g:airline#themes#orange#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

" Inactive mode
let s:IN1 = [ s:gui00 , s:gui01 , s:ctermOrange , s:cterm01 ]
let s:IN2 = [ s:gui02 , s:gui00 , s:cterm02 , s:cterm00 ]
let s:IN3 = [ s:gui02 , s:gui00 , s:cterm02 , s:cterm00 ]
let g:airline#themes#orange#palette.inactive = airline#themes#generate_color_map(s:IN1, s:IN2, s:IN3)

" CtrlP
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif

let s:CP1 = [ s:guiWhite , s:gui01 , s:ctermWhite , s:cterm01  ]
let s:CP2 = [ s:guiWhite , s:gui03 , s:ctermWhite , s:cterm01  ]
let s:CP3 = [ s:guiWhite , s:gui0D , s:ctermWhite , s:cterm0D  ]

let g:airline#themes#orange#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(s:CP1, s:CP2, s:CP3)

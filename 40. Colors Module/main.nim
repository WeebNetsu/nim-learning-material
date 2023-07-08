import std/colors

# This module allows you to do color handling in Nim
#[ 
    list of available colors

    colAliceBlue = 15792383
    colAntiqueWhite = 16444375
    colAqua = 65535
    colAquamarine = 8388564
    colAzure = 15794175
    colBeige = 16119260
    colBisque = 16770244
    colBlack = 0
    colBlanchedAlmond = 16772045
    colBlue = 255
    colBlueViolet = 9055202
    colBrown = 10824234
    colBurlyWood = 14596231
    colCadetBlue = 6266528
    colChartreuse = 8388352
    colChocolate = 13789470
    colCoral = 16744272
    colCornflowerBlue = 6591981
    colCornsilk = 16775388
    colCrimson = 14423100
    colCyan = 65535
    colDarkBlue = 139
    colDarkCyan = 35723
    colDarkGoldenRod = 12092939
    colDarkGray = 11119017
    colDarkGreen = 25600
    colDarkKhaki = 12433259
    colDarkMagenta = 9109643
    colDarkOliveGreen = 5597999
    colDarkorange = 16747520
    colDarkOrchid = 10040012
    colDarkRed = 9109504
    colDarkSalmon = 15308410
    colDarkSeaGreen = 9419919
    colDarkSlateBlue = 4734347
    colDarkSlateGray = 3100495
    colDarkTurquoise = 52945
    colDarkViolet = 9699539
    colDeepPink = 16716947
    colDeepSkyBlue = 49151
    colDimGray = 6908265
    colDodgerBlue = 2003199
    colFireBrick = 11674146
    colFloralWhite = 16775920
    colForestGreen = 2263842
    colFuchsia = 16711935
    colGainsboro = 14474460
    colGhostWhite = 16316671
    colGold = 16766720
    colGoldenRod = 14329120
    colGray = 8421504
    colGreen = 32768
    colGreenYellow = 11403055
    colHoneyDew = 15794160
    colHotPink = 16738740
    colIndianRed = 13458524
    colIndigo = 4915330
    colIvory = 16777200
    colKhaki = 15787660
    colLavender = 15132410
    colLavenderBlush = 16773365
    colLawnGreen = 8190976
    colLemonChiffon = 16775885
    colLightBlue = 11393254
    colLightCoral = 15761536
    colLightCyan = 14745599
    colLightGoldenRodYellow = 16448210
    colLightGreen = 9498256
    colLightGrey = 13882323
    colLightPink = 16758465
    colLightSalmon = 16752762
    colLightSeaGreen = 2142890
    colLightSkyBlue = 8900346
    colLightSlateGray = 7833753
    colLightSteelBlue = 11584734
    colLightYellow = 16777184
    colLime = 65280
    colLimeGreen = 3329330
    colLinen = 16445670
    colMagenta = 16711935
    colMaroon = 8388608
    colMediumAquaMarine = 6737322
    colMediumBlue = 205
    colMediumOrchid = 12211667
    colMediumPurple = 9662680
    colMediumSeaGreen = 3978097
    colMediumSlateBlue = 8087790
    colMediumSpringGreen = 64154
    colMediumTurquoise = 4772300
    colMediumVioletRed = 13047173
    colMidnightBlue = 1644912
    colMintCream = 16121850
    colMistyRose = 16770273
    colMoccasin = 16770229
    colNavajoWhite = 16768685
    colNavy = 128
    colOldLace = 16643558
    colOlive = 8421376
    colOliveDrab = 7048739
    colOrange = 16753920
    colOrangeRed = 16729344
    colOrchid = 14315734
    colPaleGoldenRod = 15657130
    colPaleGreen = 10025880
    colPaleTurquoise = 11529966
    colPaleVioletRed = 14184595
    colPapayaWhip = 16773077
    colPeachPuff = 16767673
    colPeru = 13468991
    colPink = 16761035
    colPlum = 14524637
    colPowderBlue = 11591910
    colPurple = 8388736
    colRed = 16711680
    colRosyBrown = 12357519
    colRoyalBlue = 4286945
    colSaddleBrown = 9127187
    colSalmon = 16416882
    colSandyBrown = 16032864
    colSeaGreen = 3050327
    colSeaShell = 16774638
    colSienna = 10506797
    colSilver = 12632256
    colSkyBlue = 8900331
    colSlateBlue = 6970061
    colSlateGray = 7372944
    colSnow = 16775930
    colSpringGreen = 65407
    colSteelBlue = 4620980
    colTan = 13808780
    colTeal = 32896
    colThistle = 14204888
    colTomato = 16737095
    colTurquoise = 4251856
    colViolet = 15631086
    colWheat = 16113331
    colWhite = 16777215
    colWhiteSmoke = 16119285
    colYellow = 16776960
    colYellowGreen = 10145074
 ]#

# this will give you 0xA52A2A
echo colBrown

# $ converts color from Color type into string
echo $colBrown

# you can add/subtract colors from each other, this is
# useful, since the colors won't be able to overflow
# 255 or 0 (largest value in color range for rgb)
echo colBrown + colFuchsia

# can compare colors
echo colFuchsia == Color(0xFF00FF)

# give you RBG version of color
echo extractRGB(colGoldenRod)

# change color intensity
echo intensity(colGoldenRod, 0.2)

# return true if it is a vaid color name or valid hexadecimal color
echo isColor("silver")
echo isColor("#F3AB00")
echo isColor("#colora")

# return a valid Color type to use
echo parseColor("silver")
echo parseColor("#F3AB00")

# allows us to input RGB, will give us hex of Color type
echo rgb(255, 166, 132)
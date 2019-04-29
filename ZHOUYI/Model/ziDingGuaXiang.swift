//
//  ziDingGuaXiang.swift
//  ZHOUYI
//
//  Created by 陈沛 on 2019/4/28.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import Foundation

/*
enum ShangXiaGuaResult:String{
    
//    typealias RawValue = <#type#>
    case qianWeiTian = "000000"
    case tianFengHou = "000001"
    case tianShanDun = "000011"
    case tianDiPi = "000111"
    case fengDiGuan = "001111"
    case diShanBo = "011111"
    case huoDiJin = "010111"
    case huoTianDaYou = "010000"
    case kunWeiDi = "111111"
    case diLeiFu = "111110"
    case diZeLin = "111100"
    case diTianTai = "111000"
    case leiTianDaZhuang = "110000"
    case zeTianYang = "100000"
    case shuiTianXu = "101000"
    case shuiDiBi = "101111"
    case zhenWeiLei = "110110"
    case leiDiYu = "110111"
    case leiShuiJie = "110101"
    case leiFengHeng = "110001"
    case diFengSheng = "111001"
    case shuiFengSheng = "101001"
    case zeFengDaGuo = "100001"
    case zeLeiSui = "100110"
    case jiWeiFeng = "001001"
    case fengTianXiaoChu = "001000"
    case fengHuoJiaRen = "001010"
    case fengLeiYi = "00000"  //有错
    case tianLeiWuWang = "000110"
    case huoLeiShiKe = "010110"
    case shanLeiYi = "011110"
    case shanFengGu = "011001"
    case kanWeiShui = "101101"
    case shuiZeJie = "101100"
    case shuiLeiTun = "101110"
    case shuiHuoJiJi = "101010"
    case zeHuoGe = "100010"
    case leiHuoFeng = "110010"
    case diHuoMingYi = "111010"
    case diHuoShi = "111101"
    case liWeiHuo = "010010"
    case huoShanLv = "010011"
    case huoFengDing = "010001"
    case huoShuiWeiJi = "010101"
    case shanShuiMeng = "011101"
    case fengShuiHuan = "001101"
    case tianShuiSong = "000101"
    case tianHuoTongRen = "000010"
}
*/

struct ShangXiaGuaResult {
    let GuaFor64:[String:String] = [
        "qianWeiTian" : "000000",
        "tianFengHou" : "000001",
        "tianShanDun" : "000011",
        "tianDiPi" : "000111",
        "fengDiGuan" : "001111",
        "diShanBo" : "011111",
        "huoDiJin" : "010111",
        "huoTianDaYou" : "010000",
        "kunWeiDi" : "111111",
        "diLeiFu" : "111110",
        "diZeLin" : "111100",
        "diTianTai" : "111000",
        "leiTianDaZhuang" :"110000",
        "zeTianYang" : "100000",
        "shuiTianXu" : "101000",
        "shuiDiBi" : "101111",
        "zhenWeiLei" : "110110",
        "leiDiYu" : "110111",
        "leiShuiJie" : "110101",
        "leiFengHeng" : "110001",
        "diFengSheng" : "111001",
        "shuiFengSheng" : "101001",
        "zeFengDaGuo" : "100001",
        "zeLeiSui" : "100110",
        "jiWeiFeng" : "001001",
        "fengTianXiaoChu" : "001000",
        "fengHuoJiaRen" : "001010",
        "fengLeiYi" : "001110",
        "tianLeiWuWang" : "000110",
        "huoLeiShiKe" : "010110",
        "shanLeiYi" : "011110",
        "shanFengGu" : "011001",
        "kanWeiShui" : "101101",
        "shuiZeJie" : "101100",
        "shuiLeiTun" : "101110",
        "shuiHuoJiJi" : "101010",
        "zeHuoGe" : "100010",
        "leiHuoFeng" : "110010",
        "diHuoMingYi" : "111010",
        "diHuoShi" : "111101",
        "liWeiHuo" : "010010",
        "huoShanLv" : "010011",
        "huoFengDing" : "010001",
        "huoShuiWeiJi" : "010101",
        "shanShuiMeng" : "011101",
        "fengShuiHuan" : "001101",
        "tianShuiSong" : "000101",
        "tianHuoTongRen" : "000010",
        "genWeiShan" : "011011",
        "shanHuoFen" : "011010",
        "shanHuoDaChu" : "011000",
        "shanZeSun" : "011100",
        "huoZeKui" : "010100",
        "tianZeLv" : "000100",
        "fengZeZhongFu" : "001100",
        "fengShanJian" : "001011",
        "duiWeiZe" : "100100",
        "zeShuiKun" : "100101",
        "zeDiCui" : "100111",
        "zeShanXian" : "100011",
        "shanShuiJian" : "101011",
        "diShanQian" : "111011",
        "leiShanXiaoGuo" : "110011",
        "leiZeGuiMei" : "110100"
    ]
}

//
//  ContentView.swift
//  Digits
//
//  Created by Nathan Kawamoto on 3/9/23.
//

import SwiftUI
import CoreML
import UIKit
import CoreML

struct Line {
    var points = [CGPoint]()
    var color: Color = .white
    var lineWidth: Double = 10
}

extension UIImage {
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {

        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        image.draw(in: CGRectMake(0, 0, newWidth, newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()

        return newImage
    }

}

struct ContentView: View {
    @State var currentLine = Line()
    @State private var lines: [Line] = []
    @State var testImage = UIImage()
    @State var flat: [Double] = [Double]()
    @State var guess: String = ""
    @State var second: String = ""
    
    var canvasView: some View{
        return Canvas { context, size in
            for line in lines{
                var path = Path()
                path.addLines(line.points)
                context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
            }
        }.gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged({value in
                let newPoint = value.location
                currentLine.points.append(newPoint)
                self.lines.append(currentLine)
            }).onEnded({value in
                self.currentLine = Line(points: [])
            })).frame(width: 200, height: 200).background(.black)
    }
    
    
    var body: some View {
        ZStack {
            AngularGradient(gradient: Gradient(colors: [.black, .purple, .black]), center: .center).ignoresSafeArea()
            VStack(spacing: 50){
                Spacer()
                canvasView.frame(width:200, height: 200).border(.white)
                Button{
                    let renderer = ImageRenderer(content: canvasView)
                    if let image = renderer.cgImage{
                        testImage = resizeImage(image: UIImage(cgImage: image), newWidth: 28.0)
                        flat = getPixelIntensities(image: testImage)
                    }
                    do{
                        let config = MLModelConfiguration()
                        let model = try DigitsClassifier(configuration: config)
                        let prediction = try model.prediction(pixel0: flat[0], pixel1: flat[1], pixel2: flat[2], pixel3: flat[3], pixel4: flat[4], pixel5: flat[5], pixel6: flat[6], pixel7: flat[7], pixel8: flat[8], pixel9: flat[9], pixel10: flat[10], pixel11: flat[11], pixel12: flat[12], pixel13: flat[13], pixel14: flat[14], pixel15: flat[15], pixel16: flat[16], pixel17: flat[17], pixel18: flat[18], pixel19: flat[19], pixel20: flat[20], pixel21: flat[21], pixel22: flat[22], pixel23: flat[23], pixel24: flat[24], pixel25: flat[25], pixel26: flat[26], pixel27: flat[27], pixel28: flat[28], pixel29: flat[29], pixel30: flat[30], pixel31: flat[31], pixel32: flat[32], pixel33: flat[33], pixel34: flat[34], pixel35: flat[35], pixel36: flat[36], pixel37: flat[37], pixel38: flat[38], pixel39: flat[39], pixel40: flat[40], pixel41: flat[41], pixel42: flat[42], pixel43: flat[43], pixel44: flat[44], pixel45: flat[45], pixel46: flat[46], pixel47: flat[47], pixel48: flat[48], pixel49: flat[49], pixel50: flat[50], pixel51: flat[51], pixel52: flat[52], pixel53: flat[53], pixel54: flat[54], pixel55: flat[55], pixel56: flat[56], pixel57: flat[57], pixel58: flat[58], pixel59: flat[59], pixel60: flat[60], pixel61: flat[61], pixel62: flat[62], pixel63: flat[63], pixel64: flat[64], pixel65: flat[65], pixel66: flat[66], pixel67: flat[67], pixel68: flat[68], pixel69: flat[69], pixel70: flat[70], pixel71: flat[71], pixel72: flat[72], pixel73: flat[73], pixel74: flat[74], pixel75: flat[75], pixel76: flat[76], pixel77: flat[77], pixel78: flat[78], pixel79: flat[79], pixel80: flat[80], pixel81: flat[81], pixel82: flat[82], pixel83: flat[83], pixel84: flat[84], pixel85: flat[85], pixel86: flat[86], pixel87: flat[87], pixel88: flat[88], pixel89: flat[89], pixel90: flat[90], pixel91: flat[91], pixel92: flat[92], pixel93: flat[93], pixel94: flat[94], pixel95: flat[95], pixel96: flat[96], pixel97: flat[97], pixel98: flat[98], pixel99: flat[99], pixel100: flat[100], pixel101: flat[101], pixel102: flat[102], pixel103: flat[103], pixel104: flat[104], pixel105: flat[105], pixel106: flat[106], pixel107: flat[107], pixel108: flat[108], pixel109: flat[109], pixel110: flat[110], pixel111: flat[111], pixel112: flat[112], pixel113: flat[113], pixel114: flat[114], pixel115: flat[115], pixel116: flat[116], pixel117: flat[117], pixel118: flat[118], pixel119: flat[119], pixel120: flat[120], pixel121: flat[121], pixel122: flat[122], pixel123: flat[123], pixel124: flat[124], pixel125: flat[125], pixel126: flat[126], pixel127: flat[127], pixel128: flat[128], pixel129: flat[129], pixel130: flat[130], pixel131: flat[131], pixel132: flat[132], pixel133: flat[133], pixel134: flat[134], pixel135: flat[135], pixel136: flat[136], pixel137: flat[137], pixel138: flat[138], pixel139: flat[139], pixel140: flat[140], pixel141: flat[141], pixel142: flat[142], pixel143: flat[143], pixel144: flat[144], pixel145: flat[145], pixel146: flat[146], pixel147: flat[147], pixel148: flat[148], pixel149: flat[149], pixel150: flat[150], pixel151: flat[151], pixel152: flat[152], pixel153: flat[153], pixel154: flat[154], pixel155: flat[155], pixel156: flat[156], pixel157: flat[157], pixel158: flat[158], pixel159: flat[159], pixel160: flat[160], pixel161: flat[161], pixel162: flat[162], pixel163: flat[163], pixel164: flat[164], pixel165: flat[165], pixel166: flat[166], pixel167: flat[167], pixel168: flat[168], pixel169: flat[169], pixel170: flat[170], pixel171: flat[171], pixel172: flat[172], pixel173: flat[173], pixel174: flat[174], pixel175: flat[175], pixel176: flat[176], pixel177: flat[177], pixel178: flat[178], pixel179: flat[179], pixel180: flat[180], pixel181: flat[181], pixel182: flat[182], pixel183: flat[183], pixel184: flat[184], pixel185: flat[185], pixel186: flat[186], pixel187: flat[187], pixel188: flat[188], pixel189: flat[189], pixel190: flat[190], pixel191: flat[191], pixel192: flat[192], pixel193: flat[193], pixel194: flat[194], pixel195: flat[195], pixel196: flat[196], pixel197: flat[197], pixel198: flat[198], pixel199: flat[199], pixel200: flat[200], pixel201: flat[201], pixel202: flat[202], pixel203: flat[203], pixel204: flat[204], pixel205: flat[205], pixel206: flat[206], pixel207: flat[207], pixel208: flat[208], pixel209: flat[209], pixel210: flat[210], pixel211: flat[211], pixel212: flat[212], pixel213: flat[213], pixel214: flat[214], pixel215: flat[215], pixel216: flat[216], pixel217: flat[217], pixel218: flat[218], pixel219: flat[219], pixel220: flat[220], pixel221: flat[221], pixel222: flat[222], pixel223: flat[223], pixel224: flat[224], pixel225: flat[225], pixel226: flat[226], pixel227: flat[227], pixel228: flat[228], pixel229: flat[229], pixel230: flat[230], pixel231: flat[231], pixel232: flat[232], pixel233: flat[233], pixel234: flat[234], pixel235: flat[235], pixel236: flat[236], pixel237: flat[237], pixel238: flat[238], pixel239: flat[239], pixel240: flat[240], pixel241: flat[241], pixel242: flat[242], pixel243: flat[243], pixel244: flat[244], pixel245: flat[245], pixel246: flat[246], pixel247: flat[247], pixel248: flat[248], pixel249: flat[249], pixel250: flat[250], pixel251: flat[251], pixel252: flat[252], pixel253: flat[253], pixel254: flat[254], pixel255: flat[255], pixel256: flat[256], pixel257: flat[257], pixel258: flat[258], pixel259: flat[259], pixel260: flat[260], pixel261: flat[261], pixel262: flat[262], pixel263: flat[263], pixel264: flat[264], pixel265: flat[265], pixel266: flat[266], pixel267: flat[267], pixel268: flat[268], pixel269: flat[269], pixel270: flat[270], pixel271: flat[271], pixel272: flat[272], pixel273: flat[273], pixel274: flat[274], pixel275: flat[275], pixel276: flat[276], pixel277: flat[277], pixel278: flat[278], pixel279: flat[279], pixel280: flat[280], pixel281: flat[281], pixel282: flat[282], pixel283: flat[283], pixel284: flat[284], pixel285: flat[285], pixel286: flat[286], pixel287: flat[287], pixel288: flat[288], pixel289: flat[289], pixel290: flat[290], pixel291: flat[291], pixel292: flat[292], pixel293: flat[293], pixel294: flat[294], pixel295: flat[295], pixel296: flat[296], pixel297: flat[297], pixel298: flat[298], pixel299: flat[299], pixel300: flat[300], pixel301: flat[301], pixel302: flat[302], pixel303: flat[303], pixel304: flat[304], pixel305: flat[305], pixel306: flat[306], pixel307: flat[307], pixel308: flat[308], pixel309: flat[309], pixel310: flat[310], pixel311: flat[311], pixel312: flat[312], pixel313: flat[313], pixel314: flat[314], pixel315: flat[315], pixel316: flat[316], pixel317: flat[317], pixel318: flat[318], pixel319: flat[319], pixel320: flat[320], pixel321: flat[321], pixel322: flat[322], pixel323: flat[323], pixel324: flat[324], pixel325: flat[325], pixel326: flat[326], pixel327: flat[327], pixel328: flat[328], pixel329: flat[329], pixel330: flat[330], pixel331: flat[331], pixel332: flat[332], pixel333: flat[333], pixel334: flat[334], pixel335: flat[335], pixel336: flat[336], pixel337: flat[337], pixel338: flat[338], pixel339: flat[339], pixel340: flat[340], pixel341: flat[341], pixel342: flat[342], pixel343: flat[343], pixel344: flat[344], pixel345: flat[345], pixel346: flat[346], pixel347: flat[347], pixel348: flat[348], pixel349: flat[349], pixel350: flat[350], pixel351: flat[351], pixel352: flat[352], pixel353: flat[353], pixel354: flat[354], pixel355: flat[355], pixel356: flat[356], pixel357: flat[357], pixel358: flat[358], pixel359: flat[359], pixel360: flat[360], pixel361: flat[361], pixel362: flat[362], pixel363: flat[363], pixel364: flat[364], pixel365: flat[365], pixel366: flat[366], pixel367: flat[367], pixel368: flat[368], pixel369: flat[369], pixel370: flat[370], pixel371: flat[371], pixel372: flat[372], pixel373: flat[373], pixel374: flat[374], pixel375: flat[375], pixel376: flat[376], pixel377: flat[377], pixel378: flat[378], pixel379: flat[379], pixel380: flat[380], pixel381: flat[381], pixel382: flat[382], pixel383: flat[383], pixel384: flat[384], pixel385: flat[385], pixel386: flat[386], pixel387: flat[387], pixel388: flat[388], pixel389: flat[389], pixel390: flat[390], pixel391: flat[391], pixel392: flat[392], pixel393: flat[393], pixel394: flat[394], pixel395: flat[395], pixel396: flat[396], pixel397: flat[397], pixel398: flat[398], pixel399: flat[399], pixel400: flat[400], pixel401: flat[401], pixel402: flat[402], pixel403: flat[403], pixel404: flat[404], pixel405: flat[405], pixel406: flat[406], pixel407: flat[407], pixel408: flat[408], pixel409: flat[409], pixel410: flat[410], pixel411: flat[411], pixel412: flat[412], pixel413: flat[413], pixel414: flat[414], pixel415: flat[415], pixel416: flat[416], pixel417: flat[417], pixel418: flat[418], pixel419: flat[419], pixel420: flat[420], pixel421: flat[421], pixel422: flat[422], pixel423: flat[423], pixel424: flat[424], pixel425: flat[425], pixel426: flat[426], pixel427: flat[427], pixel428: flat[428], pixel429: flat[429], pixel430: flat[430], pixel431: flat[431], pixel432: flat[432], pixel433: flat[433], pixel434: flat[434], pixel435: flat[435], pixel436: flat[436], pixel437: flat[437], pixel438: flat[438], pixel439: flat[439], pixel440: flat[440], pixel441: flat[441], pixel442: flat[442], pixel443: flat[443], pixel444: flat[444], pixel445: flat[445], pixel446: flat[446], pixel447: flat[447], pixel448: flat[448], pixel449: flat[449], pixel450: flat[450], pixel451: flat[451], pixel452: flat[452], pixel453: flat[453], pixel454: flat[454], pixel455: flat[455], pixel456: flat[456], pixel457: flat[457], pixel458: flat[458], pixel459: flat[459], pixel460: flat[460], pixel461: flat[461], pixel462: flat[462], pixel463: flat[463], pixel464: flat[464], pixel465: flat[465], pixel466: flat[466], pixel467: flat[467], pixel468: flat[468], pixel469: flat[469], pixel470: flat[470], pixel471: flat[471], pixel472: flat[472], pixel473: flat[473], pixel474: flat[474], pixel475: flat[475], pixel476: flat[476], pixel477: flat[477], pixel478: flat[478], pixel479: flat[479], pixel480: flat[480], pixel481: flat[481], pixel482: flat[482], pixel483: flat[483], pixel484: flat[484], pixel485: flat[485], pixel486: flat[486], pixel487: flat[487], pixel488: flat[488], pixel489: flat[489], pixel490: flat[490], pixel491: flat[491], pixel492: flat[492], pixel493: flat[493], pixel494: flat[494], pixel495: flat[495], pixel496: flat[496], pixel497: flat[497], pixel498: flat[498], pixel499: flat[499], pixel500: flat[500], pixel501: flat[501], pixel502: flat[502], pixel503: flat[503], pixel504: flat[504], pixel505: flat[505], pixel506: flat[506], pixel507: flat[507], pixel508: flat[508], pixel509: flat[509], pixel510: flat[510], pixel511: flat[511], pixel512: flat[512], pixel513: flat[513], pixel514: flat[514], pixel515: flat[515], pixel516: flat[516], pixel517: flat[517], pixel518: flat[518], pixel519: flat[519], pixel520: flat[520], pixel521: flat[521], pixel522: flat[522], pixel523: flat[523], pixel524: flat[524], pixel525: flat[525], pixel526: flat[526], pixel527: flat[527], pixel528: flat[528], pixel529: flat[529], pixel530: flat[530], pixel531: flat[531], pixel532: flat[532], pixel533: flat[533], pixel534: flat[534], pixel535: flat[535], pixel536: flat[536], pixel537: flat[537], pixel538: flat[538], pixel539: flat[539], pixel540: flat[540], pixel541: flat[541], pixel542: flat[542], pixel543: flat[543], pixel544: flat[544], pixel545: flat[545], pixel546: flat[546], pixel547: flat[547], pixel548: flat[548], pixel549: flat[549], pixel550: flat[550], pixel551: flat[551], pixel552: flat[552], pixel553: flat[553], pixel554: flat[554], pixel555: flat[555], pixel556: flat[556], pixel557: flat[557], pixel558: flat[558], pixel559: flat[559], pixel560: flat[560], pixel561: flat[561], pixel562: flat[562], pixel563: flat[563], pixel564: flat[564], pixel565: flat[565], pixel566: flat[566], pixel567: flat[567], pixel568: flat[568], pixel569: flat[569], pixel570: flat[570], pixel571: flat[571], pixel572: flat[572], pixel573: flat[573], pixel574: flat[574], pixel575: flat[575], pixel576: flat[576], pixel577: flat[577], pixel578: flat[578], pixel579: flat[579], pixel580: flat[580], pixel581: flat[581], pixel582: flat[582], pixel583: flat[583], pixel584: flat[584], pixel585: flat[585], pixel586: flat[586], pixel587: flat[587], pixel588: flat[588], pixel589: flat[589], pixel590: flat[590], pixel591: flat[591], pixel592: flat[592], pixel593: flat[593], pixel594: flat[594], pixel595: flat[595], pixel596: flat[596], pixel597: flat[597], pixel598: flat[598], pixel599: flat[599], pixel600: flat[600], pixel601: flat[601], pixel602: flat[602], pixel603: flat[603], pixel604: flat[604], pixel605: flat[605], pixel606: flat[606], pixel607: flat[607], pixel608: flat[608], pixel609: flat[609], pixel610: flat[610], pixel611: flat[611], pixel612: flat[612], pixel613: flat[613], pixel614: flat[614], pixel615: flat[615], pixel616: flat[616], pixel617: flat[617], pixel618: flat[618], pixel619: flat[619], pixel620: flat[620], pixel621: flat[621], pixel622: flat[622], pixel623: flat[623], pixel624: flat[624], pixel625: flat[625], pixel626: flat[626], pixel627: flat[627], pixel628: flat[628], pixel629: flat[629], pixel630: flat[630], pixel631: flat[631], pixel632: flat[632], pixel633: flat[633], pixel634: flat[634], pixel635: flat[635], pixel636: flat[636], pixel637: flat[637], pixel638: flat[638], pixel639: flat[639], pixel640: flat[640], pixel641: flat[641], pixel642: flat[642], pixel643: flat[643], pixel644: flat[644], pixel645: flat[645], pixel646: flat[646], pixel647: flat[647], pixel648: flat[648], pixel649: flat[649], pixel650: flat[650], pixel651: flat[651], pixel652: flat[652], pixel653: flat[653], pixel654: flat[654], pixel655: flat[655], pixel656: flat[656], pixel657: flat[657], pixel658: flat[658], pixel659: flat[659], pixel660: flat[660], pixel661: flat[661], pixel662: flat[662], pixel663: flat[663], pixel664: flat[664], pixel665: flat[665], pixel666: flat[666], pixel667: flat[667], pixel668: flat[668], pixel669: flat[669], pixel670: flat[670], pixel671: flat[671], pixel672: flat[672], pixel673: flat[673], pixel674: flat[674], pixel675: flat[675], pixel676: flat[676], pixel677: flat[677], pixel678: flat[678], pixel679: flat[679], pixel680: flat[680], pixel681: flat[681], pixel682: flat[682], pixel683: flat[683], pixel684: flat[684], pixel685: flat[685], pixel686: flat[686], pixel687: flat[687], pixel688: flat[688], pixel689: flat[689], pixel690: flat[690], pixel691: flat[691], pixel692: flat[692], pixel693: flat[693], pixel694: flat[694], pixel695: flat[695], pixel696: flat[696], pixel697: flat[697], pixel698: flat[698], pixel699: flat[699], pixel700: flat[700], pixel701: flat[701], pixel702: flat[702], pixel703: flat[703], pixel704: flat[704], pixel705: flat[705], pixel706: flat[706], pixel707: flat[707], pixel708: flat[708], pixel709: flat[709], pixel710: flat[710], pixel711: flat[711], pixel712: flat[712], pixel713: flat[713], pixel714: flat[714], pixel715: flat[715], pixel716: flat[716], pixel717: flat[717], pixel718: flat[718], pixel719: flat[719], pixel720: flat[720], pixel721: flat[721], pixel722: flat[722], pixel723: flat[723], pixel724: flat[724], pixel725: flat[725], pixel726: flat[726], pixel727: flat[727], pixel728: flat[728], pixel729: flat[729], pixel730: flat[730], pixel731: flat[731], pixel732: flat[732], pixel733: flat[733], pixel734: flat[734], pixel735: flat[735], pixel736: flat[736], pixel737: flat[737], pixel738: flat[738], pixel739: flat[739], pixel740: flat[740], pixel741: flat[741], pixel742: flat[742], pixel743: flat[743], pixel744: flat[744], pixel745: flat[745], pixel746: flat[746], pixel747: flat[747], pixel748: flat[748], pixel749: flat[749], pixel750: flat[750], pixel751: flat[751], pixel752: flat[752], pixel753: flat[753], pixel754: flat[754], pixel755: flat[755], pixel756: flat[756], pixel757: flat[757], pixel758: flat[758], pixel759: flat[759], pixel760: flat[760], pixel761: flat[761], pixel762: flat[762], pixel763: flat[763], pixel764: flat[764], pixel765: flat[765], pixel766: flat[766], pixel767: flat[767], pixel768: flat[768], pixel769: flat[769], pixel770: flat[770], pixel771: flat[771], pixel772: flat[772], pixel773: flat[773], pixel774: flat[774], pixel775: flat[775], pixel776: flat[776], pixel777: flat[777], pixel778: flat[778], pixel779: flat[779], pixel780: flat[780], pixel781: flat[781], pixel782: flat[782], pixel783: flat[783])
                        print(prediction.labelProbability)
                        guess = String(prediction.label)
                        print(type(of: prediction.labelProbability))
                        var temp: [Int] = [0,0]
                        for (key, value) in prediction.labelProbability {
                            if value > prediction.labelProbability[String(temp[0])] {
                                temp[1] = temp[0]
                                temp[0] = key
                            } else if value > prediction.labelProbability[String(temp[0])] {
                                temp[1] = value
                            }
//
                        }
//                        second = temp[1]
                    }
                    catch{
                        
                    }
                    
                }label:{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).foregroundColor(.black).frame(width: 150, height: 50)
                        Text("Guess").foregroundColor(.white)
                    }
                }
                Button {
                    currentLine = Line()
                    lines = []
                    testImage = UIImage()
                    flat = [Double]()
                    guess = ""
                }label:{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).foregroundColor(.black).frame(width: 150, height: 50)
                        Text("Reset").foregroundColor(.white)
                    }
                }
                Text(guess).font(.largeTitle).foregroundColor(.white)
                Spacer()
            }
            Button {
                guess = second
            }label:{
                ZStack{
                    RoundedRectangle(cornerRadius: 10).foregroundColor(.black).frame(width: 150, height: 50)
                    Text("WRONG!").foregroundColor(.white)
                }
            }
            //Text(guess).font(.largeTitle).foregroundColor(.white)
            Spacer()
        }
        }
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {

        let scale = newWidth / image.size.width
        let newHeight = newWidth
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        image.draw(in: CGRectMake(0, 0, newWidth, newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()

        return newImage
    }
    
    func getPixelIntensities(image: UIImage) -> [Double] {
        guard let cgImage = image.cgImage else {
            return []
        }
        
        let width = cgImage.width
        let height = cgImage.height
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bytesPerPixel = 4
        let bytesPerRow = bytesPerPixel * width
        let bitsPerComponent = 8
        let bitmapInfo = CGImageAlphaInfo.noneSkipLast.rawValue
        
        guard let context = CGContext(data: nil, width: width, height: height, bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo) else {
            return []
        }
        
        context.draw(cgImage, in: CGRect(x: 0, y: 0, width: width, height: height))
        
        guard let rawData = context.data else {
            return []
        }
        
        let dataPointer = rawData.assumingMemoryBound(to: UInt8.self)
        var intensities: [Double] = []
        
        for y in 0..<height {
            for x in 0..<width {
                let offset = (y * bytesPerRow) + (x * bytesPerPixel)
                let red = CGFloat(dataPointer[offset]) / 255.0
                let green = CGFloat(dataPointer[offset + 1]) / 255.0
                let blue = CGFloat(dataPointer[offset + 2]) / 255.0
                let alpha = CGFloat(dataPointer[offset + 3]) / 255.0
                let intensity = (red + green + blue) / 3.0 * alpha
                intensities.append(Double(intensity) * 255.0)
            }
        }
        
        return intensities
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


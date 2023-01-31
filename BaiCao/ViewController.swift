//
//  ViewController.swift
//  BaiCao
//
//  Created by Phước Lộc Đinh Tạ on 31/01/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImgCompu1: UIImageView!
    @IBOutlet weak var ImgCompu2: UIImageView!
    @IBOutlet weak var ImgCompu3: UIImageView!
    
    
    @IBOutlet weak var ImgPlayer1: UIImageView!
    @IBOutlet weak var ImgPlayer2: UIImageView!
    @IBOutlet weak var ImgPlayer33: UIImageView!

    @IBOutlet weak var CorePlayerLabel: UILabel!
    @IBOutlet weak var CoreCompuLabel: UILabel!
    
    
    @IBOutlet weak var ResultCompuLabel: UILabel!
    @IBOutlet weak var ResultPlayerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createCards()
    }
    var bobai : [String] = []
    @IBAction func RutBai(_ sender: Any) {
        var sumCardsPlayer : [String] = []
        var sumCardsComputer : [String] = []
        var count = bobai.count
        
        //PLAYER
        var randomPlayer : Int = Int.random(in: 0...count)
        var imgageNamePlayer  = bobai[randomPlayer]
        sumCardsPlayer.insert(imgageNamePlayer, at: 0)
        ImgPlayer1.image = UIImage(named: imgageNamePlayer)
        bobai.remove(at: randomPlayer)
        
        //COMPUTER
        count = bobai.count
        var randomCompu : Int = Int.random(in: 0...count)
        var imgageNameCompu = bobai[randomCompu]
        sumCardsComputer.insert(imgageNameCompu, at: 0)
        ImgCompu1.image = UIImage(named: imgageNameCompu)
        bobai.remove(at: randomCompu)
        
        //PLAYER
        count = bobai.count
        randomPlayer = Int.random(in: 0...count)
         imgageNamePlayer  = bobai[randomPlayer]
        sumCardsPlayer.insert(imgageNamePlayer, at: 1)
        ImgPlayer2.image = UIImage(named: imgageNamePlayer)
        bobai.remove(at: randomPlayer)
        
        //COMPUTER
        count = bobai.count
        randomCompu  = Int.random(in: 0...count)
        imgageNameCompu = bobai[randomCompu]
        sumCardsComputer.insert(imgageNameCompu, at: 1)
        ImgCompu2.image = UIImage(named: imgageNameCompu)
        bobai.remove(at: randomCompu)
        
        //PLAYER
        count = bobai.count
        randomPlayer = Int.random(in: 0...count)
         imgageNamePlayer  = bobai[randomPlayer]
        sumCardsPlayer.insert(imgageNamePlayer, at: 2)
        ImgPlayer33.image = UIImage(named: imgageNamePlayer)
        bobai.remove(at: randomPlayer)
        
        //COMPUTER
        count = bobai.count
        randomCompu = Int.random(in: 0...count)
        imgageNameCompu = bobai[randomCompu]
        sumCardsComputer.insert(imgageNameCompu, at: 2)
        ImgCompu3.image = UIImage(named: imgageNameCompu)
        bobai.remove(at: randomCompu)
        
       
     /// SUM CORE PLAYER
        let corePlayer = SumCore(sumCardsPlayer)
        /// SUM CORE Computer
        let coreCompu = SumCore(sumCardsComputer)
        CorePlayerLabel.text  = "\(corePlayer)"
        CoreCompuLabel.text = "\(coreCompu)"
        if corePlayer > coreCompu
        {
            if corePlayer <= 21  && coreCompu > 21 {
                ///
                ResultPlayerLabel.text = "THẮNG"
                ResultPlayerLabel.textColor = .green
                ////
                ResultCompuLabel.text = "THUA"
                ResultCompuLabel.textColor = .red
            }else if corePlayer > 21  && coreCompu > 21 {
                ///
                ResultPlayerLabel.text = "THUA"
                ResultPlayerLabel.textColor = .red
                ////
                ResultCompuLabel.text = "THUA"
                ResultCompuLabel.textColor = .red
            }else if corePlayer > 21 && coreCompu <= 21{
                ///
                ResultPlayerLabel.text = "THUA"
                ResultPlayerLabel.textColor = .red
                ////
                ResultCompuLabel.text = "THẮNG"
                ResultCompuLabel.textColor = .green
            }else if corePlayer <= 21 && coreCompu <= 21{
                if corePlayer > coreCompu {
                    ///
                    ResultPlayerLabel.text = "THẮNG"
                    ResultPlayerLabel.textColor = .green
                    ////
                    ResultCompuLabel.text = "THUA"
                    ResultCompuLabel.textColor = .red
                }
            }
        }
        
        else if corePlayer < coreCompu
        {
            if corePlayer <= 21  && coreCompu > 21 {
                ///
                ResultPlayerLabel.text = "THẮNG"
                ResultPlayerLabel.textColor = .green
                ////
                ResultCompuLabel.text = "THUA"
                ResultCompuLabel.textColor = .red
            }else if corePlayer > 21  && coreCompu > 21 {
                ///
                ResultPlayerLabel.text = "THUA"
                ResultPlayerLabel.textColor = .red
                ////
                ResultCompuLabel.text = "THUA"
                ResultCompuLabel.textColor = .red
            }else if corePlayer > 21 && coreCompu <= 21{
                ///
                ResultPlayerLabel.text = "THUA"
                ResultPlayerLabel.textColor = .red
                ////
                ResultCompuLabel.text = "THẮNG"
                ResultCompuLabel.textColor = .green
            }else if corePlayer <= 21 && coreCompu <= 21{
                if corePlayer < coreCompu {
                    ///
                    ResultPlayerLabel.text = "THUA"
                    ResultPlayerLabel.textColor = .red
                    ////
                    ResultCompuLabel.text = "THẮNG"
                    ResultCompuLabel.textColor = .green
                }
            }
        }
        else if corePlayer  == coreCompu {
            ///
            ResultPlayerLabel.text = "HOÀ"
            ResultPlayerLabel.textColor = .gray
            ////
            ResultCompuLabel.text = "HOÀ"
            ResultCompuLabel.textColor = .gray
        }

        
        bobai.removeAll()
        return viewDidLoad()
    }
    func createCards(){
        let cardsType = ["c","r","ch","b"]
        (1...13).forEach({ (index) in
            cardsType.forEach({ (type) in
                let name = "\(index)_\(type).png"
                bobai.append(name)
            })
        })
    }
    func SumCore(_ ListCards : [String] ) -> Int {
        var core = 0
        ListCards.forEach({ (cards) in
            if (cards == "1_c.png") ||
                (cards == "1_r.png") ||
                (cards == "1_ch.png") ||
                (cards == "1_b.png"){
                core += 1
            }else if (cards == "2_c.png") ||
                        (cards == "2_r.png") ||
                        (cards == "2_ch.png") ||
                        (cards == "2_b.png"){
                core += 2
            }else if (cards == "3_c.png") ||
                        (cards == "3_r.png") ||
                        (cards == "3_ch.png") ||
                        (cards == "3_b.png"){
                core += 3
            }else if (cards == "4_c.png") ||
                        (cards == "4_r.png") ||
                        (cards == "4_ch.png") ||
                        (cards == "4_b.png"){
                core += 4
            }else if (cards == "5_c.png") ||
                        (cards == "5_r.png") ||
                        (cards == "5_ch.png") ||
                        (cards == "5_b.png"){
                core += 5
            }else if (cards == "6_c.png") ||
                        (cards == "6_r.png") ||
                        (cards == "6_ch.png") ||
                        (cards == "6_b.png"){
                core += 6
            }else if (cards == "7_c.png") ||
                        (cards == "7_r.png") ||
                        (cards == "7_ch.png") ||
                        (cards == "7_b.png"){
                core += 7
            }else if (cards == "8_c.png") ||
                        (cards == "8_r.png") ||
                        (cards == "8_ch.png") ||
                        (cards == "8_b.png"){
                core += 8
            }else if (cards == "9_c.png") ||
                        (cards == "9_r.png") ||
                        (cards == "9_ch.png") ||
                        (cards == "9_b.png"){
                core += 9
            }else if (cards == "10_c.png") ||
                        (cards == "10_r.png") ||
                        (cards == "10_ch.png") ||
                        (cards == "10_b.png"){
                core += 10
            }else if (cards == "11_c.png") ||
                        (cards == "11_r.png") ||
                        (cards == "11_ch.png") ||
                        (cards == "11_b.png"){
                core += 10
            }else if (cards == "12_c.png") ||
                        (cards == "12_r.png") ||
                        (cards == "12_ch.png") ||
                        (cards == "12_b.png"){
                core += 10
            }else if (cards == "13_c.png") ||
                        (cards == "13_r.png") ||
                        (cards == "13_ch.png") ||
                        (cards == "13_b.png"){
                core += 10
            }
          
        })
        return core
    }
    
}


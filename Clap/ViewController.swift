//
//  ViewController.swift
//  Clap
//
//  Created by 柳本宗達 on 2017/04/09.
//  Copyright © 2017年 柳本宗達. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{
    @IBOutlet var clapPickerView: UIPickerView!
    var audioPlayer : AVAudioPlayer!
    var soundCount : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let soundFilePath = Bundle.main.path(forResource: "clap", ofType: "wav" )!
        let fileURL = URL(fileURLWithPath: soundFilePath)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
        }catch{
            print("ファイルが読み込めません")
        }
        clapPickerView.delegate = self
        clapPickerView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return 10
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return "\(row+1)回"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        soundCount = row
    }
    

        @IBAction func playButtun(){
           audioPlayer.numberOfLoops = soundCount
            audioPlayer.play()
        }
        

        // Dispose of any resources that can be recreated.
    


}


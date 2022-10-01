//
//  ViewController.swift
//  SimplyPiano
//
//  Created by Вадим Лавор on 1.10.22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var cSoundButton: UIButton!
    @IBOutlet weak var dSoundButton: UIButton!
    @IBOutlet weak var eSoundButton: UIButton!
    @IBOutlet weak var fSoundButton: UIButton!
    @IBOutlet weak var gSoundButton: UIButton!
    @IBOutlet weak var aSoundButton: UIButton!
    @IBOutlet weak var bSoundButton: UIButton!
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func soundButtonClicked(_ sender: UIButton) {
        if let titleButton = sender.title(for: .normal) {
            playSound(sender: titleButton)
        }
    }
    
    func playSound(sender: String) {
        let url = Bundle.main.url(forResource: "Sounds/" + sender, withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        audioPlayer.play()
    }
    
    func setupView(){
        let soundButtons = [cSoundButton, dSoundButton, eSoundButton, fSoundButton, gSoundButton, aSoundButton, bSoundButton]
        for soundButton in soundButtons {
            soundButton?.layer.masksToBounds = true
            soundButton?.layer.cornerRadius = 20
        }
        self.setGradientBackground(view: self.view, colorTop: UIColor(red: 52/255, green: 148/255, blue: 230/255, alpha: 1).cgColor, colorBottom: UIColor(red: 210/255, green: 109/255, blue: 180/255, alpha: 1).cgColor)
    }
    
    func setGradientBackground(view: UIView, colorTop: CGColor = UIColor(red: 29.0/255.0, green: 34.0/255.0, blue:234.0/255.0, alpha: 1.0).cgColor, colorBottom: CGColor = UIColor(red: 38.0/255.0, green: 0.0/255.0, blue: 6.0/255.0, alpha: 1.0).cgColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}

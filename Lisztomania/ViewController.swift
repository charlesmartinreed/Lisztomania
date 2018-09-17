//
//  ViewController.swift
//  Lisztomania
//
//  Created by Charles Martin Reed on 9/17/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //MARK:- @IBOutlets
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var scrubbingSlider: UISlider!
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //try finding the audio file
        if let audioPath = Bundle.main.path(forResource: "hungarian", ofType: "mp3") {
            //if you can find the file, try loading it into our audio player
            do {
                try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                audioPlayer.volume = 0.5
            } catch {
                print("could not play back file")
            }
        }
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        audioPlayer.play()
    }
    

    @IBAction func pauseButtonTapped(_ sender: Any) {
        audioPlayer.pause()
    }
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        audioPlayer.stop()
        
        //with this line, stopping the song will cause it to return to the beginning at next play.
        audioPlayer.currentTime = 0
    }
    
    
    @IBAction func volumeChanged(_ sender: UISlider) {
        audioPlayer.volume = (volumeSlider.value / 100)
    }
    
    @IBAction func scrubbedChanged(_ sender: UISlider) {
    }
    
    
}


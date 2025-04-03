//
//  VideoViewController.swift
//  BMI-KTH
//
//  Created by 소프트웨어컴퓨터 on 2024/11/14.
//

import UIKit
import AVKit

class VideoViewController: UIViewController {
    @IBAction func playVideo(_ sender: UIButton) {
        
        let videoPath : String? = Bundle.main.path(forResource: "bmi", ofType: "mp4")
        let videoURL = URL(filePath: videoPath!)
        let player = AVPlayer(url: videoURL)
        
       let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

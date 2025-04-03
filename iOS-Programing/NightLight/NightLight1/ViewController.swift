import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBAction func switchDidChange(_ sender: UISwitch) {
        if sender.isOn {
        startTimerAndMusic()
        }else {
        stopTimerAndMusic()
        }
    }
    @IBOutlet weak var musicSwitch: UISwitch!
    var colorChangeTimer: Timer?
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        view.addGestureRecognizer(tapGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func applicationWillEnterForeground() {
        startTimerAndMusic()
    }
    
    @objc func handleTapGesture() {
        stopTimerAndMusic()
        colorChangeTimer = nil
        audioPlayer = nil
        
        let alert = UIAlertController(title: "알림", message: "앱을 종료해주세요.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func startTimerAndMusic() {
        // 배경 음악 재생 설정
        if let soundURL = Bundle.main.url(forResource: "bgm", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer.play()
            } catch {
                print("음악 파일 로드 또는 재생 중 에러 발생: \(error)")
            }
        }
        
        // 1초마다 반복되는 타이머 생성
        colorChangeTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            // 랜덤한 빨간색, 초록색, 파란색 값을 생성
            let red = CGFloat(arc4random_uniform(256)) / 255.0
            let green = CGFloat(arc4random_uniform(256)) / 255.0
            let blue = CGFloat(arc4random_uniform(256)) / 255.0
            
            // 생성된 랜덤 색상을 사용하여 ViewController의 배경색 설정
            self.view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
    
    func stopTimerAndMusic() {
        // 타이머와 음악 재생 중지
        colorChangeTimer?.invalidate()
        colorChangeTimer = nil
        audioPlayer.stop()
    }
}

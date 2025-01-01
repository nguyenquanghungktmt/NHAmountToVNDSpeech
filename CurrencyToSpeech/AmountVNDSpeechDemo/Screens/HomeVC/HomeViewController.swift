//
//  HomeViewController.swift
//  AmountVNDSpeechDemo
//
//  Created by Nguyen Quang Hung on 15/05/2024.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }


    @IBAction func tappedClickHere(_ sender: UIButton) {
        print("hungnq - click on button Click Here")
    }
    
    
    @IBAction func tappedLogin(_ sender: UIButton) {
        print("hungnq - click on button Login")
    }
    
    
    @IBAction func tappedOpenDetail(_ sender: UIButton) {
        let detailVC = DetailViewController(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func tappedOpenTimeSchdule(_ sender: UIButton) {
        let scheduleVC = TimeSchduleViewController(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(scheduleVC, animated: true)
    }
    
    
    @IBAction func tappedTextToSpeech(_ sender: Any) {
        let vc = AmountVoiceViewController(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension UIViewController{
    
    func showToast(message : String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height/2 - 20, width: 300, height: 40))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        toastLabel.textColor = UIColor.white
        toastLabel.font = UIFont.systemFont(ofSize: 15.0)
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 14;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 0.3, delay: 2.0, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}


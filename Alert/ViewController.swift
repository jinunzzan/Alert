//
//  ViewController.swift
//  Alert
//
//  Created by Eunchan Kim on 2023/01/02.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lampImg: UIImageView!
    
    let imgOn = UIImage(named: "on.jpg")
    let imgOff = UIImage(named: "off.jpg")
    let imgRemove = UIImage(named: "1.jpg")
    
    var isLampOn = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lampImg.image = imgOn
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampOn==true){
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
            
        }else{
            lampImg.image = imgOn
            isLampOn = true
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn {
            let lampOffAction = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {ACTION in self.lampImg.image = self.imgOff
                self.isLampOn = false})
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            lampOffAction.addAction(offAction)
            lampOffAction.addAction(cancelAction)
            present(lampOffAction, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnLompRemove(_ sender: UIButton) {
        let lampRemoveAction = UIAlertController(title: "램프제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(title: "아니오, 끕니다", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgOff
            self.isLampOn = false
        })
        let onAction = UIAlertAction(title: "아니오, 켭니다", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgOn
            self.isLampOn = true
        })
        let removeAction = UIAlertAction(title: "네, 제거합니다", style: UIAlertAction.Style.destructive, handler: {
            ACTION in self.lampImg.image = self.imgRemove
            self.isLampOn = false
        })
        lampRemoveAction.addAction(offAction)
        lampRemoveAction.addAction(onAction)
        lampRemoveAction.addAction(removeAction)
        present(lampRemoveAction, animated: true, completion: nil)
    }
}


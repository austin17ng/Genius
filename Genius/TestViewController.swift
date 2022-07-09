//
//  TestViewController.swift
//  Genius
//
//  Created by Nguyễn Tùng on 07/07/2022.
//

import UIKit

class TestViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        image.addoverlay()
        
//        let headerVC = DetailHeaderViewController()
//        view.addSubview(headerVC.view)
//        self.addChild(headerVC)
        

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

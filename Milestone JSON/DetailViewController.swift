//
//  DetailViewController.swift
//  Milestone JSON
//
//  Created by Luciene Ventura on 18/05/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedInfo: Country?

    @IBOutlet var lavelView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
            lavelView.text = selectedInfo?.info
            view.addSubview(lavelView)
        
      
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

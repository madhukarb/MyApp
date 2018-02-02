//
//  PosterViewController.swift
//  MyApp
//
//  Created by Madhukar Bommala on 1/20/18.
//  Copyright © 2018 Madhukar. All rights reserved.
//

import UIKit
import FirebaseStorage

class PosterViewController: UIViewController {
    //var poster : UIImage?
    
    
    @IBOutlet weak var posterImageView: UIImageView!
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        posterImageView.image = image
        var imageRef: StorageReference {
            return Storage.storage().reference().child("Posters").child("DSC_1598.jpg")
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let downLoadTask = imageRef.getData(maxSize: 1024 * 1024 * 10) { (data, error) in
                if error == nil{
                    if let data = data {
                        //self.poster = UIImage(data: data)
                         self.image = UIImage(data: data)
                    }
                } else{
                    print(error.debugDescription)
                }
                
            }
            downLoadTask.observe(.success) { (snapshot) in
                print("download complete")
                DispatchQueue.main.async {
                    self.posterImageView.image = self.image
                }
            }
            downLoadTask.resume()
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

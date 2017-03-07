//
//  ViewController.swift
//  BJJListaTakmicara
//
//  Created by Vuk on 6/13/16.
//  Copyright © 2016 User. All rights reserved.///
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        ucitajFajlSaTakmicarima()
    }
    
    var takmicari = [String]()
    
    func ucitajFajlSaTakmicarima() {
        let putanja = Bundle.main.path(forResource: "bjjTakmicariNovo", ofType: "txt")
        let sadrzajFajla = try! String(contentsOfFile: putanja!, encoding: String.Encoding.utf8)
        takmicari = sadrzajFajla.components(separatedBy: "\n")
    }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return takmicari.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celija = tableView.dequeueReusableCell(withIdentifier: "BJJCelija", for: indexPath)
        let podatak = takmicari[indexPath.row]
        let nizPodataka = podatak.components(separatedBy: "##")
        celija.textLabel!.text = "\(nizPodataka[0])  |  \(nizPodataka[2])"
        celija.detailTextLabel!.text = "Tim: \(nizPodataka[1]); Kategorija: \(nizPodataka[3])"
        
        if let webPutanjaSlike = URL(string: "\(nizPodataka[5])"){
            if let informacija = try? Data(contentsOf: webPutanjaSlike){
                
                celija.imageView?.frame = CGRect(x: 5 , y: 5, width: 50, height: 50)
                celija.imageView?.image = UIImage(data: informacija)
            }
            
        }
        
        return celija
        
    }
    
}


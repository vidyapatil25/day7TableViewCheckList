//
//  ViewController.swift
//  day7TableViewCheckList
//
//  Created by Felix-ITS016 on 20/11/19.
//  Copyright © 2019 Felix. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    var selected = [String]()
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        //cell.accessoryType = .detailDisclosureButton
        
        cell.accessoryType = .none
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        print(cell!.textLabel!.text!)
        if cell?.accessoryType == .checkmark
        {
            cell?.accessoryType = .none
            let index = selected.firstIndex(of: cell!.textLabel!.text!)
            selected.remove(at: index!)
        }
        else
        {
            cell?.accessoryType = .checkmark
            selected.append(cell!.textLabel!.text!)
        }
        print(selected)
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        print(cell!.textLabel!.text!)
        let next = storyboard?.instantiateViewController(withIdentifier: "NextViewController")as! NextViewController
        //next.name = nameArray
        navigationController?.pushViewController(next, animated:true )
        
    }
    
let nameArray = ["Vidya","Sai","Varsha","Ashvini","Trupti"]
    
    
    @IBAction func NextButton(_ sender: UIButton) {
        
        let next = storyboard?.instantiateViewController(withIdentifier: "NextViewController")as! NextViewController
        next.selected1 = selected 
        navigationController?.pushViewController(next, animated:true )
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}


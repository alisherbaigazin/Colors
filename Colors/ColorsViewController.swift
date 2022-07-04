//
//  ColorsViewController.swift
//  Colors
//
//  Created by Alisher Baigazin on 05.07.2022.
//

import UIKit

class ColorsViewController: UIViewController {
    var colors: [UIColor] = []
    
    enum Cells {
        static let colorCell = "colorCell"
    }
    
    enum Segues {
        static let toDetails = "toDetailsVC"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appendColor()
    }
    
    func appendColor() {
        for _ in 0..<50 {
            colors.append(.random())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? DetailsViewController {
            destinationVC.color = sender as? UIColor
        }
    }
}

extension ColorsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colorCell) else {
            return UITableViewCell()
        }
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: Segues.toDetails, sender: color)
    }
}
